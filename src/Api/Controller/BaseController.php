<?php

namespace Api\Controller;
use Symfony\Component\HttpFoundation\Request;

class BaseController {

    protected $app;
    protected $request;
    protected $response;
    protected $error = array (
        "status" => "success",
        "message" => "",
        "data" => array ()
    );


    public function getError ()
    {
        return $this->error;
    }

    public function json ($message, $output=true)
    {
        if (!is_array($message) || !is_object($message)) {
            return false;
        }

        if ($output) {
            $this->app->json ($message, 404);
        }

        return json_encode($output);
    }
}