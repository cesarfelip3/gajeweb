<?php

namespace Admin\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Silex\Provider\TwigServiceProvider;
use Admin\Controller\BaseController;

use Admin\Model\User;

class UserController extends BaseController
{

    public function __construct(Request $request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        //$this->response = new Response();

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

    public function userList()
    {

        $response = new Response();
        $response->setTtl(5);

        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 25);

        $data["page"] = intval($page) <= 0 ? 0 : intval($page);
        $data["page_size"] = $pageSize <= 25 ? 25 : intval($pageSize);

        $user = new User();
        $headerArray = $user->getUserListHeader();
        $userArray = $user->getUserList($data);

        $total = $user->getTotal();

        foreach ($userArray as &$user) {

            if ($user['status'] == 1) {

                $user["#"] = '';
                $user['status'] = '<a href="javascript:del(\'' . $user["user_uuid"] . '\');"> Enabled </a>';

            } else {

                //$user["#"] = '';
                $user['status'] = '<a href="javascript:del(\'' . $user["user_uuid"] . '\');"> Disabled </a>';
            }


            $user["create_date"] = date("Y-m-d", $user["create_date"]);
            $user["modified_date"] = date("Y-m-d", $user["modified_date"]);
        }

        $totalPage = ceil ($total / $pageSize);
        $baseurl = "/gajeweb/admin";


        $i = (int)($page / 10) * 10;
        $i = $i <= 0 ? 0 : $i;

        $prev = $page - 1;
        $next = $page + 1;
        $next = $next >= $totalPage ? $totalPage - 1 : $next;

        $count = $i + 10;
        $count = $count >= $totalPage ? $totalPage : $count;

        $pagination = "<li><a href='$baseurl/user?page=$prev'>«</a></li>";

        for (;$i < $count; $i++) {

            $j = $i + 1;
            if ($i == $page) {

                $pagination .= "<li class='active'><a href='$baseurl/user?page=$i'>$j</a></li>";

            } else {

                $pagination .= "<li><a href='$baseurl/user?page=$i'>$j</a></li>";

            }
        }

        $pagination .= "<li><a href='$baseurl/user?page=$next'>»</a></li>";

        $response->setContent($this->app["twig"]->render("user_list.twig", array(
            "headerArray" => $headerArray,
            "userArray" => $userArray,
            "page" => $page,
            "pageSize" => $pageSize,
            "totalPages" => $totalPage,
            "pagination" => $pagination,
            "totalUsers" => $total,
            "enableUrl" => 'http://' . $this->request->getHost() . "/gajeweb/admin/user/enable/"
        )));

        return $response;
    }

    function enableUser ($id)
    {

        $user = new User();
        $status = $user->enableUser(array ("user_uuid" => $id));

        exit($status);

    }


}