<?php
// See the password_hash() example to see where this came from.
$hash = '$2y$10$.vGA1O9wmRjrwAVXD98HNOgsNpDczlqm3Jq7KnEd1rVAGv3Fykk1a';
$test = 'rasmuslerdorf';

IF (password_verify($test, $hash)) {
    echo 'Password is valid!';
} else {
    echo 'Invalid password.';
}
?>