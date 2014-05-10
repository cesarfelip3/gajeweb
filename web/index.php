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
$app['upload.folder'] = __DIR__ . "/upload/";

$app->register(new Silex\Provider\DoctrineServiceProvider(), $config["db"]);
$app->register(new Silex\Provider\HttpCacheServiceProvider(), $config["cache"]);

// modules ==> controller ==> model
// how to define modules ?

$basename = $config["basename"];
$api_v1 = $config["router_apiv1"];

use Model\Model;
Model::$DB = $app['db'];

//==========================
// API module routers
//==========================

use Api\Controller;

$api = $app["controllers_factory"];

// auth, first it's valid app user, and then we gave them ....

$api->post ("auth", function (Request $request) use ($app) {

    $controller = new Controller\AuthController($request, $app);

    $token = $request->get ("token");
    $secrect = $request->get ("secrect");
    $appdomain = $request->get ("domain");
        
});

$api->post ("user/add", function (Request $request) use ($app) {

    $controller = new Controller\UserController($request, $app);

    if ($ret == false) {
        $error = $controller->getError ();
        $app->json($error, 404);
    }

    return "user/add";
});

// image / upload
$api->post ("image/upload/{userId}", function (Request $request, $userId) use ($app) {

    $controller = new Controller\ImageController($request, $app);
    $ret = $controller->handleUpload($app["upload.folder"], $userId);

    if ($ret == false) {
        $error = $controller->getError ();
        $app->json($error, 404);
    }
    return "image/upload/{userId}";
});

$api->before (function (Request $request) {

    return null;
});

$app->mount($basename . "/" . $api_v1, $api);

//==================================
// test case
//==================================

// tests are here, but not right place I think

$test = $app["controllers_factory"];
$test->get ("upload/image", function () use ($app) {


    $file_name_with_full_path = realpath(__DIR__ . "/pi-512.png");
    $post = array('extra_info' => '123456','fileinfo'=>'@' . $file_name_with_full_path);

    $target_url = "http://localhost/gajeweb/api/v1/image/upload/3";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,$target_url);
    curl_setopt($ch, CURLOPT_POST,1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
    $result=curl_exec ($ch);
    curl_close ($ch);

    print_r ($result);

    exit;
});

$app->mount($basename . "/testcase/", $test);


$app->run();


