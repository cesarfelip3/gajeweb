<?php

namespace Api\Controller;

use Model\Image;
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

    public function searchUser ()
    {
        $name = $this->request->get("name", "");
        if (empty ($name)) {
            return $this->setFailed("empty user name");
        }

        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 25);

        $data = array();
        $data["page"] = intval($page);
        $data["page_size"] = intval($pageSize);
        $data["name"] = '%' . $name . '%';

        $user = new User();
        $userArray = $user->filterUserByName($data);

        if (empty ($userArray)) {

            $this->setSuccess("empty result from db", array("users" => array()));
        } else {

            $this->setSuccess("", array("followings" => $userArray));
        }

        return true;
    }

    //=================================
    //
    //=================================
    public function addBlock ()
    {
        $user_uuid = $this->request->get("user_uuid", "");
        $block_uuid = $this->request->get("user_block_uuid", "");

        $data["user_uuid"] = $user_uuid;
        $data["user_block_uuid"] = $block_uuid;

        $user = new User();
        $uuid = $user->blockExist($data);

        if (!$uuid) {

            $user->addBlock($data);
            return $this->setSuccess("success");

        } else {

            return $this->setSuccess("exists");
        }

        return true;
    }

    //======================================
    //
    //======================================

    public function addFollow ()
    {
        $user_uuid = $this->request->get("user_followed_uuid", "");
        $follow_uuid = $this->request->get("user_following_uuid", "");

        $data["user_followed_uuid"] = $user_uuid;
        $data["user_following_uuid"] = $follow_uuid;

        $user = new User();
        $uuid = $user->followExist($data);

        if (!$uuid) {

            $user->addFollow($data);
            return $this->setSuccess("success");

        } else {

            return $this->setSuccess("exists");
        }

        return true;
    }

    public function getFollowerListByUser ()
    {
        $user_uuid = $this->request->get("user_uuid", "");
        if (empty ($user_uuid)) {
            return $this->setFailed("user uuid is empty");
        }

        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 25);

        $data = array();
        $data["page"] = intval($page);
        $data["page_size"] = intval($pageSize);
        $data["user_uuid"] = $user_uuid;

        $user = new User();
        $userArray = $user->getFollowerList($data);

        if (empty ($userArray)) {

            $this->setSuccess("empty result from db", array("followers" => array()));
        } else {

            $data = array();
            $data["page"] = 0;
            $data["page_size"] = 1;

            $image = new Image();

            foreach ($userArray as &$follower) {

                $data["user_uuid"] = $follower["user_uuid"];
                $imageArray = $image->getImageByUser($data);

                if (!empty ($imageArray)) {
                    $follower["image"] = $imageArray[0];
                } else {
                    $follower["image"] = array ();
                }

            }

            $this->setSuccess("", array("followers" => $userArray));
        }

        return true;
    }

    public function getFollowingListByUser ()
    {
        $user_uuid = $this->request->get("user_uuid", "");
        if (empty ($user_uuid)) {
            return $this->setFailed("user uuid is empty");
        }

        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 25);

        $data = array();
        $data["page"] = intval($page);
        $data["page_size"] = intval($pageSize);
        $data["user_uuid"] = $user_uuid;

        $user = new User();
        $userArray = $user->getFollowingList($data);

        if (empty ($userArray)) {

            $this->setSuccess("empty result from db", array("followings" => array()));
        } else {

            $data = array();
            $data["page"] = 0;
            $data["page_size"] = 1;
            $data["user_uuid"] = $user_uuid;

            $image = new Image();

            foreach ($userArray as &$follower) {

                $data["user_uuid"] = $follower["user_uuid"];
                $imageArray = $image->getImageByUser($data);

                if (!empty ($imageArray)) {
                    $follower["image"] = $imageArray[0];
                } else {
                    $follower["image"] = array ();
                }

            }

            $this->setSuccess("", array("followings" => $userArray));
        }

        return true;
    }

    public function removeFollow ()
    {
        $user_uuid = $this->request->get("user_followed_uuid", "");
        $follow_uuid = $this->request->get("user_following_uuid", "");

        $data["user_followed_uuid"] = $user_uuid;
        $data["user_following_uuid"] = $follow_uuid;

        $user = new User();
        $uuid = $user->followExist($data);

        if ($uuid) {

            $user->deleteFollow($data);
            return $this->setSuccess("success");

        } else {

            return $this->setSuccess("not exists");
        }

        return true;
    }

}