<?php

namespace Admin\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Silex\Provider\TwigServiceProvider;
use Admin\Controller\BaseController;

use Model\User;

class IndexController extends BaseController
{

    public function __construct($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();

        $this->app->register(new TwigServiceProvider(), array(
            'twig.path' => realpath (__DIR__ . '/../View'),
        ));
    }

    public function index()
    {

        return $this->app["twig"]->render ("index.twig");

    }


}