
<?php
require_once("auditlog.php");
require_once("basketItems.php");
require_once("member.php");
//basket turns into a list 


class basket {
    private $memberId = null;
    private $basketItems = [];

    public function __construct(
        ?int $memberId = null) {
        $this->setMemberId($memberId);
    }

    //Getters and setters
    public function setMemberId(?int $memberId = null): void {
        $this->memberId = $memberId;
        // Load basket items for this member
        $this->basketItems = [];
        // if ($memberId !== null) {
        //     $basketItemsObj = new basketItems();
        //     $this->basketItems = $basketItemsObj->getBasketItemsByMemberId($memberId);
        // }
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
    public function addItemToBasket(int $sessionId, int $seats, string $bookingDate): bool {
        //check if item already exists in basket
        foreach ($this->basketItems as $item) {
            if ($item->getSessionId() == $sessionId && $item->getBookingDate() == $bookingDate) {
                //update the number of seats
                $item->setSeats($item->getSeats() + $seats);
                $item->setTotalCost($item->getTotalCost() + ($item->getSeatCost() * $seats));
                $updateItem = new basketItems(
                    $item->getSessionId(),
                    $item->getSeats(),
                    $item->getSeatCost(),
                    $item->getBookingDate(),
                    $item->getTotalCost(),
                    $this->memberId
                );
                $updateItem->updateBasketItem();
                $entry = "Update BasketItem Successful: memberId:".$this->memberId.", ".$seats." added to sessionId:".$sessionId." for booking date: ".$bookingDate;
                $this->auditLog('basketItem', 'update', $entry, $this->memberId);
                return true;
            }
        }
        //if not found create new item
        $newItem = new basketItems($sessionId, $seats, null, $bookingDate, null, $this->memberId);
        $newItem->addBasketItem();
        array_push($this->basketItems, $newItem);
        $entry = "Add BasketItem Successful: memberId:".$this->memberId.", ".$seats." added to sessionId:".$sessionId." for booking date: ".$bookingDate;
        $this->auditLog('basketItem', 'addBasketItem', $entry, $this->memberId);
        return true;
    }


    //audit log
    private function auditLog(string $entity, string $action, string $entry, ?int $memberId=null,): void {
        $auditLog = new AuditLog();
        $memberId = $memberId ?? $this->getMemberId(); //if memberId is null use the memberId from the basket
        $auditLog->addLog($memberId, $entity, $action, $entry);
    }
    //remove item or seats from basket

    //delete basketItems when user logs out

    //


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
