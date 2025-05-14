<?php
require(__DIR__.'\utilities\sessionCheck.php');
require_once("model\CinemaLocation.php");
require_once("model\Cinema.php");
require_once("model\Session.php");
require_once("model\Movie.php");


// GET Mode
//echo("CinemaLocation::loadCinemaLocations()<br/>");
$locs = CinemaLocation::loadCinemaLocations();
//TODO fix css, maybe add booking and add basket here perchance a filter, filter by location

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
            ?><div class="cinema-list">
                    <h3><?php echo($cinema->getCinemaName()); ?></h3>
                    <movies>
                </div>
                <?php
                    $sessions = $cinema->getSessions();
                    FOREACH($sessions AS $session) {
                        $movie = $session->getMovie();
                        ?>
                        <!-- TOO CHANGE -->
                        <movie> 
                            <h4><?php echo($movie->getMovieName()); ?></h4>
                            <div><img src='<?php echo($movie->getPosterFile()); ?>'></div>
                            <div class="movie-description"><?php echo($movie->getMovieDescription()); ?></div>
                            <div><a href="movied.php?movieId=<?php echo $movie->getMovieId(); ?>">View movie details</a></div>
                        <h6>Session Time: <?php echo($session->getTime()); ?></h6>
                        <h6>Seat Cost $:<?php echo($session->getSeatCost()); ?></h6>
                        </movie>
                    <?php
                    }
                }
            }
            ?></movies>
        </div>
        <locations>
        </maincontent>
    <?php
        require('footer.php');
    ?>
</body>
</html>