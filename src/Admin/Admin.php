<?php

namespace Admin;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class Admin
{

    protected $request;
    protected $app;
    protected $config;

    public function __construct($app, $config)
    {

        $this->app = $app;
        $this->config = $config;

    }

    public function register()
    {

        $app = $this->app;
        $config = $this->config;
        $basename = $this->config["basename"];

        $admin = $app["controllers_factory"];

        $admin->get("/", function (Request $request) use ($app) {

            $controller = new \Admin\Controller\IndexController($request, $app);
            return $controller->index();

        });

        $admin->get("/user", function (Request $request) use ($app) {

            $controller = new \Admin\Controller\UserController($request, $app);
            return $controller->userList();
        });

        $admin->before(function (Request $request, $app) {

            $API_KEY = "XpHOUhadfhPIUYKHDFxOUYKJHERlkjhadfotYRWEWKEhluyadf";
            $API_SECRET = "921936776534209348";

            $api_token = hash_hmac ("sha256", $API_KEY . sha1($API_SECRET . $time));

            if (trim($token) == $api_token) {

                return null;
            }

            return null;

        });

        $app->mount($basename . "/" . $config["router_admin"], $admin);
    }

}