<?php

namespace Admin\Model;

use \Admin\Model\BaseModel;

class Comment extends BaseModel
{


    public $table = "comment";
    public $table_comment_comment = "comment_comment";

    public function __construct()
    {
        $this->db = self::$DB;
    }

    public function addComment($data)
    {

        $data["comment_uuid"] = uniqid();
        $data["create_date"] = time();
        $data["modified_date"] = time();

        $this->db->insert($this->table, $data);

        return $data["comment_uuid"];
    }

    public function updateComment($data)
    {

        $comment_uuid = $data["comment_uuid"];
        unset($data["comment_uuid"]);
        $this->db->update($this->table, $data, array('comment_uuid' => $comment_uuid));
    }

    public function deleteComment($commentId)
    {
        $this->db->delete($this->table, array('token' => $data["token"]));
    }

    public function commentExists($commentId)
    {
        $uuid = $this->db->fetchColumn("SELECT comment_uuid FROM {$this->table} WHERE comment_uuid=?", array($commentId));

        if (empty ($uuid)) {
            return false;
        }

        return $uuid;
    }


    //=====================================
    // admin
    //=====================================

    public function getCommentListHeader()
    {
        return array(
            "#" => "#",
            "name" => "name",
            "description" => "description",
            "width" => "width",
            "height" => "height",
            "create_date" => "create date",
            "modified_date" => "modified date"
        );
    }

    public function getTotal()
    {
        $total = $this->db->fetchColumn("SELECT COUNT(*) FROM {$this->table}");
        return $total;
    }

    public function getCommentList($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";
        $result = $this->db->fetchAll("SELECT * FROM {$this->table} ORDER BY modified_date DESC LIMIT {$limit}");

        return $result;
    }

    //================================
    // get comments
    //================================

    public function getCommentsByUser($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];
        $user_uuid = $data["user_uuid"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";
        $result = $this->db->fetchAll("SELECT `comment_uuid`, `name`, `description`, `width`, `height`, `create_date`, `modified_date`, `file_name` FROM {$this->table} WHERE user_uuid=? ORDER BY modified_date DESC LIMIT {$limit} ", array($user_uuid));

        if (!empty ($result)) {

            foreach ($result as &$item) {

            }
        }

        return $result;

    }

    public function getLatestComments($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $userTable = User::table();

        $sql = "SELECT img.comment_uuid, img.name, img.description, img.width, img.height, img.create_date, img.modified_date, img.file_name, usr.facebook_token AS user_token, usr.user_uuid AS user_uuid, usr.fullname AS fullname, usr.username AS username FROM {$this->table} img INNER JOIN $userTable usr ON img.user_uuid=usr.user_uuid  ORDER BY modified_date DESC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();

        $result = $stmt->fetchAll();

        return $result;
    }

    public function getCommentsWithoutThumbnail($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $userTable = User::table();

        $sql = "SELECT img.comment_uuid, img.width, img.height, img.file_path, img.file_name, usr.token AS user_token, usr.user_uuid AS user_uuid, usr.fullname AS fullname, usr.username AS username FROM {$this->table} img INNER JOIN $userTable usr ON img.user_uuid=usr.user_uuid WHERE img.thumbnails=0 ORDER BY modified_date DESC";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();

        $result = $stmt->fetchAll();

        return $result;
    }

    public static function table()
    {
        return "comment";
    }

}