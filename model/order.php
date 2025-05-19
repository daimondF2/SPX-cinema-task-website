<?php

require_once("database.php");
date_default_timezone_set("Australia/Sydney");
class order EXTENDS Database{

    private $orderId = null
    private $booked = null  //establishing my variables 
    private $orderTime = null
    private $memberId = null

    private static $tableName = "order";
    private static array $fieldNames = ['orderId', 'booked', 'orderTime', 'memberId'];
    private static string $pk = "orderId";


    public function __construct (
        ?int $orderId = null,
        ?bool $booked = null,        //establishing my variables 
        ?int $memberId = null,
        ?string $orderTime = null,
        bool $dbGet = True
    ) {
        parent::__construct(); // gets a database connection
        $this->setOrderId($orderId);
        $this->setBooked($booked);
        $this->setMemberId($memberId);
        $this->setOrderTime($orderTime);

        if ($this->exists() && $dbGet) {
            $this->getOrder();
        }

    }
    //Getters and setters
    // GETTERS
    public function getOrderId(): ?int {
        return $this->orderId;
    }
    public function getBooked(): ?bool {
        return $this->booked;
    }
    public function getOrderTime(): ?string {
        return $this->orderTime;
    }
    public function getMemberId(): ?int {
        return $this->memberId;
    }
    // SETTERS 
    public function setOrderId(?int $orderId=null): void {
        $this->orderId = $orderId;
    }
    public function setBooked(?bool $booked = true): void {
        $this->booked = $booked;
    }
    public function setOrderTime(?string $orderTime=null): void {
        $this->orderTime = $orderTime;
    }
    public function setMemberId(?int $memberId=null): void {
        $this->memberId = $memberId;
    }

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
}
?>
