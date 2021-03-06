<?php


namespace Admin\Model;

use Admin\Model\BaseModel;

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

    public function removeAll()
    {
        $this->db->executeQuery ("DELETE FROM " . $this->table);
    }

    //=====================================
    // admin
    //=====================================

    public function getThemeListHeader()
    {
        return array(
            "#" => "#",
            "name" => "name",
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

    public function getThemeListHeaderZipped()
    {
        return array(
            "#" => "#",
            "name" => "Name",
            "description" => "Description",
            "create_date" => "Created At",
            "modified_date" => "Modified At",
            "download_link" => "Download Link",
            "action_delete" => "Delete All"
        );
    }

    public function getThemeListZipped($data)
    {
        $page = $data["page"];
        $pageSize = $data["page_size"];

        $page = intval($page);
        $pageSize = intval($pageSize);
        $page = $page * $pageSize;

        $limit = "$page, $pageSize";
        $result = $this->db->fetchAll("SELECT * FROM {$this->table}
            WHERE is_zipped=1
            ORDER BY modified_date DESC LIMIT {$limit}");

        return $result;
    }

    public function removeAllbyTheme($uuid)
    {
        if (empty ($uuid)) {
            return false;
        }

        // make sure theme exists

        $this->db->executeQuery ("DELETE img, imgc, imgb, cmt FROM image AS img
            INNER JOIN image_comment AS imgc ON
            img.image_uuid=imgc.image_uuid INNER JOIN image_brander AS imgb ON
            img.image_uuid=imgb.image_uuid INNER JOIN comment AS cmt ON
            imgc.comment_uuid = cmt.comment_uuid
            WHERE img.theme_uuid= " . $this->table);

        // remove all images files

        // remove all image info & related info

        // rmeove theme
    }


}