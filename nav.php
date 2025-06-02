<nav>
        
        <ul>
            <li><a href="index.php">Home</a></li>
            <li><?php if (isset($_SESSION["member"])) { echo("<a href='logout.php'>Logout");} else {echo("<a href='login.php'>Login");} ?></a></li>
            <li><a href="movies.php">Movies</a></li>
            <li><?php if (isset($_SESSION["member"])) { echo("<a href='orderHistory.php'>Order History");}?></a></li>
            <li><?php if (isset($_SESSION["member"])) { echo("<a href='memberRegistration.php'><img src='img/member.png'>Member Info");} else { echo("<a href='memberRegistration.php'><img src='img/member.png'>Registration</a>"); }?></a></li>
            <!-- <li><a href="basket.php"><img src="img/shoppingCart.png"> Basket</a></li> -->
            <li class="right-align"><a href="basketView.php">Basket<img src="img/basketIMG.png"></a></li>
        </ul>
        
    </nav>