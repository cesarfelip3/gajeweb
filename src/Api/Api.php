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
        //  key,  secret
        // app ==> http://domain/ <X-Auth-Token: hash_256 ( Key,  Secret . time())>
        // http://domain/?ticket=time()

        //

        $app = $this->app;
        $config = $this->config;
        $basename = $this->config["basename"];
        $api_v1 = $this->config["router_apiv1"];

        $api = $app["controllers_factory"];

        $this->registerUserApi($api);
        $this->registerImageApi($api);
        $this->registerThemeApi($api);

        $app->mount($basename . "/" . $api_v1, $api);
    }

    protected function registerUserApi (&$api)
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

        $api->post("user/follow", function (Request $request) use ($app) {

            $controller = new Controller\UserController($request, $app);
            $ret = $controller->addFollow();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);

        });

        $api->post("user/unfollow", function (Request $request) use ($app) {

            $controller = new Controller\UserController($request, $app);
            $ret = $controller->addFollow();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);

        });

        $api->post("user/follower/list", function (Request $request) use ($app) {

            $controller = new Controller\UserController($request, $app);
            $ret = $controller->getFollowerListByUser();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);

        });

        $api->post("user/following/list", function (Request $request) use ($app) {

            $controller = new Controller\UserController($request, $app);
            $ret = $controller->getFollowingListByUser();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);

        });

        $api->post("user/block/add", function (Request $request) use ($app) {

            $controller = new Controller\UserController($request, $app);
            $ret = $controller->addBlock();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);

        });
    }

    protected function registerImageApi (&$api)
    {

        $app = $this->app;
        $config = $this->config;
        $basename = $this->config["basename"];

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


        //==============
        // comment
        //==============

        $api->post("image/comment/add", function (Request $request) use ($app) {

            $controller = new Controller\ImageController($request, $app);
            $ret = $controller->addComment();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);

        });

        $api->post("image/comment/list", function (Request $request) use ($app) {

            $controller = new Controller\ImageController($request, $app);
            $ret = $controller->getCommentList();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);

        });

        //====================
        // brander
        //====================

        $api->post("image/brander/add", function (Request $request) use ($app) {

            $controller = new Controller\ImageController($request, $app);
            $ret = $controller->addBrander();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);

        });

        $api->post("image/brander/list", function (Request $request) use ($app) {

            $controller = new Controller\ImageController($request, $app);
            $ret = $controller->getBranderList();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);

        });

        $api->before(function (Request $request, $app) {

            return null;

            $token = $request->headers->get("X-Auth-Token");
            $time = $request->get("ticket", 0);

            $message = "Invalid  request";

            if (empty ($time) || empty ($token)) {

                return $app->json (array ("status"=>"failure", "message"=>$message), 400);
            }

            if (time () - intval($time) >= 1000) {

                return $app->json (array ("status"=>"failure", "message"=>$message), 400);
            }

            $_KEY = "XpHOUhadfhPIUYKHDFxOUYKJHERlkjhadfotYRWEWKEhluyadf";
            $_SECRET = "921936776534209348";

            $api_token = hash_hmac ("sha256", $_KEY . sha1($_SECRET . $time));

            if (trim($token) == $api_token) {

                return null;
            }

        });

    }

    protected function registerThemeApi (&$api)
    {
        $app = $this->app;
        $config = $this->config;
        $basename = $this->config["basename"];

        $api->post("theme/list", function (Request $request) use ($app) {

            $controller = new Controller\ThemeController($request, $app);
            $ret = $controller->getThemeList();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);

        });

        $api->post("note/list", function (Request $request) use ($app) {

            $controller = new Controller\ThemeController($request, $app);
            $ret = $controller->getThemeList();

            $status = 200;
            if ($ret) {
                $status = 200;
            } else {
                $status = 400;
            }

            return $app->json($controller->getError(), $status);

        });
    }

}