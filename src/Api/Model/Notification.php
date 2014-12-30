<?php


namespace Api\Model;

use Api\Model\BaseModel;

class Notification extends BaseModel
{
    public $table = "notification";

    public function __construct()
    {
        $this->db = self::$DB;
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

    public function getNotification()
    {
        $uuid = $this->db->fetchColumn("SELECT notification_uuid FROM {$this->table} ORDER BY modified_date DESC LIMIT 0,1");

        if (empty ($uuid)) {
            return false;
        }

        return $uuid;
    }


    public static function table ()
    {
        return "notification";
    }

}