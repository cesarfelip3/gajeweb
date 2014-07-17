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

        $admin->get("/image", function (Request $request) use ($app) {

            $controller = new \Admin\Controller\ImageController($request, $app);
            return $controller->imageList();
        });

        $admin->get("/image/delete/{id}", function (Request $request) use ($app, $id) {

            $controller = new \Admin\Controller\ImageController($request, $app);
            return $controller->deleteImage($id);
        });

        $admin->match("/theme", function (Request $request) use ($app) {

            $controller = new \Admin\Controller\ThemeController($request, $app);
            return $controller->themeList();
        })->method("GET|POST");

        $admin->before(function (Request $request, $app) {

            $API_KEY = "XpHOUhadfhPIUYKHDFxOUYKJHERlkjhadfotYRWEWKEhluyadf";
            $API_SECRET = "921936776534209348";


            return null;

        });

        $app->mount($basename . "/" . $config["router_admin"], $admin);
    }

}