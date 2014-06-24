<?php
// database


$config["db"] = array(

    "db.options" => array(
        "driver" => "pdo_mysql",
        "host" => "localhost",
        "port" => "3306",
        "user" => "root",
        "password" => "",
        "dbname" => "gajeapp",
        // "charset" => "",
    )
);

// cache

$config["http_cache_enable"] = false;
$config["http_cache"] = array(
    'http_cache.cache_dir' => __DIR__ . "/cache/",
    'http_cache.esi' => null,
);

$config["twig_cache_enable"] = false;

// basename
// route prefix

$config["basename"] = "/gajeweb";
$config["router_apiv1"] = "api/v1/";
$config["router_admin"] = "admin/";
$config["router_test"] = "testcase/";

// upload
$config["debug"] = true;
$config['upload.image.host'] = 'http://localhost/image/';
$config['upload.folder'] = realpath(__DIR__ . "/../../upload/") . DIRECTORY_SEPARATOR;
$config['upload.folder.image'] = $config["upload.folder"] . "image" . DIRECTORY_SEPARATOR;

//

require_once __DIR__ . '/test/Curl.class.php';

class TestCase {

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
        $router_api_v1 = $this->config["router_apiv1"];
        $router_testcase = $this->config["router_test"];
        $router_admin = $this->config["router_admin"];

        $test = $app["controllers_factory"];

        // @module: administration
        // @target: admin/user
        //
        $test->get ("/admin/user", function () use ($app) {

            print_r ("preparing test /admin/user<br/>");
            print_r ("begin::installing test data from user table<br/>");

            $user = new \Model\User();
            $data = array ();

            for ($i = 0; $i < 200; $i++) {

                $data["username"] = "user_" . $i;
                $data["email"] = "user_" . $i . "@gmail.com";
                $data["firstname"] = "user_" . $i;
                $data["lastname"] = "$i";

                $user->addUser($data);

            }

            exit ("end::installing test data from user table<br/>");

        });

        // @module: api
        // @target: user/add

        $test->get("user/add", function () use ($app) {

            $file_name_with_full_path = realpath(__DIR__ . "/pi-512.png");
            $post = array(
                'email' => '123456@abc.com',
                'token' => 'bbad2323adfadsf'
            );

            $target_url = "http://localhost/gajeweb/api/v1/user/add";

            $curl = new Curl();


            $curl->post($target_url, $post);
            print_r(json_encode($curl->response));

            exit;
        });

        // @module: api
        // @target: image/upload

        $test->get("image/upload/{userId}", function ($userId) use ($app) {

            $file_name_with_full_path = realpath(__DIR__ . "/pi-512.png");
            $post = array('user_uuid' => $userId, 'fileinfo' => '@' . $file_name_with_full_path);

            $target_url = "http://localhost/gajeweb/api/v1/image/upload";

            $curl = new Curl();

            $curl->post($target_url, $post);
            print_r(json_encode($curl->response));

            exit;
        });


        // @module: api
        // @target: user/image/latest

        $test->get("user/image/latest/{userId}", function ($userId) use ($app) {

            $file_name_with_full_path = realpath(__DIR__ . "/pi-512.png");
            $post = array('page' => 0, 'page_size' => 50, 'user_uuid' => $userId);

            $target_url = "http://localhost/gajeweb/api/v1/user/image/latest";

            $curl = new Curl();

            $curl->post($target_url, $post);
            print_r(json_encode($curl->response));

            exit;
        });

        // @module: api
        // @target: image/latest

        $test->get("image/latest", function () use ($app) {

            $post = array('page' => 0, 'page_size' => 50);

            $target_url = "http://localhost/gajeweb/api/v1/image/latest";

            $curl = new Curl();

            $curl->post($target_url, $post);
            print_r(json_encode($curl->response));

            exit;
        });

        $this->app->mount($basename . "/" . $config["router_test"], $test);
    }

}