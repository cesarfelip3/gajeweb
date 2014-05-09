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

$app->register(new Silex\Provider\DoctrineServiceProvider(), $dbconfig);

// modules ==> controller ==> model
// how to define modules ?

$basename = "/gajeweb";
$api_v1 = "api/v1/";

$id= 'id';
$router_api = array (
    $api_v1 . "test/{{$id}}" => $id,
    $api_v1 . "image/upload/{{$id}}" => $id,
);

use Model\Image;
use Model\Model;

Model::$DB = $app['db'];
$image = new Image ();
print_r ($image);
exit;

foreach ($router_api as $router => $id) {
    $app->get ($basename . "/" . $router, function ($id) use ($app) {



        $sql = "SELECT * FROM image WHERE image_id = ?";
        $post = $app['db']->fetchAssoc($sql, array((int) 0));

        return "hello router = " . $id;

    });
}

$app->before(function (Request $request) {
    // ...
});

$app->run();


