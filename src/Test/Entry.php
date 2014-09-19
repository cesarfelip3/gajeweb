<?php

require_once(__DIR__ . "/../../vendor/autoload.php");

require_once(__DIR__ . "/Class/Curl.class.php");

use Test\Test;

// loading all api test case

require_once(__DIR__ . "/Api/Api.php");

//@case api/v1/user/notification/update

$host = $test_case_api_user["host"];
$class = $test_case_api_user["class"];
$method = $test_case_api_user["method"]["user/notification/update"];
$data = array (
    "host" => $host,
    "post_data" => array ()
);

$object = new $class();
$result = $object->$method($data);



