<?php

// How to use it to build website?
// How to use it to build REST API?

// routers ==> predefined
// initialize routers ==> Controller <==> Model <==> View

//

require_once (__DIR__ . "/../vendor/autoload.php");

$app = new Silex\Application();

$app->get ("/gaje/blog", function () {

    echo "hello world";
    exit;
});

$app->run();


