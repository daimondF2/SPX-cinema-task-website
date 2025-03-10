
<?php

require_once("database.php");
//require_once("member.php");
date_default_timezone_set("Australia/Sydney");
class auditLog EXTENDS Database {
    public $tableName;
    public function __construct() {
        parent::__construct(); // gets a database connection
        $this->tableName = "auditLog";
        //$this->setMemberId($memberId);
    }

    public function addLog($memberId = null, $entity=null, $action=null, $entry=null) {
        $time = date("Y-m-d") ." ". date("H:i:s"); //GET TIME DATE
        /**string $entity = null,
        string $action =null,
        string $entry=null,
        //integer $memberId;*/
        //$memberId = 1;
        $sql = "INSERT INTO $this->tableName (timestamp, entity, action, entry, memberId) VALUES ('$time', '$entity', '$action', '$entry', " . ($memberId !== null ? $memberId : "NULL") . ")";
        //insert SQL
        //string $entity = null,
        if (!$this->run($sql)) {
            //deal with error 
            echo "audit log problem";
        }
        // $stmt = $this->getConn()->prepare($sql);
        // $stmt->bind_param('ssssi', $time, $entity, $action, $entry, $memberId);
        //     //Executing the statement  
        // $stmt->execute();
        //if ($result)

    }
//date time function: for date:   date("Y-m-d") ." ". date("H:i:s");

}



/**
 */
?>