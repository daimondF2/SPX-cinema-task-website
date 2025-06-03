
<?php
require_once("auditlog.php");
require_once("basketItems.php");
require_once("order.php");
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
        if ($memberId !== null) {
            $basketItemsObj = new basketItems();
            $this->basketItems = $basketItemsObj->getBasketItems($memberId);
        }
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
    public function addItemToBasket(int $sessionId, int $seats, string $bookingDate, $seatCost): bool {
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
                $this->basketItems = (new basketItems())->getBasketItems($this->memberId);
                return true;
            }
        }
        //if not found create new item
        $totalCost = $seatCost * $seats;
        $newItem = new basketItems($sessionId, $seats, $seatCost, $bookingDate, $totalCost, $this->memberId);
        $newItem->addBasketItem();
        $this->basketItems = (new basketItems())->getBasketItems($this->memberId);
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
    //remove move form basket
    public function removeItem(int $sessionId, string $bookingDate): bool {
        // wait
        foreach ($this->basketItems as $item) {
            if ($item->getSessionId() == $sessionId && $item->getBookingDate() == $bookingDate) {
                $item->deleteBasketItem($sessionId, $this->memberId, $bookingDate);
                $entry = "Delete BasketItem Successful: memberId:".$this->memberId.", ".$seats." removed from sessionId:".$sessionId." for booking date: ".$bookingDate;
                $this->auditLog('basketItem', 'delete', $entry, $this->memberId);
                $this->basketItems = (new basketItems())->getBasketItems($this->memberId);
                return true; //item removed successfully
                //check if there are enough seats to remove
            }
        }
        return false;    
    }  
    
    // remove seats from basket
    public function removeBasketItemSeats(int $sessionId, int $seats, string $bookingDate): bool {
        foreach ($this->basketItems as $item) {
            if ($item->getSessionId() == $sessionId && $item->getBookingDate() == $bookingDate) {
            //check if there are enough seats to remove
                if ($item->getSeats() > $seats) {
                    //update the number of seats
                    $item->setSeats($item->getSeats() - $seats);
                    $item->setTotalCost($item->getTotalCost() - ($item->getSeatCost() * $seats));
                    $updateItem = new basketItems(
                        $item->getSessionId(),
                        $item->getSeats(),
                        $item->getSeatCost(),
                        $item->getBookingDate(),
                        $item->getTotalCost(),
                        $this->memberId
                    );
                    $updateItem->updateBasketItem();
                    $entry = "Update BasketItem Successful: memberId:".$this->memberId.", ".$seats." removed to sessionId:".$sessionId." for booking date: ".$bookingDate;
                    $this->auditLog('basketItem', 'update', $entry, $this->memberId);
                    $this->basketItems = (new basketItems())->getBasketItems($this->memberId);
                    return true;
                    //perchance this is not needed
                } else {
                    //if there are not enough seats to remove return false
                    $entry = "Remove BasketItem Failed: memberId:".$this->memberId.", not enough seats to remove from sessionId:".$sessionId." for booking date: ".$bookingDate;
                    $this->auditLog('basketItem', 'remove', $entry, $this->memberId);
                    return false;
                }
            }
        }
        return false; //item not found in basket
    }
    //delete basketItems when user logs out

    //
    public function getItems(int $memberId): array {
        // This method should return all basket items for the given member ID
        $basketItemsObj = new basketItems();
        return $basketItemsObj->getBasketItems($memberId);
    }

//checkout -methods, add to order, add to order items
    public function checkout(): bool {
        if (count($this->basketItems) === 0) {
            // No items to process
            return false;
        }
        // Create a new order
        $order = new Order();
        $order->setMemberId($this->getMemberId());
        $result = $order->addOrder();
        if (!$result) {
            // If order creation failed, return false
            $this->auditLog('order', 'checkout', 'Order creation failed for memberId: ' . $this->getMemberId(), $this->getMemberId());
            return false;
        }
        $order->addOrderItems($this); // Add basket items to the order
        // Clear the basket after checkout
        $this->clearBasket();
        // Log the checkout action
        $entry = "Checkout Successful: memberId:".$this->getMemberId().", orderId:".$order->getOrderId();
        $this->auditLog('order', 'checkout', $entry, $this->getMemberId());
        $this->basketItems = (new basketItems())->getBasketItems($this->memberId);
        return true; // Checkout successful  
    }

    public function clearBasket(): void {
        // Clear the basket items for the member
        $basketItemsObj = new basketItems();
        $basketItemsObj->deleteBasketItemsByMemberId($this->getMemberId());
        $this->basketItems = []; // Reset the basket items
        $this->auditLog('basket', 'clear', 'Basket cleared for memberId: ' . $this->getMemberId(), $this->getMemberId());
    }



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
