<?php

namespace Admin\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Silex\Provider\TwigServiceProvider;
use Admin\Controller\BaseController;

use Model\User;

class UserController extends BaseController
{

    public function __construct($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();

        $this->app->register(new TwigServiceProvider(), array(
            'twig.path' => realpath(__DIR__ . '/../View'),
            //'twig.options' => array(
            //    "cache" => realpath(__DIR__ . "/../cache")
            //)
        ));
    }

    // to display all users in a list table, that's very common
    // but what if one object related to another one
    // we should think about that right?
    // user ==> images

    // user ==> name, email, created date, modified date, resources <image, .....>

    public function userList ()
    {

        $response = new Response();
        $response->setTtl(5);

        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 25);

        $data["page"] = $page;
        $data["page_size"] = $pageSize;

        $user = new User();
        $headerArray = $user->getUserListHeader();
        $userArray = $user->getUserList($data);

        $total = $user->getTotal();

        foreach ($userArray as &$user) {

            $user["create_date"] = date("Y-m-d", $user["create_date"]);
            $user["modified_date"] = date("Y-m-d", $user["modified_date"]);
        }

        $response->setContent($this->app["twig"]->render("user_list.twig", array (
            "headerArray" => $headerArray,
            "userArray" => $userArray,
            "page" => $page,
            "pageSize" => $pageSize,
            "totalPages" => $total,
        )));

        return $response;
    }



}