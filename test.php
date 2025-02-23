<?php
// See the password_hash() example to see where this came from.
/**$hash = '$2y$10$.vGA1O9wmRjrwAVXD98HNOgsNpDczlqm3Jq7KnEd1rVAGv3Fykk1a';
$test = 'rasmuslerdorf';

IF (password_verify($test, $hash)) {
    echo 'Password is valid!';
} else {
    echo 'Invalid password.';
}
$options = [
    'cost' => 12,
];
echo password_hash($test, PASSWORD_DEFAULT);
echo password_hash($test, PASSWORD_BCRYPT, $options);

$crypt = password_hash($test, PASSWORD_DEFAULT);
$cryptcrypt = password_hash($crypt, PASSWORD_BCRYPT, $options);
echo $cryptcrypt
IF (password_verify($test, $cryptcrypt)) {
    echo 'true';
}  else {
    echo 'false';
}
?>
**/

// Example Usage


/**$method = 'aes-256-cbc';
$key = openssl_random_pseudo_bytes(32); // 32 bytes for AES-256
$ivLength = 16; // IV must be 16 bytes for AES-256-CBC
$original = "Hello, World!";
// Encrypt Data
$iv = openssl_random_pseudo_bytes($ivLength); // Generate a random IV
$encrypted = openssl_encrypt($original, $method, $key, 0, $iv);
$encryption = base64_encode($key. $iv . $encrypted); // Store IV + encrypted data


// Decrypt Data
$data = base64_decode($encryption);
echo $data;
$key = substr($data, 0, 32);
$iv = substr($data, 32, $ivLength); // Extract IV
$en = substr($data, 48); // Extract encrypted part
$decrypted = openssl_decrypt($en, $method, $key, 0, $iv);


echo "Original: $original\n";
echo "Encrypted: $encrypted\n";
echo "Decrypted: $decrypted\n";*/
/**date_default_timezone_set("Australia/Sydney");
$scripttest = date("Y-m-d") ." ". date("H:i:s");
echo $scripttest;
*/
/**
 * testXSS.php
 *
 * Prevent Cross-Site Scripting (XSS)
 * https://dev.to/qbentil/cross-site-scripting-xss-and-ways-to-prevent-it-in-php-applications-510c
 *
 *
 * What is XSS?
 * ============
 * It is the unintended execution of remote code by a web client.
 * An attacker can use XSS to send a malicious script to an unsuspecting user.
 * Any web application might expose itself to XSS if it takes input from a user
 * and outputs it directly on a web page.
 *
 * try:
 * http://localhost/testXSS.php?message=<script>alert('Hello I am a hacker. Example of XSS')</script>
 * http://localhost/testXSS.php?message=<script>location.href='http://www.google.com';</script>
 *
 */
    $message="Nothing to say";

    if (isset($_GET["message"])) {
        $message = $_GET["message"];

    }
    echo($message);

/**
 * HTML Encoding:
 * PHP htmlspecialchars function will convert any HTML special characters into their HTML encodings,
 * meaning they will then not be processed as standard HTML
 * e.g.
 *      $input = htmlspecialchars($_GET['input']);
 *      $input = htmlspecialchars($_POST['input']);
 */
    echo(htmlspecialchars($_GET["message"]));
    echo(htmlentities($message,ENT_QUOTES, 'UTF-8')."<br/>");
    echo(htmlspecialchars($message)."<br/>");
    echo(urlencode($message)."<br/>");

/**
 * URL Encoding:
 * When outputting a dynamically generated URL, PHP provides the urlencode function
 * to safely output validated or sanitized URLs.
 *
 * https://www.php.net/manual/en/function.urlencode.php
 * e.g.
 *      $input = urlencode($_GET['input']);
 *
 *      $userinput = 'Data123!@-_ +';
 *      echo "UserInput: $userinput\n";
 *      echo '<a href="mycgi?foo    =', urlencode($userinput), '">';
 */

    // $data = "Data123!@-_ +";

    // $query_string =
    //echo(urlencode($message)."<br/>");


?>