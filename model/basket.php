<!-- Shopping Cart Screen
The Member may choose to go to the  Shopping Cart to review their booking requests
Seats booked must be a minimum of 1 - otherwise prompt Member to delete Booking Request
They may wish to Change the Booking Request
Amend  the quantity of seats on the booking request
Seats booked must be a minimum of 1 - otherwise prompt Member to delete Booking Request

Changes to number of seats will need to update the Session will the number of booked seats and the Total Cost of the Booking Request (derived/calculated as Session Cost x Num Seats)
They cannot change the Session - Movie / Cinema - to do this they must delete a booking request and re-request
Audit Log entry made
They may choose to Delete a Booking Request
The booking request may be deleted.
Audit Log entry made.
Checkout requested
An Order is created for the Member
Order will simply contain
the date of the order
the Order Status - defaults to "Booked"
"Awaiting Payment" status and Payment Processing is out of scope for this Interation
"Cancelled" status for an already Booked Order is out of scope for this Iteration.
Each Booking Request is added as an Order Item and linked to that Order including
Date of Booking
Number of Seats
Session details - i.e. Movie and Cinema -->

<?php
require_once("auditlog.php");
require_once("basketItems.php");
require_once("member.php");
//basket turns into a list 


class basket {
    private $memberId = null;
    private $basketItems = [];

    public function __construct() {
        $this->memberId = $memberId;
    }

    //Getters and setters
    public function setMemberId(?int $memberId = null): void {
        $this->memberId = $memberId;
    }
    public function setBasketItems(array $basketItems): void {
        $this->basketItems = $basketItems;
    }
    public function getMemberId(): ?int {
        return $this->memberId;
    }
    public function getBasketItems(): array {
        return $this->basketItems;
    }

    //add item to basket
    public function addItem(basketItems $item): void {
        //check if item already exists in basket
        foreach ($this->basketItems as $basketItem) {
            if ($basketItem->getSessionId() === $item->getSessionId()) {
                //if item already exists update the quantity
                $basketItem->setSeats($basketItem->getSeats() + $item->getSeats());
                return;
            }
        }
        //if item does not exist add it to the basket
        $this->basketItems[] = $item;
    }


    //audit log
    private function auditLog(string $entity, string $action, string $entry, ?int $memberId=null,): void {
        $auditLog = new AuditLog();
        $memberId = $memberId ?? $this->getMemberId(); //if memberId is null use the memberId from the basket
        $auditLog->addLog($memberId, $entity, $action, $entry);
    }


    //create new basket based on member get user object out of session mem create new basket instance for user, get the basket items basket
    //two func add product to basket
    //other is checkout - order connection - 
    //checkk if session exist in basket and then add to basket
    //check already in basket
    // if or and different dates
    // check for same date
    // passin date and stuff into order
    //check out gets list checks there are items 
    //then add to order
    /**
     * delete item from basket add new order to order items add orderid then order itmes
     * if items not greater than zero return no items to process
     * if processed checkout completer
     * new basket add new order increment order number on save then save to order get order id to add to order items 
     * adding to orderitems for each basket item add to orderItem
     */


    }
    ?>
