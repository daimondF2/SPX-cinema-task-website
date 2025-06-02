<?php
require_once(__DIR__ . '\model\member.php');
require(__DIR__.'\utilities\sessionCheck.php');
require('model\order.php');
require_once("model\Session.php");
// Check if the user is logged in - also to prevent order History access without login
//through url
if (!isset($_SESSION["member"])) {
    // Redirect to login page if the member is not logged in
    header("Location: login.php"); 
    exit;
}
$memberOBJ = unserialize($_SESSION["member"]);
$memberId = $memberOBJ->getMemberId();

$orders = [];
if ($memberId) {
    $orders = order::getOrdersByMemberId($memberId);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <?php require('head.php');?>
</head>
<script>
function toggleOrderDetails(id) {
    var el = document.getElementById(id);
    if (el.style.display === "none" || el.style.display === "") {
        el.style.display = "block";
    } else {
        el.style.display = "none";
    }
}
</script>
<body>
    <?php
        require('header.php');
        require('nav.php');
    ?>
    <maincontent>
        <div class="order-history-section">
            <h1>Order History</h1>
            <?php
            if (empty($orders)) {
                echo "<p>You have no orders.</p>";
            } else {
                $orderIndex = 0;
                foreach ($orders as $order) {
                    $orderIndex++;
                    $collapseId = "order-details-" . $orderIndex;
                    echo "<div class='order-block'>";
                    // Clickable order header
                    echo "<div class='order-header' onclick=\"toggleOrderDetails('$collapseId')\">";
                    echo "<h3>Order " . htmlspecialchars($order['orderTime']) . " - Booked</h3>";
                    echo "</div>";
                    // Collapsible details
                    echo "<div id='$collapseId' class='order-details' style='display:none;'>";
                    echo "<table class='order-history-table'>";
                    echo "<tr><th>Movie</th><th>Cinema</th><th>Session Time</th><th>Seats</th><th>Seat Cost</th><th>Booking Date</th><th>Total Cost</th></tr>";
                    foreach ($order['items'] as $item) {
                    // Get the session object for this order item
                    $session = new Session($item->getSessionId());
                    $movieName = $session->getMovie() ? $session->getMovie()->getMovieName() : 'Unknown';
                    $cinema = $session->getCinema();
                        // Force-load cinema details if not loaded
                        if ($cinema && !$cinema->getCinemaName()) {
                            $cinema->getCinema(); 
                        }
                        $cinemaName = $cinema ? $cinema->getCinemaName() : 'Unknown';
                    $sessionTime = $session->getTime() ?? 'Unknown';

                    echo "<tr>";
                    echo "<td>" . htmlspecialchars($movieName) . "</td>";
                    echo "<td>" . htmlspecialchars($cinemaName) . "</td>";
                    echo "<td>" . htmlspecialchars($sessionTime) . "</td>";
                    echo "<td>" . htmlspecialchars($item->getSeats()) . "</td>";
                    echo "<td>$" . htmlspecialchars($item->getSeatCost()) . "</td>";
                    echo "<td>" . htmlspecialchars($item->getBookingDate()) . "</td>";
                    echo "<td>$" . htmlspecialchars($item->getTotalCost()) . "</td>";
                    echo "</tr>"; 
                    
                    }
                    echo "</table>";
                    echo "</div>";
                    echo "</div>"; 
                }
            }
            
            ?>
        </div>
    </maincontent>
    <?php require('footer.php'); ?>
</body>
</html>