<?php

namespace Model;

use \Model\Model;

class Image extends Model {


    public $table = "image";

    public function __construct()
    {
        $this->db = self::$DB;
    }

    public function addImage ($data)
    {

        $data["image_uuid"] = uniqid();
        $data["create_date"] = time();
        $data["modified_date"] = time ();

        $this->db->insert($this->table, $data);

        return $data["image_uuid"];
    }

    public function updateImage ($data)
    {

        $image_uuid = $data["image_uuid"];
        unset($data["image_uuid"]);
        $this->db->update($this->table, $data, array('image_uuid'=>$image_uuid));
    }

    public function deleteImage ($imageId)
    {
        $this->db->delete($this->table, array('token' => $data["token"]));
    }

    public function imageExists ($imageId)
    {
        $uuid = $this->db->fetchColumn("SELECT image_uuid FROM {$this->table} WHERE image_uuid=?", array ($imageId));

        if (empty ($uuid)) {
            return false;
        }

        return $uuid;
    }

    // get images
    public function getImagesByUser ($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];
        $user_uuid = $data["user_uuid"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";
        $result = $this->db->fetchAssoc ("SELECT * FROM {$this->table} WHERE user_uuid=? LIMIT {$limit} ORDER BY modified_date DESC");

        return $result;

    }

    public function getLatestImages()
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $sql = "SELECT * FROM {$this->table} LIMIT ?,? ORDER BY modified_date DESC";
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(1, $page * $pageSize);
        $stmt->bindValue(2, $pageSize);
        $stmt->exe
    }

}