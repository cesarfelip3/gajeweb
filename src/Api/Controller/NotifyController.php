<?php

namespace Api\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


use Api\Controller\BaseController;
use Api\Model\Image;
use Api\Model\User;
use Api\Model\Notification;

class NotifyController extends BaseController
{

    public function __construct($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();
    }

    public function getNotificationList()
    {
        $page = $this->request->get("page", 0);
        $pageSize = $this->request->get("page_size", 1);

        $data = array();
        $data["page"] = intval($page);
        $data["page_size"] = intval($pageSize);

        $notification = new Notification();
        $result = $notification->getNotificationList($data);

        if (empty ($result)) {

            $this->setSuccess("empty result from db", array("notifications" => array()));
        } else {

            $this->setSuccess("", array("notifications" => $result));
        }

        return true;

    }
}