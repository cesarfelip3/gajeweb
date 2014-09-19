<?php

namespace Test\Api\Controller;


class UserController {


    //@case API
    //@url /user/add

    public function user_add ($curl)
    {


    }

    public function user_notification_update ($param)
    {

        //$url = "http://localhost/gajeweb/api_v1/user/notification/update";
        //$curl->post($url, $data);

        print_r ($param);
        return "hello test!";

    }

} 