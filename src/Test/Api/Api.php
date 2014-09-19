<?php

// we need a list of api waiting for test here
// we will reference it to the test case method

$test_case_api_user = array (
    "host" => "http://localhost/gajeweb/api/v1/",
    "class" => "\Test\Api\Controller\UserController",
    "method" => array (
        "user/add" => "user_add",
        "user/notification/update" => "user_notification_update"
    )
);

