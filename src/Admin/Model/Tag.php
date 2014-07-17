<?php

namespace Admin\Model;

use Admin\Model\BaseModel;

class Tag extends BaseModel
{

    public $table = "tag";

    public function __construct()
    {
        $this->db = self::$DB;
    }

}