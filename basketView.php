<?php
require(__DIR__.'\utilities\sessionCheck.php');
require("model\basket.php");
require_once("model\Session.php");
// Check if the user is logged in

if (!isset($_SESSION["member"])) {
    // Redirect to login page if the member is not logged in
    header("Location: login.php");
    exit;
}
// If the member is logged in, you can access their details

$memberOBJ = unserialize($_SESSION["member"]);
$memberId = $memberOBJ->getMemberId();
$basket = new Basket($memberId);
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'], $_POST['sessionId'], $_POST['bookingDate'])) {
    $sessionId = intval($_POST['sessionId']);
    $bookingDate = $_POST['bookingDate'];
    $action = $_POST['action'];

    // You may need to fetch seatCost for add
    if ($action === 'add') {
        // Find the item to get seatCost
        foreach ($basket->getItems($memberId) as $item) {
            if ($item->getSessionId() == $sessionId && $item->getBookingDate() == $bookingDate) {
                $seatCost = $item->getSeatCost();
                break;
            }
        }
        // If not found, set a default or fetch from session
        $seatCost = isset($seatCost) ? $seatCost : 0;
        $basket->addItemToBasket($sessionId, 1, $bookingDate, $seatCost);
    } elseif ($action === 'remove') {
        $basket->removeBasketItemSeats($sessionId, 1, $bookingDate);
    } elseif ($action === 'removeAll') {
        $basket->removeItem($sessionId, $bookingDate);
    }
    header("Location: basketView.php");
    exit;
}

$items = $basket->getItems($memberId);


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php require('head.php');?>
</head>
<body>
    <?php
        require('header.php');
        require('nav.php');
    ?>
    <maincontent>
        <h1>basket</h1>
        <div >
            <?php
            if (empty($items)) {
                echo "<p>Your basket is empty.</p>";
            } else {
                echo "<div class='basket-list'>";
                foreach ($items as $item) {
                    $session = new Session($item->getSessionId());
                    $movieName = $session->getMovie() ? $session->getMovie()->getMovieName() : 'Unknown';
                    $cinema = $session->getCinema();
                        // Force-load cinema details if not loaded
                        if ($cinema && !$cinema->getCinemaName()) {
                            $cinema->getCinema(); 
                        }
                        $cinemaName = $cinema ? $cinema->getCinemaName() : 'Unknown';
                    $sessionTime = $session->getTime() ?? 'Unknown';
                    $sessionId = htmlspecialchars($item->getSessionId());
                    $bookingDate = htmlspecialchars($item->getBookingDate());
                    $seats = htmlspecialchars($item->getSeats());
                    $seatCost = htmlspecialchars($item->getSeatCost());
                    $total = $seats * $seatCost;
                    echo "<div class='basket-card'>
                        <div class='basket-details'>
                            <div><strong>Movie:</strong> $movieName</div>
                            <div><strong>Cinema:</strong> $cinemaName</div>
                            <div><strong>Session Time:</strong> $sessionTime</div>
                            <div><strong>Booking Date:</strong> $bookingDate</div>
                            <div class='basket-actions'>
                                <form method='post' action='basketView.php' style='display:inline;'>
                                    <input type='hidden' name='sessionId' value='$sessionId'>
                                    <input type='hidden' name='bookingDate' value='$bookingDate'>
                                    <button type='submit' name='action' value='remove'>-</button>
                                </form>
                                <span class='basket-seats'>$seats</span>
                                <form method='post' action='basketView.php' style='display:inline;'>
                                    <input type='hidden' name='sessionId' value='$sessionId'>
                                    <input type='hidden' name='bookingDate' value='$bookingDate'>
                                    <button type='submit' name='action' value='add'>+</button>
                                </form>
                            </div>
                            <div><strong>Seat Cost:</strong> $$seatCost</div>
                            <div><strong>Total:</strong> $$total</div>
                        </div>
                        <form method='post' action='basketView.php' class='basket-removeall'>
                            <input type='hidden' name='sessionId' value='$sessionId'>
                            <input type='hidden' name='bookingDate' value='$bookingDate'>
                            <button type='submit' name='action' value='removeAll'>Remove All</button>
                        </form>
                    </div>";
                }
                echo "</div>";
            }

            ?>
        </div>
    </maincontent>
    <?php
        require('footer.php');
    ?>
</body>
</html>