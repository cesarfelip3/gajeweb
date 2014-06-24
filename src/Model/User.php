<?php

namespace Model;

use \Model\BaseModel;

class User extends BaseModel
{

    public $table = "user";

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
        $token = $data["token"];
        unset ($data["token"]);
        $data["modified_date"] = time();
        $this->db->update($this->table, $data, array('token' => $token));
    }

    public function deleteUser($data)
    {
        $this->db->delete($this->table, array('token' => $data["token"]));
    }

    public function userExistsByToken($userId)
    {
        $uuid = $this->db->fetchColumn("SELECT user_uuid FROM {$this->table} WHERE token=?", array($userId));

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

    //=====================================
    // admin
    //=====================================

    public function getUserListHeader ()
    {
        return array (
            "#" => "#",
            "username" => "username",
            "email" => "email",
            "firstname" => "firstname",
            "lastname" => "lastname",
            "create_date" => "create date",
            "modified_date" => "modified date"
        );
    }

    public function getTotal ()
    {
        $total = $this->db->fetchColumn("SELECT COUNT(*) FROM {$this->table}");
        return $total;
    }

    public function getUserList ($data)
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

    public static function table()
    {
        return "user";
    }

}