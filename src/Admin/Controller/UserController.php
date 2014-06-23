<?php

namespace Admin\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Admin\Controller\BaseController;

use Model\User;

class UserController extends BaseController
{

    public function __construct($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();
    }

    // to display all users in a list table, that's very common
    // but what if one object related to another one
    // we should think about that right?
    // user ==> images

    // user ==> name, email, created date, modified date, resources <image, .....>

    public function userList ()
    {

        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 25);

        $data["page"] = $page;
        $data["page_size"] = $pageSize;

        $user = new User();

        $userArray = $user->getUserList();

        foreach ($userArray as $user) {

        }

    }



}