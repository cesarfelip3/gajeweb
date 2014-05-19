<?php


namespace Api\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Api\Controller\BaseController;
use Model\Image;
use Model\User;

class ImageController extends BaseController {

    public function __construct ($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();
    }

    public function upload ($uploadFolder)
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

            $data = array ();
            $data["mime"] = $file->getMimeType();
            $extension = pathinfo($file->getClientOriginalName(), PATHINFO_EXTENSION);

            $data["file_name"] = "image" . uniqid() . "." . $extension;
            $data["file_path"] = $uploadFolder;
            $data["user_uuid"] = $user_uuid;

            $data['name'] = $this->request->get("name", "Untitle");
            $data['description'] = $this->request->get("description", "Untitle image");

            if (file_exists($data["file_path"])) {

                if (false == $file->move ($data["file_path"], $data["file_name"])) {
                    return $this->setFailed("move file error");
                } else {

                    $size = getimagesize($data["file_path"] . $data["file_name"]);
                    $data["width"] = $size[0];
                    $data["height"] = $size[1];

                    $image = new Image();
                    $image_uuid = $image->addImage($data);
                    if (empty ($image_uuid)) {

                        return $this->setFailed("save image to db error");
                    }
                }

            } else {
                return $this->setFailed("upload folder not exist");
            }
        }

        $this->error["data"]["image_uuid"] = $image_uuid;
        return true;

    }

    public function updateInfo ()
    {
        $image_uuid = $this->request->get("image_uuid", "");

        if (empty ($image_uuid)) {

            $this->error["status"] = "failure";
            $this->error["message"] = "image id is empty";
            return false;
        }

        $data = array ();
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

    public function getLatestByUser ()
    {
        $user_uuid = $this->request->get ("user_uuid", "");
        if (empty ($user_uuid)) {
            return $this->setFailed("user uuid is empty");
        }

        $page = $this->request->get ("page", 0);
        $pageSize = $this->request->get ("page_size", 25);

        $data=array();
        $data["page"] = intval($page);
        $data["page_size"] = intval($pageSize);
        $data["user_uuid"] = $user_uuid;

        $image = new Image();

        $image = $image->getImagesByUser($data);

        if ($image == false) {
            $this->setSuccess("Something wrong with db", array ("images"=>array()));
        } else {

            if (empty ($image)) {

                $this->setSuccess("empty result from db", array ("images"=>array()));
            } else {

                $this->setSuccess("", array ("images"=>$image));
            }
        }

        return true;
    }

    public function getLatest()
    {
        $page = $this->request->get ("page", 0);
        $pageSize = $this->request->get ("page_size", 25);

        $data=array();
        $data["page"] = intval($page);
        $data["page_size"] = intval($pageSize);

        $image = new Image();

        $image = $image->getLatestImages($data);

        if ($image == false) {
            $this->setSuccess("Something wrong with db", array ("images"=>array()));
        } else {

            if (empty ($image)) {

                $this->setSuccess("empty result from db", array ("images"=>array()));
            } else {

                $this->setSuccess("", array ("images"=>$image));
            }
        }

        return true;
    }


}