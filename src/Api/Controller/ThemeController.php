<?php

namespace Api\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


use Api\Controller\BaseController;
use Model\Image;
use Model\User;
use Model\Theme;

class ThemeController extends BaseController
{

    public function __construct($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();
    }

    public function getThemeList()
    {
        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 1);

        $data = array();
        $data["page"] = intval($page);
        $data["page_size"] = intval($pageSize);

        $theme = new Theme();
        $result = $theme->getThemeList($data);

        if (empty ($result)) {

            $this->setSuccess("empty result from db", array("themes" => array()));
        } else {

            $this->setSuccess("", array("themes" => $result));
        }

        return true;

    }
}