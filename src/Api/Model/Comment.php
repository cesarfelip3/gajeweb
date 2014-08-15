<?php

namespace Api\Model;

use Api\Model\BaseModel;

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

        return $result;

    }

    public function getLatestCommentsByUser($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];
        $user_uuid = $data["user_uuid"];
        $modified_date = $data["modified_date"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";
        $sql = "SELECT `comment_uuid`, `name`, `description`, `width`, `height`, `create_date`, `modified_date`, `file_name` FROM {$this->table} WHERE user_uuid=? AND modified_date>? ORDER BY modified_date DESC LIMIT {$limit}";

        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(1, $user_uuid);
        $stmt->bindValue(2, $modified_date);
        $stmt->execute();

        $result = $stmt->fetchAll();

        return $result;
    }

    public static function table()
    {
        return "comment";
    }

}