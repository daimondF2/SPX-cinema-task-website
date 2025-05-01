<?php
require(__DIR__.'\utilities\sessionCheck.php');
require_once("model\CinemaLocation.php");
require_once("model\Cinema.php");
require_once("model\Session.php");
require_once("model\Movie.php");


// GET Mode
echo("CinemaLocation::loadCinemaLocations()<br/>");
$locs = CinemaLocation::loadCinemaLocations();


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
        <h1>Movies</h1>
        <locations>
        <div >
            <?php FOREACH($locs AS $loc) {
            ?>
                <h2><?php echo($loc->getLocationName());?></h2>
            <?php
                $cinemas = $loc->getCinemas();
                FOREACH($cinemas AS $cinema) {
            ?>
                    <h3><?php echo($cinema->getCinemaName()); ?></h3>
                    <movies>
                <?php
                    $sessions = $cinema->getSessions();
                    FOREACH($sessions AS $session) {
                        $movie = $session->getMovie();
                        ?>
                        <movie>
                            <h4><?php echo($movie->getMovieName()); ?></h4>
                            <div><img src='img/<?php echo($movie->getPosterFile()); ?>'></div>
                            <div><?php echo($movie->getMovieDescription()); ?></div>
                            <div><iframe width="560" height="315" src="https://www.youtube.com/embed/<?php echo($movie->getTrailerName());?>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                        </movie>
                        <h5>Session Time: <?php echo($session->getTime()); ?></h5>
                        <h5>Seat Cost $:<?php echo($session->getSeatCost()); ?></h5>
                    <?php
                    }
                }
            }
            ?>
        </div>
        <locations>
        </maincontent>
    <?php
        require('footer.php');
    ?>
</body>
</html>