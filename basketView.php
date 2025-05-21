<?php
require(__DIR__.'\utilities\sessionCheck.php');
require("model\basket.php");

// Check if the user is logged in

if (!isset($_SESSION["member"])) {
    // Redirect to login page if the member is not logged in
    header("Location: login.php");
    exit;
}
// If the member is logged in, you can access their details
$member = $_SESSION["member"];

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
        </div>
    </maincontent>
    <?php
        require('footer.php');
    ?>
</body>
</html>