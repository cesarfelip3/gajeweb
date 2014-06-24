<?php


namespace Admin\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


use Admin\Controller\BaseController;
use Model\Image;
use Model\User;

class ImageController extends BaseController
{

    public function __construct($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();
    }

    public function imageList()
    {

        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 25);

        $data["page"] = $page;
        $data["page_size"] = $pageSize;

        $image = new Image();

    }

}