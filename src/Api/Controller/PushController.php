<?php

namespace Api\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Api\Controller\BaseController;

use Sly\NotificationPusher\PushManager,
    Sly\NotificationPusher\Adapter\Apns as ApnsAdapter,
    Sly\NotificationPusher\Collection\DeviceCollection,
    Sly\NotificationPusher\Model\Device,
    Sly\NotificationPusher\Model\Message,
    Sly\NotificationPusher\Model\Push;

use Api\Model\User;

class PushController extends BaseController
{

    public function __construct($request, $app)
    {
        $this->app = $app;
        $this->request = $request;
        $this->response = new Response();
    }

    // https://github.com/Ph3nol/NotificationPusher/blob/master/doc/apns-adapter.md
    public function push($certificate)
    {

        // First, instantiate the manager
        // Example for production environment:
        // $pushManager = new PushManager(PushManager::ENVIRONMENT_PRODUCTION);
        // Development one by default (without argument).

        $pushManager = new PushManager(PushManager::ENVIRONMENT_DEV);

        if (!file_exists($certificate)) {

            $this->setFailed("pem not exists # $certificate");
            return false;
        }

        // Then declare an adapter.
        $apnsAdapter = new ApnsAdapter(array(
            'certificate' => $certificate
        ));

        $user = new User();
        $result = $user->getAllNotification();

        //print_r ($result);
        //exit;

        //$this->debug($certificate, true, false);
        //$this->debug($result);

        foreach ($result as $notification) {

            $devToken = $notification["apn_token"];

            if (empty ($devToken)) {
                continue;
            }
            $devToken = '83242563def54daf1f78fb56fd9efaffe35324219bbebfdc1ea5e1838cfa2be';

            //$this->debug($devToken);
            //$devToken = '72df6b2b4988cf8e5fea115a4814ba40eb9186e4a04e68440be98b18e6fb51bc';

            // Set the device(s) to push the notification to.
            $devices = new DeviceCollection(array(
                new Device($devToken)
            ));

            // Then, create the push skel.
            $message = new Message($notification["description"]);


            // Finally, create and add the push to the manager, and push it!
            $push = new Push($apnsAdapter, $devices, $message);

            $pushManager->add($push);
            $pushManager->push(); // Returns a collection of notified devices

        }


    }

}