<?php

namespace Model;

use \Model\Model;

class Image extends Model {


    public $table = "image";

    public function __construct()
    {
        $this->db = self::$DB;
    }

    public function save ($userId, $data)
    {

        $data["image_uuid"] = uniqid();
        $data["user_uuid"] = $userId;
        $data["create_date"] = time();
        $data["modified_date"] = time ();

        $this->db->insert($this->table, $data);
    }

    public function update ($imageId, $data)
    {

    }

    public function remove ($imageId)
    {

    }

    public function latest ($data)
    {

    }

    public function getImagesByCategory ($categoryId)
    {

    }

    public function getImagesByTag ($tagId)
    {

    }

    public function getImagesByUser ($userId, $data)
    {

        // all images

        // one category

    }

}