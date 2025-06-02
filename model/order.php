<?php

require_once("database.php");
require_once("auditlog.php");
date_default_timezone_set("Australia/Sydney");
require_once("orderItems.php");

class order EXTENDS Database{

    private $orderId = null;
    private $booked = null; //establishing my variables 
    private $orderTime = null;
    private $memberId = null;

    private static $tableName = "orders";
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
    public function getBooked(): ?int {
        return ($this->booked) ? 1 :0;
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
        $this->booked = ($booked) ? 1 : 0;
    }
    public function setOrderTime(?string $orderTime=null): void {
        if ($orderTime === null) {
            $orderTime = date("Y-m-d") . " " . date("H:i:s"); //GET TIME DATE
        }
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

    //add orderitems
    public function addOrder() {
        $this->setOrderTime(); // Set the order time to current time if not set
        $sql = "INSERT INTO " .self::$tableName. " (booked, memberId, orderTime) VALUES (?, ?, ?)";
        $params = [$this->getBooked(), $this->getMemberId(), $this->getOrderTime()];
        $result = $this->query($sql, $params);
        
        if ($result) {
            $this->setOrderId($this->lastInsertId());// Set the orderId to the last inserted ID
            return true;
        } else {
            return false; // Handle error if needed
        }
    }

    //getOrders
    public function getOrder(bool $dbGet = true) {
        if ($this->getOrderId()) {
            if ($dbGet) {
                $sql = "SELECT " . implode(', ', self::$fieldNames) . " FROM " . self::$tableName . " WHERE " . self::$pk . " = ? ORDER BY orderTime DESC";
                $results = $this->query($sql, [$this->getOrderId()]);

                foreach ($results as $result) {
                    $this->setOrderId($result['orderId']);
                    $this->setBooked($result['booked']);
                    $this->setOrderTime($result['orderTime']);
                    $this->setMemberId($result['memberId']);
                }
            }
        }
    }

    public static function getOrdersByMemberId(int $memberId): array {
    $orderObj = new self();
    $sql = "SELECT * FROM `orders` WHERE memberId = ? ORDER BY orderTime DESC";
    $orders = $orderObj->query($sql, [$memberId]);
    foreach ($orders as &$order) {
            $orderItemsObj = new orderItems();
            $order['items'] = $orderItemsObj->getOrderItems($order['orderId']);
        }
    return $orders;
    }

    public function addOrderItems(basket $basket): bool {
        foreach ($basket->getBasketItems() as $basketItem) {
                $orderItem = new orderItems(
                sessionId: $basketItem->getSessionId(),
                seats: $basketItem->getSeats(),
                seatCost: $basketItem->getSeatCost(),
                orderId: $this->getOrderId(),
                bookingDate: $basketItem->getBookingDate(),
                totalCost: $basketItem->getTotalCost()
            );
            if (!$orderItem->addOrderItem()) {
                return false; // If any item fails to add, return false
            }
        }
        return true; // All items added successfully
    }
    
    //
    public function auditLog(string $entry, string $entity = 'order', string $action = '', ?int $memberId=null,): void {
        $audit = new auditLog();
        $audit->addLog($memberId, $entity, $action, $entry);
    }


}
?>
