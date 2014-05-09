<?php

namespace Model;

use \Model;

class Image extends Model {

    public function __construct ()
    {
        $this->db = self::$DB;
    }

    public function create ($userId, $data)
    {

    }

    public function remove ($imageId)
    {

    }

    public function edit ($imageId, $data)
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