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

    public function handleUpload ($uploadFolder, $userId)
    {


        $file = $this->request->files->get("fileinfo");
        $user = new User();

        $user_uuid = "";
        if (false == ($user_uuid = $user->userExists($userId))) {

            $this->error["status"] = "failure";
            $this->error["message"] = "user not exist for userId=" . $userId;
            return false;
        }

        if ($file->isValid()) {

            $data = array ();
            $data["mime"] = $file->getMimeType();
            $extension = pathinfo($file->getClientOriginalName(), PATHINFO_EXTENSION);

            $data["file_name"] = "image" . uniqid() . "." . $extension;
            $data["file_path"] = $uploadFolder;
            $data["user_uuid"] = $user_uuid;

            $data['name'] = $this->request->get("name", "Untitle image - " . mt_rand());
            $data['description'] = $this->request->get("description", "Untitle image");

            if (file_exists($data["file_path"])) {

                if (false == $file->move ($data["file_path"], $data["file_name"])) {
                    $this->error["status"] = "failure";
                    $this->error["message"] = "move file error";
                    return false;
                } else {

                    $size = getimagesize($data["file_path"] . $data["file_name"]);
                    $data["width"] = $size[0];
                    $data["height"] = $size[1];

                    $image = new Image();
                    if (!$image->save ($data)) {

                        $this->error["status"] = "failure";
                        $this->error["message"] = "save image to db error";
                        return false;
                    }
                }

            } else {
                $this->error["status"] = "failure";
                $this->error["message"] = "upload folder not exist";
                return false;
            }
        }

        return true;

    }



}