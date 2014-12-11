<?php


namespace Api\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Api\Controller\BaseController;
use Api\Model\Image;
use Api\Model\User;
use Api\Model\Theme;
use Api\Model\Comment;

class CleanController extends BaseController
{

    public function __construct($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();
    }


    public function cleanObsolatedTheme($from, $to) {

        print_r("cleanObsolatedTheme\n");
        print_r($from . "\n");
        print_r($to . "\n");

        if (!file_exists($from)) {

            return $this->setFailed("$from does not exist in filesystem");
        }

        if (!file_exists($to)) {

            return $this->setFailed("$to does not exist in filesystem");
        }


        $image = new Image();
        $image->removeImagesByTheme(
            array (
                "from" => $from,
                "to" => $to
            )
        );
    }
}