<?php

// database

$config["db"] = array(

    "db.options" => array(
        "driver" => "pdo_mysql",
        "host" => "localhost",
        "port" => "3306",
        "user" => "root",
        "password" => "root",
        "dbname" => "gajeapp",
        // "charset" => "",
    )
);

// cache

$config["http_cache_enable"] = true;
$config["http_cache"] = array(
    'http_cache.cache_dir' => __DIR__ . "/cache/",
    'http_cache.esi' => null,
);

$config["twig_cache_enable"] = true;

// basename
// route prefix

$config["basename"] = "/gajeweb";
$config["router_apiv1"] = "api/v1/";
$config["router_admin"] = "admin/";
$config["router_test"] = "testcase/";
$config["api_secrect"] = "(qeADF@#w3453aqwe412LKSHKJY*(^$%!@:LIKJSUP)(*!@Tjkh&*(&@#";

// upload

$config["debug"] = false;
$config["certificates.folder"] = __DIR__ . DIRECTORY_SEPARATOR . "certificates" . DIRECTORY_SEPARATOR;
$config['upload.image.host'] = 'http://gajeapp.com/upload/image/';
$config['upload.folder'] = realpath(__DIR__ . "/../../upload/") . DIRECTORY_SEPARATOR;
$config['upload.folder.image'] = $config["upload.folder"] . "image" . DIRECTORY_SEPARATOR;

$config['history.folder'] = realpath(__DIR__ . "/../../history/") . DIRECTORY_SEPARATOR;