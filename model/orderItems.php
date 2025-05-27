<?php

require_once("database.php");
require_once("auditlog.php");
class orderItems EXTENDS Database{

    private $orderItemId = null;
    private $sessionId = null;  //establishing my variables 
    private $seats = null;
    private $seatCost = null;
    private $orderId = null;
    private $bookingDate = null;
    private $totalCost = null;

    private static $tableName = "orderitems";
    private static array $fieldNames = ['orderItemId', 'sessionId', 'seats', 'seatCost', 'orderId', 'bookingDate', 'totalCost'];
    private static string $pk = "orderItemId";


    public function __construct (
        ?int $orderItemId = null,
        ?int $sessionId = null,        //establishing my variables 
        ?int $seats = null,
        ?float $seatCost = null,
        ?int $orderId = null,
        ?string $bookingDate = null,
        ?float $totalCost = null,
    ) {
        parent::__construct(); // gets a database connection
        if ($this->exists() && $dbGet) {
            $this->getOrder();
        }
        $this->setOrderItemId($orderItemId);
        $this->setSessionId($sessionId);
        $this->setSeats($seats);
        $this->setSeatCost($seatCost);
        $this->setOrderId($orderId);
        $this->setBookingDate($bookingDate);
        $this->setTotalCost($totalCost);

    }
    //Getters and setters
    /// SETTERS
    public function setOrderItemId(?int $orderItemId = null): void {
        $this->orderItemId = $orderItemId;
    }
    public function setSessionId(?int $sessionId = null): void {
        $this->sessionId = $sessionId;
    }
    public function setSeats(?int $seats = null): void {
        $this->seats = $seats;
    }
    public function setSeatCost(?float $seatCost = null): void {
        $this->seatCost = $seatCost;
    }
    public function setOrderId(?int $orderId = null): void {
        $this->orderId = $orderId;
    }
    public function setBookingDate(?string $bookingDate = null): void {
        $this->bookingDate = $bookingDate;
    }
    public function setTotalCost(?float $totalCost = null): void {
        $this->totalCost = $totalCost;
    }
    // GETTERS
    public function getOrderItemId(): ?int {
        return $this->orderItemId;
    }
    public function getSessionId(): ?int {
        return $this->sessionId;
    }
    public function getSeats(): ?int {
        return $this->seats;
    }
    public function getSeatCost(): ?float {
        return $this->seatCost;
    }
    public function getOrderId(): ?int {
        return $this->orderId;
    }
    public function getBookingDate(): ?string {
        return $this->bookingDate;
    }
    public function getTotalCost(): ?float {
        return $this->totalCost;
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
    public function addOrderItem(): bool {
        $sql = "INSERT INTO " . self::$tableName . " (sessionId, seats, seatCost, orderId, bookingDate, totalCost) VALUES (?, ?, ?, ?, ?, ?)";
        $params = [$this->getSessionId(), $this->getSeats(), $this->getSeatCost(), $this->getOrderId(), $this->getBookingDate(), $this->getTotalCost()];
        $result = $this->query($sql, $params);
        if ($result) {
            $this->setOrderItemId($this->lastInsertId());
            return true;
        }
        return false;
    }
    // getOrderItems
    public function getOrderItems(?int $orderId = null): array {
        $orderItems = [];
        if ($orderId === null) {
            $orderId = $this->getOrderId();
        }
        if ($orderId !== null) {
            $sql = "SELECT * FROM " . self::$tableName . " WHERE orderId = ?";
            $results = $this->query($sql, [$orderId]);
            foreach ($results as $result) {
                $orderItem = new self(
                    $result['orderItemId'],
                    $result['sessionId'],
                    $result['seats'],
                    $result['seatCost'],
                    $result['orderId'],
                    $result['bookingDate'],
                    $result['totalCost']
                );
                $orderItems[] = $orderItem;
            }
        }
        return $orderItems;
    }

}
