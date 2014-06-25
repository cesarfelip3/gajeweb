<?php


namespace Model;

use \Model\BaseModel;

class Theme extends BaseModel
{
    public $table = "theme";

    public function __construct()
    {
        $this->db = self::$DB;
    }

    //=====================================
    // admin
    //=====================================

    public function getThemeListHeader()
    {
        return array(
            "#" => "#",
            "name" => "themename",
            "description" => "description",
            "create_date" => "create date",
            "modified_date" => "modified date"
        );
    }

    public function getTotal()
    {
        $total = $this->db->fetchColumn("SELECT COUNT(*) FROM {$this->table}");
        return $total;
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