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
            'twig.path' => realpath(__DIR__ . '/../View'),
            'twig.options' => array(
                "cache" => realpath(__DIR__ . "/../cache")
            )
        ));
    }

    public function index()
    {

        // let's see if this works, and it worked!
        $response = new Response();
        $response->setTtl(5);

        $response->setContent($this->app["twig"]->render("index.twig"));

        return $response;

    }


}