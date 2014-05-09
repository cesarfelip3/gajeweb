<?php

// How to use it to build website?
// How to use it to build REST API?

// routers ==> predefined
// initialize routers ==> Controller <==> Model <==> View

//

require_once (__DIR__ . "/../vendor/autoload.php");
require_once (__DIR__ . "/config.php");

$app = new Silex\Application();

$app["debug"] = true;
$app->register(new Silex\Provider\DoctrineServiceProvider(), $dbconfig);

$basename = "/gajeweb";

$id = 0;
$router_api = array (
    "blog/{id}" => 0,
);

foreach ($router_api as $router => $parameter) {
    $app->get ($basename . "/" . $router, function ($id) use ($app) {

        $sql = "SELECT * FROM image WHERE image_id = ?";
        $post = $app['db']->fetchAssoc($sql, array((int) 0));

        return "hello router = " . $id;

    });
}

$app->run();


