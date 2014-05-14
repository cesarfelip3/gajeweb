<?php

// database

$config["db_test"] = array (

    "db.options" => array (
        "driver" => "pdo_mysql",
        "host" => "localhost",
        "port" => "3306",
        "user" => "root",
        "password" => "",
        "dbname" => "gajeapp",
        // "charset" => "",
    )
);

$config["db"] = array (

    "db.options" => array (
        "driver" => "pdo_mysql",
        "host" => "localhost",
        "port" => "3306",
        "user" => "gajeapp",
        "password" => "9cNrrrKGWB6cUKsh",
        "dbname" => "gajeapp",
        // "charset" => "",
    )
);

// cache

$config["cache"] = array (
    'http_cache.cache_dir' => __DIR__ . '/cache/',
);

// basename
// route prefix

$config["basename"] = "/gajeweb";
$config["router_apiv1"] = "api/v1/";
$config["router_test"] = "testcase/";