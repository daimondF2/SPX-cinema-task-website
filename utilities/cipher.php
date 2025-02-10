<?php
/**Data Encryption
 Private information (other than password) will need to be encrypted when transferred to the database and then decrypted for maintenance by the user. 
Using AES-256 encryption techniques to encrypt/decrypt sensitive information
As per the sample code provided to you as a demonstration, incorporate AES-256 encryption of the Member data
Modify Member Database Table and Business Objects to allow for encryption
Member table
alter the "private" encrypted fields to change their data types to varchar (255)
Only PK and FK fields will not be encrypted
Data Migration - Not Required for this project.
Normally data will be migrated from the existing tables and encrypted.  
A utility program is normally written to perform the conversion.
Consider creating a utility program (php) with a Cipher.php static class that has static functions to encrypt and decrypt 
*/
$data = "This is a secret message";

// Generate a 256-bit key and a 128-bit IV
$key = openssl_random_pseudo_bytes(32);
$iv = openssl_random_pseudo_bytes(16);

// Encrypt the data
$encrypted = openssl_encrypt($data, 'aes-256-cbc', $key, 0, $iv);

// Decrypt the data
$decrypted = openssl_decrypt($encrypted, 'aes-256-cbc', $key, 0, $iv);

echo "Original Data: " . $data . "\n";
echo "Encrypted Data: " . $encrypted . "\n";
echo "Decrypted Data: " . $decrypted . "\n";
>
