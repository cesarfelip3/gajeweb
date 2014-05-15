<?php

namespace Api\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Api\Controller\BaseController;

use Model\User;

class UserController extends BaseController {

    public function __construct ($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();
    }

    public function addUser ()
    {

        $email = $this->request->get ("email", "");
        $token = $this->request->get ("token", "");
        $firstname = $this->request->get ("firstname", "");
        $lastname = $this->request->get ("lastname", "");
        $username = $this->request->get ("username", "");
        $fullname = $this->request->get ("fullname", "");

        $data = array (
            "email" => $email,
            "token" => $token,
            "firstname" => $firstname,
            "lastname" => $lastname,
            "username" => $username,
            "fullname" => $fullname
        );

        if (empty ($token)) {
            $this->error["status"] = "failure";
            $this->error["message"] = "invalid user ID";
            return false;
        }

        $user = new User();
        $uuid = "";
        $uuid = $user->userExistsByToken($token);
        if (!$uuid) {
            $uuid = $user->createUser($data);
            $this->error["data"]["user_uuid"] = $uuid;
        } else {
            $this->error["status"] = "success";
            $this->error["message"] = "User with token=$token already exist";
            $this->error["data"]["user_uuid"] = $uuid;
        }

        return true;

    }

}