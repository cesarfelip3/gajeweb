<?php

namespace Api;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class Api
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
        $this->registerV1();
    }

    public function registerV1()
    {

        // have to verify
        // API key, API secret
        // app ==> http://domain/ <X-Auth-Token: hash_256 (API Key, API Secret . time())>
        // http://domain/?ticket=time()

        //

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

        $api->before(function (Request $request, Application $app) {

            $token = $request->headers->get("X-Auth-Token");
            $time = $request->get("ticket", 0);

            $message = "Invalid API request";

            if (empty ($time) || empty ($token)) {

                return $app->json (array ("status"=>"failure", "message"=>$message), 400);
            }

            if (time () - intval($time)) {

                return $app->json (array ("status"=>"failure", "message"=>$message), 400);
            }

            $API_KEY = "XpHOUhadfhPIUYKHDFxOUYKJHERlkjhadfotYRWEWKEhluyadf";
            $API_SECRET = "921936776534209348";

            $api_token = hash_hmac ("sha256", $API_KEY . sha1($API_SECRET . $time));

            if (trim($token) == $api_token) {

                return null;
            }

        });

        $app->mount($basename . "/" . $api_v1, $api);
    }

}