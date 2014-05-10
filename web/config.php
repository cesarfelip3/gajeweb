<?php

// database

$config["db"] = array (

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

// cache

$config["cache"] = array (
    'http_cache.cache_dir' => __DIR__ . '/cache/',
);

// basename

$config["basename"] = "/gajeweb";
$config["router_apiv1"] = "api/v1/";