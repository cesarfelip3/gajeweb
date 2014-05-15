<?php

// How to use it to build website?
// How to use it to build REST API?

// routers ==> predefined
// initialize routers ==> Controller <==> Model <==> View

//

require_once(__DIR__ . "/../vendor/autoload.php");
require_once(__DIR__ . "/config.php");

$app = new Silex\Application();

// handling errors

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/*
$app->error(function (\Exception $e, $code) {
    switch ($code) {
        case 404:
            $message = 'The requested page could not be found.';
            break;
        default:
            $message = 'We are sorry, but something went terribly wrong.';
    }
    return new Response($message);
});*/

// define global value for app

//$app["test"] = true;
$app["debug"] = true;
$app['asset.host'] = 'http://localhost/image/';
$app['upload.folder'] = realpath(__DIR__ . "/../../upload/") . DIRECTORY_SEPARATOR;

$app['upload.folder.image'] = $app["upload.folder"] . "image" . DIRECTORY_SEPARATOR;

$app->register(new Silex\Provider\DoctrineServiceProvider(), $config["db"]);
$app->register(new Silex\Provider\HttpCacheServiceProvider(), $config["cache"]);

// modules ==> controller ==> model
// how to define modules ?

$basename = $config["basename"];
$api_v1 = $config["router_apiv1"];

// http://docs.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/data-retrieval-and-manipulation.html#insert

use Model\Model;

Model::$DB = $app['db'];

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

// there is no way to prevent API attack, if they copy everything in your network traffics...
// we have to know its from some client, all information are from network traffics....
// what if its same ? unless your used random API secret every time, and the network traffics changed every time...
// otherwise you can't stop it

$api->post("auth", function (Request $request) use ($app) {

    $controller = new Controller\AuthController($request, $app);

    $token = $request->get("token");
    $secrect = $request->get("secrect");
    $appdomain = $request->get("domain");

});

// tested

$api->post("user/add", function (Request $request) use ($app) {

    $controller = new Controller\UserController($request, $app);
    $ret = $controller->addUser();

    $status = 200;
    if ($ret) {
        $status = 200;
    } else {
        $status = 400;
    }

    return $app->json ($controller->getError(), $status);
});

// image / upload
$api->post("image/upload/{userId}", function (Request $request, $userId) use ($app) {

    $controller = new Controller\ImageController($request, $app);
    $ret = $controller->handleUpload($app["upload.folder.image"], $app->escape($userId));

    $status = 200;
    if ($ret) {
        $status = 200;
    } else {
        $status = 400;
    }

    return $app->json ($controller->getError(), $status);
});

$api->before(function (Request $request) {

    return null;
});

$app->mount($basename . "/" . $api_v1, $api);

//==================================
// test case
//==================================

// tests are here, but not right place I think

$test = $app["controllers_factory"];
$test->get("image/upload/{userId}", function ($userId) use ($app) {

    $file_name_with_full_path = realpath(__DIR__ . "/pi-512.png");
    $post = array('extra_info' => '123456', 'fileinfo' => '@' . $file_name_with_full_path);

    $target_url = "http://localhost/gajeweb/api/v1/image/upload/$userId";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $target_url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result = curl_exec($ch);
    curl_close($ch);

    print_r ($result);

    exit;
});

$test->get("user/add", function () use ($app) {

    $file_name_with_full_path = realpath(__DIR__ . "/pi-512.png");
    $post = array(
        'email' => '123456@abc.com',
        'token' => 'bbad2323adfadsf'
    );

    $target_url = "http://localhost/gajeweb/api/v1/user/add";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $target_url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result = curl_exec($ch);
    curl_close($ch);

    print_r ($result);

    exit;
});

$app->mount($basename . "/" . $config["router_test"], $test);


$app->run();


