<?php
require(__DIR__.'\utilities\sessionCheck.php');
require_once("model\CinemaLocation.php");
require_once("model\Cinema.php");
require_once("model\Session.php");
require_once("model\Movie.php");
//!TODO - add the sessions stuff for the movie and where it at but that is easy i think!!! maybe add booking and add basket here
//$locs = 
// add find movieId = in orginal thing bring it here to get movieId, 
//get movie id from url
if (!isset($_GET['movieId'])) {
    die("No movie provided.");
}

$movieId = intval($_GET['movieId']);

$movie = Movie::getMovieById($movieId);

if (!$movie) {
    die("movie not foudn.");
}
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
        <h4><?php echo($movie->getMovieName()); ?></h4>
        <div><img src="<?php echo($movie->getPosterFile()); ?>"></div>
        <div><?php echo($movie->getMovieDescription()); ?></div>
        <div><iframe width="560" height="315" src="https://www.youtube.com/embed/<?php echo($movie->getTrailerName());?>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe></div>
        </maincontent>
    <?php
        require('footer.php');
    ?>
</body>
</html>
