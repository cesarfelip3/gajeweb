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

    public function deleteImage($data)
    {
        return $this->db->delete($this->table, array('image_uuid' => $data["image_uuid"]));
    }

    public function imageExists($imageId)
    {
        $uuid = $this->db->fetchColumn("SELECT image_uuid FROM {$this->table} WHERE image_uuid=?", array($imageId));

        if (empty ($uuid)) {
            return false;
        }

        return $uuid;
    }

    //

    public function updateComment ($data)
    {
        $sql = "UPDATE " . $this->table_image_comment . " SET is_read=? WHERE comment_uuid=? AND image_uuid=?";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(1, $data["is_read"]);
        $stmt->bindValue(2, $data["comment_uuid"]);
        $stmt->bindValue(3, $data["image_uuid"]);
        $stmt->execute();
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

    public function updateBrander ($data)
    {
        $sql = "UPDATE " . $this->table_image_brander . " SET is_read=? WHERE user_uuid=? AND image_uuid=?";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(1, $data["is_read"]);
        $stmt->bindValue(2, $data["brander_uuid"]);
        $stmt->bindValue(3, $data["image_uuid"]);
        $stmt->execute();
    }

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

    public function getLatestImages($data)
    {
        $user_uuid = $data["user_uuid"];

        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";
        $sql = "SELECT *
            FROM view_image_latest_collection
            WHERE user_uuid NOT IN (SELECT user_block_uuid FROM user_block WHERE user_uuid=?) OR
             image_uuid NOT IN (SELECT image_uuid FROM user_exclude_image WHERE user_uuid=?)
            ORDER BY modified_date DESC
            LIMIT {$limit}";

        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(1, $user_uuid);
        $stmt->bindValue(2, $user_uuid);
        $stmt->execute();

        $result = $stmt->fetchAll();

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

    public static function table ()
    {
        return "image";
    }

}