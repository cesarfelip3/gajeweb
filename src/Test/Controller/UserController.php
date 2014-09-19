<?php

namespace Test\Controller;


class UserController {


    //@case API
    //@url /user/add

    public function user_add ($curl)
    {


    }

    public function user_notification_update ($curl, $data)
    {

        $url = "http://localhost/gajeweb/api_v1/user/notification/update";
        $curl->post($url, $data);


    }

} 