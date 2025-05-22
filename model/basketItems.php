<?php
require_once("Session.php");
require_once("database.php");

class basketItems Extends Database {
    private ?int $basketItemId = null;
    private ?int $sessionId = null;
    private ?int $seats = null;
    private ?int $seatsCost = null;
    private ?string $bookingDate = null;

    private static array $fieldNames = ['basketItemId', 'sessionId', 'seats', 'seatsCost', 'bookingDate'];
    private static string $tableName = "basketitem";
    private static string $pk = "basketItemId";

    public function __construct(
        ?int $sessionId = null,
        ?int $seats = null,
        ?string $bookingDate = null
    ) {
        parent::__construct();
        $this->setSessionId($sessionId);
        $this->setSeats($seats);
        if ($seatsCost === null && $sessionId !== null) {
            $seatsCost = $this->getSeatCostFromSession($sessionId);
            }
        $this->setSeatsCost($seatsCost);
        $this->setBookingDate($bookingDate);
    }
    // Setter and Getter methods
    public function getSessionId(): ?int {
        return $this->sessionId;
    }
    public function getSeats(): ?int {
        return $this->seats;
    }
    public function getSeatsCost(): ?int {
        return $this->seatsCost;
    }
    public function getBookingDate(): ?string {
        return $this->bookingDate;
    }
    public function getTotalCost(): ?float {
        if ($this->seatsCost !== null && $this->seats !== null) {
            return $this->seatsCost * $this->seats;
        }
        return null;
    }
    private function getSeatCostFromSession(int $sessionId): ?int {
        $session = new Session($sessionId);
        if (method_exists($session, 'getSeatCost')) {
            return $session->getSeatCost();
        }
        return null;
    }
    //setter methods
    public function setSessionId(?int $sessionId): void {
        $this->sessionId = $sessionId;
    }
    public function setSeats(?int $seats): void {
        $this->seats = $seats;
    }
    public function setSeatsCost(?int $seatsCost): void {
        $this->seatsCost = $seatsCost;
    }
    public function setBookingDate(?string $bookingDate): void {
        $this->bookingDate = $bookingDate;
    }
    // Method to get session details
    public function getSessionDetails(): ?Session {
        if ($this->sessionId == null) {
            return null;
        } else {
            $session = new Session($this->sessionId); #create new isntance with constructor
            return $session;
        }
    }
    //add to database
    public function addBasketItem(): bool {
        $sql = "INSERT INTO " . self::$tableName . " (sessionId, seats, seatCost, bookingDate, totalCost) VALUES (?, ?, ?, ?)";
        $params = [$this->getSessionId(), $this->getSeats(), $this->getSeatsCost(), $this->getBookingDate()];
        $result = $this->query($sql, $params);
        return $result;
    }
    
    // Method to get all basket items
    public function getBasketItems(): array {
        $sql = "SELECT * FROM " . self::$tableName;
        $results = $this->query($sql);
        $basketItems = [];
        foreach ($results as $row) {
            $basketItem = new self(
                sessionId: $row['sessionId'],
                seats: $row['seats'],
                seatsCost: $row['seatsCost'],
                bookingDate: $row['bookingDate'],
                totalCost: $row['totalCost']
            );
            $basketItems[] = $basketItem;
        }
        return $basketItems;
    }
}



?>