<?php

// How to use it to build website?
// How to use it to build REST API?

// routers ==> predefined
// initialize routers ==> Controller <==> Model <==> View

//

require_once(__DIR__ . "/../vendor/autoload.php");

$app = new Silex\Application();

// handling errors

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


$app->error(function (\Exception $e, $code) use ($app) {

    $message = $app->escape($e->getMessage());

    switch ($code) {
        case 404:
            $message = "404 : " . $message;
            break;
        case 500:
            $message = "500 : " . $message;
        default:
            $message = 'Unknow : ' . $message;
    }

    $error = array(
        "status" => "failure",
        "message" => $message
    );

    if ($code > 500) {
        $code = 500;
    }

    return $app->json($error, $code);
});

//use Symfony\Component\Debug\ErrorHandler;
//ErrorHandler::register();

//use Symfony\Component\Debug\ExceptionHandler;
//ExceptionHandler::register();

$os = php_uname();

if (strtolower(substr($os, 0, 3)) == "dar") {
    require_once(__DIR__ . "/config-test.php");
} else {
    require_once(__DIR__ . "/config.php");
}

// define global value for app

$app["debug"] = $config["debug"];
$app["http_cache_enable"] = $config["http_cache_enable"];

$app['upload.image.host'] = $config["upload.image.host"];
$app['upload.folder'] = $config["upload.folder"];
$app['upload.folder.image'] = $config["upload.folder.image"];

$app->register(new Silex\Provider\DoctrineServiceProvider(), $config["db"]);

// modules ==> controller ==> model
// how to define modules ?

$basename = $config["basename"];
$api_v1 = $config["router_apiv1"];


use Model\BaseModel;

BaseModel::$DB = $app['db'];

//==========================
// API module routers
//==========================

use Api\Controller;

$api = $app["controllers_factory"];

// http://www.thebuzzmedia.com/designing-a-secure-rest-api-without-oauth-authentication/
// http://www.faqs.org/rfcs/rfc2104.html
// client & server both has the private key, and client and server both has public key too
// client will use private key to encrypt the message to an token (HASH)
// server will use private key to decrypt the message to an token (HASH)

// API key, API secret (salt) ==> client & server both now, all in code
// public info == token = hash (info, API secret) + time() ==> its from who (API key) and what hash (info, API secret)

// string hash_hmac ( string $algo , string $data , string $key [, bool $raw_output = false ] )
// http://stackoverflow.com/questions/14516191/xcode-ios-hmac-sha-256-hashing

// app domain ==>

// app ==> hash (API Key, Fx(API secret, time())) + ticket=timestamp
// PHP ==> hash (API Key, Fx(API secret, $_GET['ticket']))
// PHP ==> now () - $_GET['ticket'] >= 5 min : expired

// 1. attacker don't know API Key, API secret, but he can copy it
// 2. attacker don't know Fx, so his copy is mistake because time elapsed



$api = new \Api\Api($app, $config);
$api->register();


$admin = new Admin\Admin($app, $config);
$admin->register();

//==================================
// test case
//==================================

if ($app["debug"]) {

    $test = new TestCase ($app, $config);
    $test->register();
}

//========================================
// what's different between those two?
//========================================
use Silex\Provider\HttpCacheServiceProvider;

if ($config["http_cache_enable"]) {

    $app->register(new HttpCacheServiceProvider(), $config["http_cache"]);
    $app["http_cache"]->run();

} else {
    $app->run();
}




