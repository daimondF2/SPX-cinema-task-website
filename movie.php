<?php
require(__DIR__.'\utilities\sessionCheck.php');
require_once("model\CinemaLocation.php");
require_once("model\Cinema.php");
require_once("model\Session.php");
require_once("model\Movie.php");

//$locs = 
/** <div><iframe width="560" height="315" src="https://www.youtube.com/embed/<?php echo($movie->getTrailerName());?>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
*/
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php require('head.php');?>
    <script src="js/registerSW.js"></script>


</head>
<body>
    <?php
        require('header.php');
        require('nav.php');
    ?>
    <maincontent>
        <h1>Movie</h1>
        </maincontent>
    <?php
        require('footer.php');
    ?>
</body>
</html>
