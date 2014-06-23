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

    public function addTheme ()
    {

    }

    public function themeList ()
    {

    }

}