<?php

require_once(__DIR__ . "/../../vendor/autoload.php");

require_once(__DIR__ . "/Class/Curl.class.php");

use Test\Test;
use Test\Controller;

$user = new Controller\UserController();


$data = array ();

$result = $user->user_notification_update(new Curl, $data);


