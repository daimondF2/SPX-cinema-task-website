<?php
require(__DIR__.'\utilities\sessionCheck.php');
require('model\order.php');

// Check if the user is logged in - also to prevent order History access without login
//through url
if (!isset($_SESSION["member"])) {
    // Redirect to login page if the member is not logged in
    header("Location: login.php"); 
    exit;
}
//Order::
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
        <h1>Order History</h1>
        <div >
        </div>
    </maincontent>
    <?php
        require('footer.php');
    ?>
</body>
</html>