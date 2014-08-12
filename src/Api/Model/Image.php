<?php

namespace Api\Model;

use Api\Model\BaseModel;
use Api\Model\Comment;

class Image extends BaseModel
{

    public $table = "image";
    public $table_image_comment = "image_comment";
    public $table_image_brander = "image_brander";

    public function __construct()
    {
        $this->db = self::$DB;
    }

    public function addImage($data)
    {

        $data["image_uuid"] = uniqid();
        $data["create_date"] = time();
        $data["modified_date"] = time();

        $this->db->insert($this->table, $data);

        return $data["image_uuid"];
    }

    public function updateImage($data)
    {

        $image_uuid = $data["image_uuid"];
        unset($data["image_uuid"]);
        $this->db->update($this->table, $data, array('image_uuid' => $image_uuid));
    }

    public function deleteImage($imageId)
    {
        $this->db->delete($this->table, array('token' => $data["token"]));
    }

    public function imageExists($imageId)
    {
        $uuid = $this->db->fetchColumn("SELECT image_uuid FROM {$this->table} WHERE image_uuid=?", array($imageId));

        if (empty ($uuid)) {
            return false;
        }

        return $uuid;
    }

    public function addComment($data)
    {
        $this->db->insert($this->table_image_comment, $data);
    }

    public function getCommentList($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $commentTable = Comment::table();
        $userTable = User::table();

        $sql = "SELECT cmt.*, usr.username AS username, usr.facebook_icon AS usericon FROM {$this->table_image_comment} img INNER JOIN $commentTable cmt ON img.comment_uuid=cmt.comment_uuid INNER JOIN $userTable usr ON cmt.user_uuid=usr.user_uuid WHERE img.image_uuid=? ORDER BY cmt.modified_date ASC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(1, $data["image_uuid"]);
        $stmt->execute();
        $result = $stmt->fetchAll();

        return $result;
    }

    // brander

    public function addBrander($data)
    {
        $user_uuid = $data["user_uuid"];
        $image_uuid = $data["image_uuid"];

        $uuid = $this->db->fetchColumn("SELECT image_uuid FROM {$this->table_image_brander} WHERE image_uuid=? AND user_uuid=?", array($image_uuid, $user_uuid));

        if (!empty ($uuid)) {
            return true;
        }

        $this->db->insert($this->table_image_brander, $data);
    }

    public function getBranderList($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $commentTable = Comment::table();
        $userTable = User::table();

        $sql = "SELECT usr.* FROM {$this->table_image_brander} img INNER JOIN $userTable usr ON img.user_uuid=usr.user_uuid WHERE img.image_uuid=? ORDER BY img.create_date ASC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(1, $data["image_uuid"]);
        $stmt->execute();
        $result = $stmt->fetchAll();

        return $result;
    }

    public function branderExist($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $commentTable = Comment::table();
        $userTable = User::table();

        $sql = "SELECT img.image_uuid FROM {$this->table_image_brander} img INNER JOIN $userTable usr ON img.user_uuid=usr.user_uuid WHERE img.image_uuid=? AND img.user_uuid=? ORDER BY img.create_date ASC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(1, $data["image_uuid"]);
        $stmt->bindValue(2, $data["user_uuid"]);

        $stmt->execute();
        $result = $stmt->fetchColumn();

        if (empty ($result)) {
            return false;
        }

        return $result;
    }

    //================================
    // get images
    //================================

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
        $user_uuid = $data["user_uuid"];

        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $userTable = User::table();

        $sql = "SELECT img.image_uuid, img.name, img.description, img.width, img.height, img.create_date, img.modified_date, img.file_name, img.thumbnail, usr.facebook_token AS user_token, usr.user_uuid AS user_uuid, usr.fullname AS fullname, usr.username AS username FROM {$this->table} img INNER JOIN $userTable usr ON img.user_uuid=usr.user_uuid WHERE usr.user_uuid NOT IN (SELECT usrb.user_block_uuid FROM user_block usrb WHERE usrb.user_uuid=?) ORDER BY modified_date DESC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(1, $user_uuid);
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