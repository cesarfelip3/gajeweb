<?php

namespace Api\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Api\Controller\BaseController;

use Model\User;

class UserController extends BaseController
{

    public function __construct($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();
    }

    public function addUser()
    {

        $email = $this->request->get("email", "");
        $firstname = $this->request->get("firstname", "");
        $lastname = $this->request->get("lastname", "");
        $username = $this->request->get("username", "");
        $fullname = $this->request->get("fullname", "");
        $token = $this->request->get("facebook_token", "");
        $icon = $this->request->get("facebook_icon", "");

        $data = array(
            "email" => $email,
            "firstname" => $firstname,
            "lastname" => $lastname,
            "username" => $username,
            "fullname" => $fullname,
            "facebook_token" => $token,
            "facebook_icon" => $icon
        );

        if (empty ($token)) {
            return $this->setFailed("invalid user ID");
        }

        $user = new User();
        $uuid = "";
        $uuid = $user->userExistsByToken($token);
        if (!$uuid) {
            $uuid = $user->addUser($data);
            if (empty ($uuid)) {
                return $this->setFailed("add user wrong");
            }
        } else {
            $user->updateUser($data);
        }

        $this->error["data"]["user_uuid"] = $uuid;

        return true;

    }

    public function addFollow ()
    {
        $user_uuid = $this->request->get("user_uuid", "");
        $follow_uuid = $this->request->get("following_uuid", "");

        $data["user_follower_uuid"] = $user_uuid;
        $data["user_following_uuid"] = $follow_uuid;

        $user = new User();
        $uuid = $user->userExists($data);

        if (!$uuid) {

            $user->addFollow($data);
            return $this->setSuccess("success");

        } else {

            return $this->setSuccess("exists");
        }

        return true;
    }

}