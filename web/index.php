<?php

// How to use it to build website?
// How to use it to build REST API?

// routers ==> predefined
// initialize routers ==> Controller <==> Model <==> View

//

require_once (__DIR__ . "/../vendor/autoload.php");
require_once (__DIR__ . "/config.php");

$app = new Silex\Application();

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
$app->error(function (\Exception $e, $code) {
    switch ($code) {
        case 404:
            $message = 'The requested page could not be found.';
            break;
        default:
            $message = 'We are sorry, but something went terribly wrong.';
    }
    return new Response($message);
});

$app["debug"] = true;
$app['asset.host'] = 'http://localhost/image/';

$app->register(new Silex\Provider\DoctrineServiceProvider(), $dbconfig);

$basename = "/gajeweb";
$api_v1 = "api/v1/";

$id= 'id';
$router_api = array (
    $api_v1 . "image/upload/{{$id}}" => $id,
);

foreach ($router_api as $router => $id) {
    $app->post ($basename . "/" . $router, function ($id) use ($app) {


        $sql = "SELECT * FROM image WHERE image_id = ?";
        $post = $app['db']->fetchAssoc($sql, array((int) 0));

        return "hello router = " . $id;

    }
}

$app->before(function (Request $request) {
    // ...
});

$app->run();


