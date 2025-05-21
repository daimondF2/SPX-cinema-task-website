<?php

require_once("database.php");
date_default_timezone_set("Australia/Sydney");
class order EXTENDS Database{

    private $orderItemId = null;
    private $sessionId = null;  //establishing my variables 
    private $seats = null;
    private $orderId = null;

    private static $tableName = "orderitems";
    private static array $fieldNames = ['orderItemId', 'memberId', 'sessionId', 'seats', 'orderId'];
    private static string $pk = "orderId";


    public function __construct (
        ?int $orderItemId = null,
        ?int $sessionId = null,        //establishing my variables 
        ?int $seats = null,
        ?int $memberId = null,
        ?int $orderId = null
    ) {
        parent::__construct(); // gets a database connection

        if ($this->exists() && $dbGet) {
            $this->getOrder();
        }

    }
    //Getters and setters
    // GETTERS

    //object relational mapping methods
    public function exists(): bool {
        if ($this->getOrderId() !== null) {
            $sql = "SELECT COUNT(*) AS numRows FROM " . self::$tableName . " WHERE orderId = ?";
            $results = $this->query($sql, [$this->getOrderId()]);

            foreach ($results as $row) {
                return $row['numRows'] == 1;
            }
        }
        return false;
    }