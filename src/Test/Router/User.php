<?php
/**
 * Created by PhpStorm.
 * User: hello
 * Date: 14-9-10
 * Time: 上午4:31
 */

namespace Test\Router;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Test\Controller;

class User {


    static public function register ($router, $app, $config)
    {

        // @function : User register
        // @desc : when user have logged into FB, the app will call this API to register the user to the service


        $router->get ("/user/add", function (Request $request) use ($app) {


            $controller = new Controller\UserController();
            $controller->user_add();


        });



        //

    }


} 