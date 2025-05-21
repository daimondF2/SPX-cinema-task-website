<?php
require("Session.php");


class basketItems {
    private ?int $sessionId = null;
    private ?int $seats = null;
    private ?int $seatsCost = null;
    private ?string $bookingDate = null;

    public function __construct(
        ?int $sessionId = null,
        ?int $seats = null,
        ?int $seatsCost = null,
        ?string $bookingDate = null
    ) {
        $this->setSessionId($sessionId);
        $this->setSeats($seats);
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
}




?>