<?php


namespace Api\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


use Api\Controller\BaseController;
use Model\Image;
use Model\User;
use Model\Theme;
use Model\Comment;

class ImageController extends BaseController
{

    public function __construct($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();
    }

    //========================================
    // get latest image list for app
    //========================================

    public function getLatest()
    {
        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 25);
        $user_uuid = $this->request->get("user_uuid", "");

        $data = array();
        $data["page"] = intval($page);
        $data["page_size"] = intval($pageSize);
        $data["user_uuid"] = $user_uuid;

        $image = new Image();

        $imageArray = $image->getLatestImages($data);

        if (empty ($imageArray)) {

            $this->setSuccess("empty result from db", array("images" => array()));
        } else {

            $data = array();
            $data["page"] = 0;
            $data["page_size"] = 512;

            foreach ($imageArray as &$value) {

                $data["image_uuid"] = $value["image_uuid"];
                $value["branders"] = $image->getBranderList($data);
                $value["brander_count"] = count($value["branders"]);
                $data["user_uuid"] = $user_uuid;
                $value["enable_brander"] = $image->branderExist($data) == true ? 0 : 1;
            }

            $this->setSuccess("", array("images" => $imageArray));
        }

        return true;
    }

    //=================================
    // upload & update
    //=================================

    public function upload($uploadFolder)
    {

        $userId = $this->request->get("user_uuid", "");
        if (empty ($userId)) {
            return $this->setFailed("userId is empty");
        }

        $file = $this->request->files->get("fileinfo");
        $user = new User();

        $user_uuid = "";
        if (false == ($user_uuid = $user->userExists($userId))) {

            return $this->setFailed("user not exist for userId=" . $userId);
        }

        if (empty ($file)) {
            return $this->setFailed("file handler not exist");
        }


        if ($file->isValid()) {

            $data = array();
            $data["mime"] = $file->getMimeType();
            $extension = pathinfo($file->getClientOriginalName(), PATHINFO_EXTENSION);

            $data["file_name"] = "image" . uniqid() . "." . $extension;
            $data["file_path"] = $uploadFolder;
            $data["user_uuid"] = $user_uuid;

            $data['name'] = $this->request->get("name", "Untitle");
            $data['description'] = $this->request->get("description", "Untitle image");
            $themeArray = $this->request->get("theme_array");

            $themeArray = trim ($themeArray, ",");
            $themeArray = explode(",", $themeArray);

            if (isset($themeArray[0])) {
                $data["theme_uuid"] = $themeArray[0];
            }

            if (file_exists($data["file_path"])) {

                if (false == $file->move($data["file_path"], $data["file_name"])) {
                    return $this->setFailed("move file error");
                } else {

                    $size = getimagesize($data["file_path"] . $data["file_name"]);
                    $data["width"] = $width = $size[0];
                    $data["height"] = $height = $size[1];

                    $thumbnail_width = 280;
                    $thumbnail_height = (int)(280 * $height / $width);

                    $data["thumbnail"] = pathinfo($data["file_name"], PATHINFO_FILENAME) . "_" . $thumbnail_width . "x" . $thumbnail_height . "." . pathinfo($data["file_name"], PATHINFO_EXTENSION);

                    $image = new Image();
                    $image_uuid = $image->addImage($data);

                    $imagine = new \Imagine\Imagick\Imagine();

                    $image = $imagine->open($data["file_path"] . $data["file_name"]);
                    $image->resize(new \Imagine\Image\Box($thumbnail_width, $thumbnail_width * $height / $width))
                        ->crop(new \Imagine\Image\Point(0, 0), new \Imagine\Image\Box($thumbnail_width, $thumbnail_height))
                        ->save($data["file_path"] . $data["thumbnail"]);

                    if (empty ($image_uuid)) {

                        return $this->setFailed("save image to db error");
                    }
                }

            } else {
                return $this->setFailed("upload folder not exist");
            }
        } else {

            // basically php.ini issue

            return $this->setFailed("invalid upload", array("result" => $file));
        }

        $this->setSuccess("", array("image_uuid" => $image_uuid));
        return true;

    }

    public function updateInfo()
    {
        $image_uuid = $this->request->get("image_uuid", "");

        if (empty ($image_uuid)) {

            $this->error["status"] = "failure";
            $this->error["message"] = "image id is empty";
            return false;
        }

        $data = array();
        $data["name"] = $this->request->get("name", "Untitle");
        $data["description"] = $this->request->get("description", "");
        $data["image_uuid"] = $image_uuid;

        $image = new Image();

        if (!$image->imageExists($image_uuid)) {
            return $this->setFailed("image not exist");
        }

        if ($image->update($data)) {
            $this->error["data"]["image_uuid"] = $image_uuid;
            return $image_uuid;
        }

        return $this->setFailed("update image error");
    }

    //========================================
    // comment & brand
    //========================================

    public function addComment ()
    {
        $image_uuid = $this->request->get("image_uuid", "");
        $user_uuid = $this->request->get("user_uuid", "");
        $content = $this->request->get("content", "");

        if (empty ($content)) {

            $this->setFailed("Empty comment");
            return true;
        }

        $image = new Image();

        if (!$image->imageExists($image_uuid)) {

            $this->setFailed("Image doesn't exist");
            return false;
        }

        $user = new User();
        if (!$user->userExists($user_uuid)) {
            $this->setFailed("Your account doesn't exist in current server");
            return false;
        }

        $comment = new Comment ();

        $data["content"] = $content;
        $data["user_uuid"] = $user_uuid;
        $comment_uuid = $comment->addComment($data);

        $data = array ();
        $data["image_uuid"] = $image_uuid;
        $data["comment_uuid"] = $comment_uuid;
        $image->addComment($data);

        return $this->setSuccess("");
    }

    public function getCommentList ()
    {
        // get comment list for image

        $image_uuid = $this->request->get("image_uuid", "");
        if (empty ($image_uuid)) {
            return $this->setFailed("Image doesn't exist");
        }

        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 25);

        $data = array();
        $data["page"] = intval($page);
        $data["page_size"] = intval($pageSize);
        $data["image_uuid"] = $image_uuid;

        $image = new Image();

        $result = $image->getCommentList($data);

        foreach ($result as &$element) {

        }

        return $this->setSuccess("", array ("comments"=>$result));

    }

    public function addBrander ()
    {
        $image_uuid = $this->request->get("image_uuid", "");
        $user_uuid = $this->request->get("user_uuid", "");

        $image = new Image();

        if (!$image->imageExists($image_uuid)) {

            $this->setFailed("Image doesn't exist");
            return false;
        }

        $user = new User();
        if (!$user->userExists($user_uuid)) {
            $this->setFailed("Your account doesn't exist in current server");
            return false;
        }

        $data = array ();
        $data["image_uuid"] = $image_uuid;
        $data["user_uuid"] = $user_uuid;
        $data["create_date"] = time();
        $image->addBrander($data);

        return $this->setSuccess("");
    }

    public function getBranderList ()
    {
        // get comment list for image

        $image_uuid = $this->request->get("image_uuid", "");
        if (empty ($image_uuid)) {
            return $this->setFailed("Image doesn't exist");
        }

        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 25);

        $data = array();
        $data["page"] = intval($page);
        $data["page_size"] = intval($pageSize);
        $data["image_uuid"] = $image_uuid;

        $image = new Image();

        $result = $image->getBranderList($data);

        foreach ($result as &$element) {

        }

        return $this->setSuccess("", array ("branders"=>$result));

    }

    //=============================================
    // get images by user
    //=============================================

    public function getLatestByUser()
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

        $image = new Image();

        $imageArray = $image->getImagesByUser($data);

        if (empty ($imageArray)) {

            $this->setSuccess("empty result from db", array("images" => array()));
        } else {

            $data = array();
            $data["page"] = 0;
            $data["page_size"] = 512;

            foreach ($imageArray as &$value) {

                $data["image_uuid"] = $value["image_uuid"];
                $value["branders"] = $image->getBranderList($data);
                $value["brander_count"] = count($value["branders"]);

            }

            $this->setSuccess("", array("images" => $imageArray));
        }

        return true;
    }

    // service ==> cron
    // not tested yet

    public function toThumbnails()
    {
        $image = new Image();

        $result = $image->getImagesWithoutThumbnail();

        if (!empty ($result)) {

            $imagine = new \Imagine\Imagick\Imagine();

            foreach ($result as $data) {

                if (file_exists($data["file_path"] . $data["file_name"])) {

                    $width = $data["width"];
                    $heght = $data["height"];

                    $thumbnail = $imagine->open($data["file_path"] . $data["file_name"]);
                    $thumbnail->resize(new \Imagine\Image\Box(280, 280 * $height / $width))
                        ->crop(new \Imagine\Image\Point(0, 0), new \Imagine\Image\Box(280, 185))
                        ->save($data["file_path"] . pathinfo($data["file_name"], PATHINFO_BASENAME) . "_280x240." . pathinfo($data["file_name"], PATHINFO_EXTENSION));

                    $data["thumbnails"] = 1;
                    $image->updateImage($data);

                }

            }

        }

    }


}