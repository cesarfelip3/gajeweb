<?php

namespace Api;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class Admin {

    protected $request;
    protected $app;
    protected $config;

    public function __construct ($app, $config)
    {

        $this->app = $app;
        $this->config = $config;

    }

    public function register ()
    {

        $app = $this->app;
        $config = $this->config;
        $basename = $this->config["basename"];

        $api->post("user/add", function (Request $request) use ($app) {

            $controller = new Controller\UserController($request, $app);
            $ret = $controller->addUser();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);
        });

        $api->post("user/image/latest", function (Request $request) use ($app) {

            $controller = new Controller\ImageController($request, $app);
            $ret = $controller->getLatestByUser();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);
        });

        $api->post("image/upload", function (Request $request) use ($app) {

            $controller = new Controller\ImageController($request, $app);
            $ret = $controller->upload($app["upload.folder.image"]);

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);
        });

        $api->post("image/update", function (Request $request) use ($app) {

            $controller = new Controller\ImageController($request, $app);
            $ret = $controller->updateInfo();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);
        });

        $api->post("image/latest", function (Request $request) use ($app) {

            $controller = new Controller\ImageController($request, $app);
            $ret = $controller->getLatest();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);
        });

        $api->before(function (Request $request) {

            return null;
        });

        $app->mount($basename . "/" . $api_v1, $api);
    }

}