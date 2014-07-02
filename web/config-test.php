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

