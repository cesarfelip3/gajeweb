<?php


namespace Admin\Model;

use Admin\Model\BaseModel;

class Notification extends BaseModel
{
    public $table = "notification";

    public function __construct()
    {
        $this->db = self::$DB;
    }

    public function addNotification($data)
    {

        $data["notification_uuid"] = uniqid();
        $data["create_date"] = time();
        $data["modified_date"] = time();
        $this->db->insert($this->table, $data);

        return $data["notification_uuid"];
    }

    public function removeAll()
    {
        $this->db->executeQuery ("DELETE FROM " . $this->table);
    }

    //=====================================
    // admin
    //=====================================

    public function getNotificationListHeader()
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

    public function getNotificationList($data)
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

    public function getNotificationListHeaderZipped()
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

    public function getNotificationListZipped($data)
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


}