<?php

namespace Api\Controller;

use Api\Model\Image;
use Api\Model\Theme;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Api\Controller\BaseController;

use Api\Model\User;

class UserController extends BaseController
{

    public function __construct($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();
    }

    /**
     * Add user data from the client/iOS app, when the app start and login with
     * FB successfully, it will call this action to add user or update user
     */
    public function addUser()
    {

        $email = $this->request->get("email", "");
        $firstname = $this->request->get("firstname", "");
        $lastname = $this->request->get("lastname", "");
        $username = $this->request->get("username", "");
        $fullname = $this->request->get("fullname", "");
        $token = $this->request->get("facebook_token", "");
        $icon = $this->request->get("facebook_icon", "");
        $location = $this->request->get("location", "");

        $data = array(
            "email" => $email,
            "firstname" => $firstname,
            "lastname" => $lastname,
            "username" => $username,
            "fullname" => $fullname,
            "facebook_token" => $token,
            "facebook_icon" => $icon,
            "location" => $location
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

            if (!$user->isEnabled($uuid)) {

                return $this->setFailed("Your account is disabled now", array(
                    "disabled" => 1
                ));

            }

            $user->updateUser($data);
        }

        $this->error["data"]["user_uuid"] = $uuid;

        $theme = new Theme();
        $theme_uuid = $theme->getTheme();

        return $this->setSuccess("", array("user_uuid" => $uuid, "theme_uuid" => $theme_uuid));

    }

    /**
     * Searching the user from user database, and return the list of all users
     */
    public function searchUser()
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
        $data["name"] = '%' . trim($name) . '%';

        $user = new User();
        $userArray = $user->filterUserByName($data);

        if (empty ($userArray)) {

            $this->setSuccess("empty result from db", array("users" => array()));
        }

        return $this->setSuccess("", array("users" => $userArray));

    }

    /**
     * Adding excluded image from the current user image list, so when the image
     * displayed on user device, it won't include any of those images
     */
    public function addExcludeImage()
    {
        $user_uuid = $this->request->get("user_uuid", "");
        $image_uuid = $this->request->get("image_uuid", "");

        $data = array();
        $data["user_uuid"] = $user_uuid;
        $data["image_uuid"] = $image_uuid;

        $user = new User();
        $uuid = $user->exImageExist($data);

        if (!$uuid) {

            $user->addExImage($data);
            return $this->setSuccess("success");

        }

        return $this->setSuccess("exists");

    }

    /**
     * Adding block user identifier to current user image list, if one user is
     * blocked, and then all images from this user will be blocked for current
     * user
     */
    public function addBlock()
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

        }

        return $this->setSuccess("exists");

    }

    /**
     * Adding following/followed relationship for current user
     */
    public function addFollow()
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

        }

        return $this->setSuccess("exists");

    }

    /**
     * Get the list of follower for current user
     */
    public function getFollowerListByUser()
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

        if (!empty ($userArray)) {

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
                    $follower["image"] = array();
                }

            }

            $this->setSuccess("", array("followers" => $userArray));
        }

        $this->setSuccess("empty result from db", array("followers" => array()));
    }

    /**
     * Get list of following user for current user
     */
    public function getFollowingListByUser()
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

        if (!empty ($userArray)) {

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
                    $follower["image"] = array();
                }

            }

            $this->setSuccess("", array("followings" => $userArray));
        }

        $this->setSuccess("empty result from db", array("followings" => array()));
    }

    /**
     * Remove the follow of the current user
     */
    public function removeFollow()
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

        }
        return $this->setSuccess("not exists");
    }

    /**
     * When the iOS app running, it will load the data of latest notification
     * of comments, brands and follows, from this notification, user can get to
     * know who commented his image lately and so on, and when one of items has
     * read, it will be removed from the list, this method will mark which item
     * is read at server side
     */
    function markItRead()
    {

        $type = $this->request->get("type", "");

        if (empty ($type)) {
            return $this->setFailed("");
        }

        if ($type == "comments" || $type == "branders") {
            $uuid = $this->request->get("uuid", "");
            $image_uuid = $this->request->get("image_uuid", "");
        }

        if ($type == "followers") {

            $user_uuid = $this->request->get("user_uuid", "");
            $follower_uuid = $this->request->get("follower_uuid", "");

            $data = array(
                "user_following_uuid" => $follower_uuid,
                "user_followed_uuid" => $user_uuid,
                "is_read" => 1
            );

            $user = new User();
            $user->updateFollower($data);

        }

        if ($type == "comments") {

            // mark it read

            $data["image_uuid"] = $image_uuid;
            $data["comment_uuid"] = $uuid;

            $data["is_read"] = 1;

            $image = new Image();
            $image->updateComment($data);
            return $this->setSuccess("success to change read status of comment");
        }

        if ($type == "branders") {

            // mark it read

            $data["image_uuid"] = $image_uuid;
            $data["brander_uuid"] = $uuid;

            $data["is_read"] = 1;

            $image = new Image();
            $image->updateBrander($data);
        }

        return $this->setSuccess("success to change read status of brander");
    }

    /**
     * Will get all updated information from comments, brands and follows
     */
    function getUpdateInfo()
    {
        $userUUID = $this->request->get("user_uuid", "");

        $user = new User();
        $uuid = "";
        $uuid = $user->userExists($userUUID);

        if ($uuid) {

            $data["page"] = 0;
            $data["page_size"] = 50;
            $data["user_uuid"] = $uuid;

            $result = $user->getUpdateInfo($data);

            if ($result == false) {
                $this->setFailed("false");
            }

            $image = new Image();

            $comments = $result["comments"];

            if (!empty ($comments)) {

                $data = array();
                $data["page"] = 0;
                $data["page_size"] = 512;

                foreach ($comments as &$value) {

                    $data["image_uuid"] = $value["image_uuid"];
                    $value["branders"] = $image->getBranderList($data);
                    $value["brander_count"] = count($value["branders"]);
                    $data["user_uuid"] = $user_uuid;
                    $value["enable_brander"] = $image->branderExist($data) == true ? 0 : 1;
                }

                $result["comments"] = $comments;

            }

            $branders = $result["branders"];

            if (!empty ($branders)) {

                $data = array();
                $data["page"] = 0;
                $data["page_size"] = 512;

                foreach ($branders as &$value) {

                    $data["image_uuid"] = $value["image_uuid"];
                    $value["branders"] = $image->getBranderList($data);
                    $value["brander_count"] = count($value["branders"]);
                    $data["user_uuid"] = $user_uuid;
                    $value["enable_brander"] = $image->branderExist($data) == true ? 0 : 1;
                }

                $result["branders"] = $branders;
            }

            return $this->setSuccess("", $result);

        }

        return $this->setSuccess("");
    }

    /**
     * Will get the number of update (comment, brand and follow)
     */
    function getNumberOfUpdateInfo()
    {
        $userUUID = $this->request->get("user_uuid", "");

        $user = new User();
        $uuid = "";
        $uuid = $user->userExists($userUUID);

        if ($uuid) {

            $data["page"] = 0;
            $data["page_size"] = 50;
            $data["user_uuid"] = $uuid;

            $result = $user->getNumberOfUpdateInfo($data);

            $this->setSuccess("", array("total" => $result));
        }

        return $this->setSuccess("", array("total" => 0));
    }

    /**
     * Register APN IOS token from device for each user, and for each of them,
     * they are allowed to have one active device only
     */
    function registerAPNToken()
    {

        $user_uuid = $this->request->get("user_uuid", "");
        $token = $this->request->get("token", "");

        if (empty ($token) || empty ($user_uuid)) {
            return $this->setFailed("Invald parameters while registering APN
            token");
        }

        $user = new User();

        $data = array(
            "user_uuid" => $user_uuid,
            "apn_token" => $token
        );

        if ($user->userExists($user_uuid)) {
            $user->addAPNToken($data);
            return $this->setSuccess("");
        }

        return $this->setFailed("Your user id isn't valid anymore");
    }

    /**
     * Enable APN for current user or not, here we limited when user can get
     * remote notification, only if the app is running background or not running,
     * it can accept the notification, so this time, it will enable that for
     * current user.
     *
     * @return bool
     */
    function enableAPN ()
    {
        $user_uuid = $this->request->get("user_uuid", "");
        $enable = $this->request->get("enable", 0);

        if (empty ($enable) || empty ($user_uuid)) {
            return $this->setFailed("Invald parameters");
        }

        $user = new User();

        $data = array(
            "user_uuid" => $user_uuid,
            "apn_enable" => $enable
        );

        if ($user->userExists($user_uuid)) {
            $user->addAPNToken($data);
            return $this->setSuccess("");
        }

        return $this->setFailed("Your user id isn't valid anymore");
    }

}