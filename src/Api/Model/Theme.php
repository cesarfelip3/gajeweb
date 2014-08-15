<?php


namespace Api\Model;

use Api\Model\BaseModel;

class Theme extends BaseModel
{
    public $table = "theme";

    public function __construct()
    {
        $this->db = self::$DB;
    }

    public function addTheme($data)
    {

        $data["theme_uuid"] = uniqid();
        $data["create_date"] = time();
        $data["modified_date"] = time();
        $this->db->insert($this->table, $data);

        return $data["theme_uuid"];
    }

    public function getThemeList($data)
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