<?php
require_once("Session.php");
require_once("database.php");
require_once("auditlog.php");

class basketItems Extends Database {
    private ?int $basketItemId = null;
    private ?int $sessionId = null;
    private ?int $seats = null;
    private ?float $seatCost = null;
    private ?string $bookingDate = null;
    private ?float $totalCost = null;
    private ?int $memberId = null; 

    private static array $fieldNames = ['basketItemId', 'sessionId', 'seats', 'seatCost', 'bookingDate'];
    private static string $tableName = "basketitem";
    private static string $pk = "basketItemId";

    public function __construct(
        ?int $sessionId = null,
        ?int $seats = null,
        ?float $seatCost = null,
        ?string $bookingDate = null,
        ?float $totalCost = null,
        ?int $memberId = null 
    ) {
        parent::__construct();
        $this->setSessionId($sessionId);
        $this->setSeats($seats);
        if ($seatCost === null && $sessionId !== null) {
            $seatCost = $this->getSeatCostFromSession($sessionId);
            }
        $this->setSeatCost($seatCost);
        $this->setBookingDate($bookingDate);
        $this->setTotalCost($totalCost);
        $this->setMemberId($memberId);
    }
    public function __wakeup() {
        parent::__construct(); // Reconnect to DB after unserialize
    }
    // Setter and Getter methods
    public function getSessionId(): ?int {
        return $this->sessionId;
    }
    public function getSeats(): ?int {
        return $this->seats;
    }
    public function getSeatCost(): ?float {
        return $this->seatCost;
    }
    public function getBookingDate(): ?string {
        return $this->bookingDate;
    }
    public function getTotalCost(): ?float {
        if ($this->seatCost !== null && $this->seats !== null) {
            return $this->seatCost * $this->seats;
        }
        return null;
    }
    public function getMemberId(): ?int {
        return $this->memberId;
    }
    private function getSeatCostFromSession(int $sessionId): ?int {
        $session = new Session($sessionId);
        if (method_exists($session, 'getSeatCost')) {
            return $session->getSeatCost();
        }
        return null;
    }
    //setter methods
    public function setMemberId(?int $memberId): void {
        $this->memberId = $memberId;
    }
    public function setSessionId(?int $sessionId): void {
        $this->sessionId = $sessionId;
    }
    public function setSeats(?int $seats): void {
        $this->seats = $seats;
    }
    public function setSeatCost(?float $seatCost): void {
        $this->seatCost = $seatCost;
    }
    public function setBookingDate(?string $bookingDate): void {
        $this->bookingDate = $bookingDate;
    }
    public function setTotalCost(?float $totalCost): void {
        $this->totalCost = $totalCost;
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
        $sql = "INSERT INTO " . self::$tableName . " (sessionId, seats, seatCost, bookingDate, totalCost, memberId) VALUES (?, ?, ?, ?, ?, ?)";
        $params = [$this->getSessionId(), $this->getSeats(), $this->getSeatCost(), $this->getBookingDate(), $this->getTotalCost(), $this->getMemberId()];
        $result = $this->query($sql, $params);
        return $result;
    }

    //update Basket item -- remove seats
    public function updateBasketItem(): bool {
            // Validate bookingDate format (YYYY-MM-DD)
        if (!$this->getBookingDate() || !preg_match('/^\d{4}-\d{2}-\d{2}$/', $this->getBookingDate())) {
            throw new Exception("Invalid bookingDate format");
        }  
        $sql = "UPDATE " . self::$tableName . " 
                SET seats = ?, totalCost = ? 
                WHERE sessionId = ? AND bookingDate = ? AND memberId = ?";
        $params = [
            $this->getSeats(),
            $this->getTotalCost(),
            $this->getSessionId(),
            $this->getBookingDate(),
            $this->getMemberId()
        ];
        $result = $this->query($sql, $params);
        return $result;
    }

    public function deleteBasketItem(): bool {
        $sql = "DELETE FROM " . self::$tableName . " WHERE sessionId = ? AND bookingDate = ? AND memberId = ?";
        $params = [$this->getSessionId(), $this->getBookingDate(), $this->getMemberId()];
        $result = $this->query($sql, $params);
        return $result;
    }
    
    // Method to get all basket items
    public function getBasketItems(): array {
        $sql = "SELECT * FROM " . self::$tableName . " WHERE memberId = ?";;
        $results = $this->query($sql, [$memberId]);
        $basketItems = [];
        foreach ($results as $row) {
            $basketItem = new self(
                sessionId: $row['sessionId'],
                seats: $row['seats'],
                seatCost: $row['seatCost'],
                bookingDate: $row['bookingDate'],
                totalCost: $row['totalCost'],
                memberId: $row['memberId']
            );
            $basketItems[] = $basketItem;
        }
        return $basketItems;
    }
    //new method to from ading basket Items 


}



?>