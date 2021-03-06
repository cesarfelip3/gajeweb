<?php

namespace Admin\Model;

use Admin\Model\BaseModel;
use Admin\Model\Comment;
use Admin\Model\Theme;

class Image extends BaseModel
{


    public $table = "image";
    public $table_image_comment = "image_comment";
    public $table_image_brander = "image_brander";

    public function __construct()
    {
        $this->db = self::$DB;
    }

    public function getImageListHeader()
    {
        return array(
            "#" => "#",
            "name" => "name",
            "description" => "description",
            "width" => "width",
            "height" => "height",
            "create_date" => "create date",
            "modified_date" => "modified date",
            "thumbnail" => "thumbnail",
        );
    }

    public function getTotal()
    {

        $theme_table = "theme";
        $result = $this->db->fetchAll("SELECT * FROM $theme_table
            WHERE is_zipped=0
            ORDER BY modified_date DESC");

        if (empty($result)) {
            return array();
        }

        $theme_uuid = $result[0]['theme_uuid'];

        $total = $this->db->fetchColumn("SELECT COUNT(*) FROM {$this->table} WHERE theme_uuid='$theme_uuid'");
        return $total;
    }

    public function getImageList($data)
    {
        $theme_table = "theme";
        $result = $this->db->fetchAll("SELECT * FROM $theme_table
            WHERE is_zipped=0
            ORDER BY modified_date DESC");

        if (empty($result)) {
            return array();
        }

        $theme_uuid = $result[0]['theme_uuid'];

        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";
        $result = $this->db->fetchAll("SELECT * FROM {$this->table} WHERE theme_uuid='$theme_uuid' ORDER BY modified_date DESC LIMIT {$limit}");

        return $result;
    }

    public function imageExists($imageId)
    {
        $uuid = $this->db->fetchColumn("SELECT image_uuid FROM {$this->table} WHERE image_uuid=?", array($imageId));

        if (empty ($uuid)) {
            return false;
        }

        return $uuid;
    }

    public function removeAll()
    {
        $this->db->executeQuery ("DELETE FROM " . $this->table);
        $this->db->executeQuery ("DELETE FROM " . $this->table_image_brander);
        $this->db->executeQuery ("DELETE FROM " . $this->table_image_comment);
    }

    public function deleteImage($imageId)
    {
        $this->db->delete($this->table, array('image_uuid' => $imageId));
        $this->db->delete($this->table_image_brander, array('image_uuid' => $imageId));
        $this->db->delete($this->table_image_comment, array('image_uuid' => $imageId));
    }

    public function getImage($data)
    {

        $image_uuid = $data["image_uuid"];
        $limit = "0, 1";
        $result = $this->db->fetchAll("SELECT * FROM {$this->table} WHERE image_uuid=? ORDER BY modified_date DESC LIMIT {$limit} ", array($image_uuid));

        return $result;
    }

    public function getImageByUser($data)
    {

        $user_uuid = $data["user_uuid"];
        $limit = "0, 1";
        $result = $this->db->fetchAll("SELECT `image_uuid`, `name`, `description`, `width`, `height`, `create_date`, `modified_date`, `file_name`, `thumbnail` FROM {$this->table} WHERE user_uuid=? ORDER BY modified_date DESC LIMIT {$limit} ", array($user_uuid));

        return $result;
    }

    public function getImagesByUser($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];
        $user_uuid = $data["user_uuid"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";
        $result = $this->db->fetchAll("SELECT `image_uuid`, `name`, `description`, `width`, `height`, `create_date`, `modified_date`, `file_name`, `thumbnail` FROM {$this->table} WHERE user_uuid=? ORDER BY modified_date DESC LIMIT {$limit} ", array($user_uuid));

        return $result;

    }

    public function getLatestImages($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $userTable = User::table();

        $sql = "SELECT img.image_uuid, img.name, img.description, img.width, img.height, img.create_date, img.modified_date, img.file_name, img.thumbnail, usr.facebook_token AS user_token, usr.user_uuid AS user_uuid, usr.fullname AS fullname, usr.username AS username FROM {$this->table} img INNER JOIN $userTable usr ON img.user_uuid=usr.user_uuid  ORDER BY modified_date DESC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();

        $result = $stmt->fetchAll();

        return $result;
    }

    public function getImagesWithoutThumbnail($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $userTable = User::table();

        $sql = "SELECT img.image_uuid, img.width, img.height, img.file_path, img.file_name, usr.token AS user_token, usr.user_uuid AS user_uuid, usr.fullname AS fullname, usr.username AS username FROM {$this->table} img INNER JOIN $userTable usr ON img.user_uuid=usr.user_uuid WHERE img.thumbnails=0 ORDER BY modified_date DESC";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();

        $result = $stmt->fetchAll();

        return $result;
    }


}