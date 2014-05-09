<?php

// How to use it to build website?
// How to use it to build REST API?

// routers ==> predefined
// initialize routers ==> Controller <==> Model <==> View

//

require_once (__DIR__ . "/../vendor/autoload.php");
require_once (__DIR__ . "/config.php");

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

$app["debug"] = true;
$app['asset.host'] = 'http://localhost/image/';

$app->register(new Silex\Provider\DoctrineServiceProvider(), $config["db"]);

$app->register(new Silex\Provider\HttpCacheServiceProvider(), $config["cache"]);

// modules ==> controller ==> model
// how to define modules ?

$basename = "/gajeweb";
$api_v1 = "api/v1/";

use Model\Model;
Model::$DB = $app['db'];

// user / add

$api = $app["controllers_factory"];

$api->get ("user/add", function () use ($app) {

    return "user/add";
});

// image / post

$api->post ("image/upload/{userId}", function ($userId) use ($app) {

    return "image/upload/{userId}";
});

$api->before (function (Request $request) {

    return null;
});

$app->mount($basename . "/" . $api_v1, $api);
$app->run();


