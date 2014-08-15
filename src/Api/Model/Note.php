<?php


namespace Api\Model;

use Api\Model\BaseModel;

class Note extends BaseModel
{
    public $table = "note";

    public function __construct()
    {
        $this->db = self::$DB;
    }

    public function addNote($data)
    {

        $data["note_uuid"] = uniqid();
        $data["create_date"] = time();
        $data["modified_date"] = time();
        $this->db->insert($this->table, $data);

        return $data["note_uuid"];
    }

    public function getNoteList($data)
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


}