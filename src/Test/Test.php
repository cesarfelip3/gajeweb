<?php
/**
 * Created by PhpStorm.
 * User: hello
 * Date: 14-9-10
 * Time: 上午4:29
 */

namespace Test;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Test\Controller\UserController;

class Test {
    
    static public function register($app, $config)
    {

        BaseModel::$DB = $app['db'];

        $basename = $config["basename"];
        $module = $config["module_test"];

        $router = $app["controllers_factory"];


        $app->mount($basename . "/" . $module, $router);
    }

} 