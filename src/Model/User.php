<?php

namespace Model;

use \Model\Model;

class User extends Model
{

    public $table = "user";

    public function createUser($data)
    {

        $data["user_uuid"] = uniqid();
        $data["create_date"] = time();
        $data["modified_date"] = time();
        $this->db->insert($this->table, $data);

    }

    public function updateUser($data)
    {
        $token = $data["token"];
        unset ($data["token"]);
        $data["modified_date"] = time();
        $this->db->update($this->table, $data, array('token' => $token));
    }

    public function deleteUser ($data)
    {
        $this->db->delete('user', array('token' => $data["token"]));
    }

}