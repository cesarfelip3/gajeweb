<?php

namespace Api\Model;

use Api\Model\BaseModel;

class User extends BaseModel
{

    public $table = "user";
    public $table_user_follow = "user_follow";
    public $table_user_block = "user_block";

    public function __construct()
    {
        $this->db = self::$DB;
    }

    public function addUser($data)
    {

        $data["user_uuid"] = uniqid();
        $data["create_date"] = time();
        $data["modified_date"] = time();
        $this->db->insert($this->table, $data);

        return $data["user_uuid"];
    }

    public function updateUser($data)
    {
        $token = $data["facebook_token"];
        unset ($data["facebook_token"]);
        $data["modified_date"] = time();
        $this->db->update($this->table, $data, array('facebook_token' => $token));
    }

    public function updateUserByUUID($data)
    {
        $userUUID = $data["user_uuid"];
        unset ($data["user_uuid"]);
        $data["modified_date"] = time();
        $this->db->update($this->table, $data, array('user_uuid' => $userUUID));
    }

    public function deleteUser($data)
    {
        $this->db->delete($this->table, array('facebook_token' => $data["facebook_token"]));
    }

    public function userExistsByToken($userId)
    {
        $uuid = $this->db->fetchColumn("SELECT user_uuid FROM {$this->table} WHERE facebook_token=?", array($userId));

        if (empty ($uuid)) {
            return false;
        }

        return $uuid;
    }

    public function userExists($userId)
    {
        $uuid = $this->db->fetchColumn("SELECT user_uuid FROM {$this->table} WHERE user_uuid=?", array($userId));

        if (empty ($uuid)) {
            return false;
        }

        return $uuid;
    }

    public function filterUserByName ($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $sql = "SELECT DISTINCT usr.* FROM {$this->table} usr WHERE usr.username LIKE ? ORDER BY usr.create_date DESC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue (1, $data["name"]);
        $stmt->execute();
        $result = $stmt->fetchAll();

        return $result;
    }


    //===============================
    //
    //===============================

    public function blockExist($data)
    {
        $uuid = $this->db->fetchColumn("SELECT user_uuid FROM {$this->table_user_block} WHERE user_uuid=? AND user_block_uuid=?", array($data["user_uuid"], $data["user_block_uuid"]));

        if (empty ($uuid)) {
            return false;
        }

        return $uuid;
    }

    public function addBlock($data)
    {
        $data["create_date"] = time();
        $this->db->insert($this->table_user_block, $data);
    }

    //=====================================
    //
    //=====================================

    // when you follow your followers, and it will be is_mutal
    // for each of them, it's same

    public function addFollow($data)
    {
        $data["create_date"] = time();
        if ($this->followExist(array(
            "user_followed_uuid" => $data["user_following_uuid"],
            "user_following_uuid" => $data["user_followed_uuid"]
        ))
        ) {

            $data["is_mutual"] = 1;
            $this->db->update($this->table_user_follow, array("is_mutual"=>1), array(
                "user_followed_uuid" => $data["user_following_uuid"],
                "user_following_uuid" => $data["user_followed_uuid"]));
        }

        $this->db->insert($this->table_user_follow, $data);
    }

    public function deleteFollow($data)
    {
        if ($this->followExist(array(
            "user_followed_uuid" => $data["user_following_uuid"],
            "user_following_uuid" => $data["user_followed_uuid"]
        ))
        ) {

            $data["is_mutual"] = 1;
            $this->db->update($this->table_user_follow, array("is_mutual"=>0), array(
                "user_followed_uuid" => $data["user_following_uuid"],
                "user_following_uuid" => $data["user_followed_uuid"]));
        }

        $this->db->delete($this->table_user_follow, array("user_followed_uuid" => $data["user_followed_uuid"], "user_following_uuid" => $data["user_following_uuid"]));

    }

    public function followExist($data)
    {
        $uuid = $this->db->fetchColumn("SELECT user_followed_uuid FROM {$this->table_user_follow} WHERE user_followed_uuid=? AND user_following_uuid=?", array($data["user_followed_uuid"], $data["user_following_uuid"]));

        if (empty ($uuid)) {
            return false;
        }

        return $uuid;
    }

    public function getFollowerList($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $sql = "SELECT DISTINCT usr.*, fol.is_mutual AS is_mutual FROM {$this->table} usr INNER JOIN {$this->table_user_follow} fol ON usr.user_uuid=fol.user_following_uuid WHERE fol.user_followed_uuid=? ORDER BY fol.create_date DESC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue (1, $data["user_uuid"]);
        $stmt->execute();
        $result = $stmt->fetchAll();

        return $result;
    }

    public function getFollowingList($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $sql = "SELECT DISTINCT usr.*, fol.is_mutual AS is_mutual FROM {$this->table} usr INNER JOIN {$this->table_user_follow} fol ON usr.user_uuid=fol.user_followed_uuid WHERE fol.user_following_uuid=? ORDER BY fol.create_date DESC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue (1, $data["user_uuid"]);
        $stmt->execute();
        $result = $stmt->fetchAll();

        return $result;
    }

    //====================================
    //
    //====================================

    public function getUpdateInfo ($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $sql = "SELECT DISTINCT modified_date FROM {$this->table} WHERE user_uuid=?";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue (1, $data["user_uuid"]);
        $stmt->execute();
        $result = $stmt->fetchColumn();

        $modified = $result["modified_date"];

        if (empty ($modified)) {
            return false;
        }

        $tableComment = Comment::table();
        $tableImageBrander = "image_brander";
        $tableImageComment = "image_comment";
        $tableImage = Image::table();

        // get comments first
        $sql = "SELECT img.image_uuid, img.name, img.description, img.width, img.height, img.create_date, img.modified_date, img.file_name, img.thumbnail, usr.facebook_token AS user_token, usr.user_uuid AS user_uuid, usr.fullname AS fullname, usr.username AS username, cmt.user_uuid AS comment_user_uuid FROM $tableImage img INNER JOIN $tableImageComment imgcmt ON img.image_uuid=imgcmt.image_uuid INNER JOIN $tableComment AS cmt ON cmt.comment_uuid=imgcmt.comment_uuid INNER JOIN {$this->table} usr ON cmt.user_uuid=usr.user_uuid WHERE cmt.modified_date>=? AND img.user_uuid=? ORDER BY cmt.modified_date ASC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue (1, $modified);
        $stmt->bindValue (2, $data["user_uuid"]);
        $stmt->execute();
        $comments = $stmt->fetchAll();

        // get comments first
        $sql = "SELECT img.image_uuid, img.name, img.description, img.width, img.height, img.create_date, img.modified_date, img.file_name, img.thumbnail, usr.facebook_token AS user_token, usr.user_uuid AS user_uuid, usr.fullname AS fullname, usr.username AS username, imgcmt.user_uuid AS brander_user FROM $tableImage img INNER JOIN $tableImageBrander imgcmt ON img.image_uuid=imgcmt.image_uuid INNER JOIN {$this->table} usr ON imgcmt.user_uuid=usr.user_uuid WHERE imgcmt.create_date>=? AND img.user_uuid=? ORDER BY imgcmt.create_date ASC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue (1, $modified);
        $stmt->bindValue (2, $data["user_uuid"]);
        $stmt->execute();
        $branders = $stmt->fetchAll();

        $sql = "SELECT DISTINCT usr.*, fol.is_mutual AS is_mutual FROM {$this->table} usr INNER JOIN {$this->table_user_follow} fol ON usr.user_uuid=fol.user_following_uuid WHERE fol.create_date>=? AND fol.user_followed_uuid=? ORDER BY fol.create_date DESC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue (1, $modified);
        $stmt->bindValue (2, $data["user_uuid"]);
        $stmt->execute();
        $followers = $stmt->fetchAll();

        return array ("comments"=>$comments, "branders"=>$branders, "followers" => $followers);
    }

    public function getNumberOfUpdateInfo ($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";

        $sql = "SELECT DISTINCT modified_date FROM {$this->table} WHERE user_uuid=?";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue (1, $data["user_uuid"]);
        $stmt->execute();
        $result = $stmt->fetchColumn();

        $modified = $result["modified_date"];

        if (empty ($modified)) {
            return false;
        }

        $tableComment = Comment::table();
        $tableImageBrander = "image_brander";
        $tableImageComment = "image_comment";
        $tableImage = Image::table();

        // get comments first
        $sql = "SELECT img.image_uuid, img.name, img.description, img.width, img.height, img.create_date, img.modified_date, img.file_name, img.thumbnail, usr.facebook_token AS user_token, usr.user_uuid AS user_uuid, usr.fullname AS fullname, usr.username AS username, cmt.user_uuid AS comment_user_uuid FROM $tableImage img INNER JOIN $tableImageComment imgcmt ON img.image_uuid=imgcmt.image_uuid INNER JOIN $tableComment AS cmt ON cmt.comment_uuid=imgcmt.comment_uuid INNER JOIN {$this->table} usr ON cmt.user_uuid=usr.user_uuid WHERE cmt.modified_date>=? AND img.user_uuid=? ORDER BY cmt.modified_date ASC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue (1, $modified);
        $stmt->bindValue (2, $data["user_uuid"]);
        $stmt->execute();
        $comments = $stmt->fetchAll();

        $total = count($comments);

        // get comments first
        $sql = "SELECT img.image_uuid, img.name, img.description, img.width, img.height, img.create_date, img.modified_date, img.file_name, img.thumbnail, usr.facebook_token AS user_token, usr.user_uuid AS user_uuid, usr.fullname AS fullname, usr.username AS username, imgcmt.user_uuid AS brander_user FROM $tableImage img INNER JOIN $tableImageBrander imgcmt ON img.image_uuid=imgcmt.image_uuid INNER JOIN {$this->table} usr ON imgcmt.user_uuid=usr.user_uuid WHERE imgcmt.create_date>=? AND img.user_uuid=? ORDER BY imgcmt.create_date ASC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue (1, $modified);
        $stmt->bindValue (2, $data["user_uuid"]);
        $stmt->execute();
        $branders = $stmt->fetchAll();

        $sql = "SELECT DISTINCT usr.*, fol.is_mutual AS is_mutual FROM {$this->table} usr INNER JOIN {$this->table_user_follow} fol ON usr.user_uuid=fol.user_following_uuid WHERE fol.create_date>=? AND fol.user_followed_uuid=? ORDER BY fol.create_date DESC LIMIT {$limit}";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue (1, $modified);
        $stmt->bindValue (2, $data["user_uuid"]);
        $stmt->execute();
        $followers = $stmt->fetchAll();

        return $total + count($branders) + count($followers);
    }

    public static function table()
    {
        return "user";
    }

}