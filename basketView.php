<?php
require(__DIR__.'\utilities\sessionCheck.php');
require("model\basket.php");
require_once("model/basketItems.php");
// Check if the user is logged in

if (!isset($_SESSION["member"])) {
    // Redirect to login page if the member is not logged in
    header("Location: login.php");
    exit;
}
// If the member is logged in, you can access their details
$member = $_SESSION["member"];
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $action = $_POST['action'] ?? '';
            $sessionId = $_POST['sessionId'] ?? null;
            $bookingDate = $_POST['bookingDate'] ?? null;
            $memberId = $_POST['memberId'] ?? null;

            if ($action === 'update' && $sessionId && $bookingDate && $memberId) {
                $newSeats = intval($_POST['seats']);
                $basketItem = new basketItems($sessionId, $newSeats, null, $bookingDate, null, $memberId);
                $basketItem->updateBasketItem();
                echo "<p>Basket item updated.</p>";
            }
            if ($action === 'delete' && $sessionId && $bookingDate && $memberId) {
                $basketItem = new basketItems($sessionId, null, null, $bookingDate, null, $memberId);
                $basketItem->deleteBasketItem();
                echo "<p>Basket item deleted.</p>";
            }
        }

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
            $memberId = $member['memberId'] ?? null;
            $basket = new basket($memberId);
            $basket->setMemberId($memberId);
            $basketItems = $basket->getBasketItems();

            if (empty($basketItems)) {
                echo "<p>Your basket is empty.</p>";
            } else {
                echo "<table border='1'>";
                echo "<tr><th>Session ID</th><th>Seats</th><th>Seat Cost</th><th>Booking Date</th><th>Total Cost</th><th>Actions</th></tr>";
                foreach ($basketItems as $item) {
                    echo "<tr>";
                    echo "<form method='post'>";
                    echo "<td>" . htmlspecialchars($item->getSessionId()) . "<input type='hidden' name='sessionId' value='" . htmlspecialchars($item->getSessionId()) . "'></td>";
                    echo "<td><input type='number' name='seats' value='" . htmlspecialchars($item->getSeats()) . "' min='1' required></td>";
                    echo "<td>" . htmlspecialchars($item->getSeatCost()) . "</td>";
                    echo "<td>" . htmlspecialchars($item->getBookingDate()) . "<input type='hidden' name='bookingDate' value='" . htmlspecialchars($item->getBookingDate()) . "'></td>";
                    echo "<td>" . htmlspecialchars($item->getTotalCost()) . "</td>";
                    echo "<td>
                            <input type='hidden' name='memberId' value='" . htmlspecialchars($item->getMemberId()) . "'>
                            <button type='submit' name='action' value='update'>Update</button>
                            <button type='submit' name='action' value='delete' onclick=\"return confirm('Are you sure?');\">Delete</button>
                        </td>";
                    echo "</form>";
                    echo "</tr>";
                }
                echo "</table>";
            }
        ?>
        </div>
    </maincontent>
    <?php
        require('footer.php');
    ?>
</body>
</html>