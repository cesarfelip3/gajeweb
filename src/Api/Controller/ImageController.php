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

        if (!$user->userExists($userId)) {

            $this->error["status"] = "failure";
            $this->error["message"] = "user doen't exist for userId=" . $userId;
            $this->json($this->error, true);
        }

        if ($file->isValid()) {

            $data = array ();
            $data["mime"] = $file->getMimeType();
            $data["extension"] = pathinfo($file->getClientOriginalName(), PATHINFO_EXTENSION);

            $data["file_name"] = "image" . uniqid();
            $data["file_path"] = $this->app["upload.folder.image"];

            if (file_exists($data["file_path"])) {

                if (false == $file->move ($data["file_path"], $data["file_name"] . "." . $data["extension"])) {
                    $this->error["status"] = "failure";
                    $this->error["message"] = "move file error";
                } else {

                    $image = new Image();
                    if (!$image->create($userId, $data)) {



                    }
                }

            } else {
                $this->error["status"] = "failure";
                $this->error["message"] = "upload folder not exist";
            }
        }

        $this->json($this->error, true);
    }



}