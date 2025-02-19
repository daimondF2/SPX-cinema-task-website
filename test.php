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
date_default_timezone_set("Australia/Sydney");
$scripttest = date("Y-m-d") ." ". date("H:i:s");
echo $scripttest;

?>