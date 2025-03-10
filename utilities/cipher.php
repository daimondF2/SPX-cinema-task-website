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

//--- Create Two Random Keys And Save Them In Your Configuration File ---
// https://www.php.net/manual/en/function.openssl-encrypt.php

// Create The First Key
//echo("define('FIRSTKEY','");
//echo base64_encode(openssl_random_pseudo_bytes(32));
//echo("');".PHP_EOL);
// Create The Second Key
//echo("define('SECONDKEY','");
//echo base64_encode(openssl_random_pseudo_bytes(64));
//echo("');".PHP_EOL);
/**
 *     /**
     * SYMMETRIC ENCRYPTION EXAMPLE
     * ============================
     * STATIC secured_encrypt().
     * Two stage encryption of data - encrypt and then hash
     *
     * Relies of config.php file to declare FIRSTKEY and SECONDKEY constants
     * see: https://www.php.net/manual/en/function.openssl-encrypt.php
     */
/*    public static function secured_encrypt($data=null) {
        {
        // $first_key = base64_decode(self::$FIRSTKEY);
        $first_key = base64_decode(FIRSTKEY);
        // $second_key = base64_decode(self::$SECONDKEY);
        $second_key = base64_decode(SECONDKEY);

        $method = "aes-256-cbc";

        //Generatea random initialisation vector
        $iv_length = openssl_cipher_iv_length($method);
        $iv = openssl_random_pseudo_bytes($iv_length);

        // Encryption using AES 256 CBC
        $first_encrypted = openssl_encrypt($data,$method,$first_key, OPENSSL_RAW_DATA ,$iv);
        // Hash-based Message Authentication Code
        $second_encrypted = hash_hmac('sha3-512', $first_encrypted, $second_key, TRUE);

        $output = base64_encode($iv.$second_encrypted.$first_encrypted);
        return $output;
        }
    }

    /**
     * STATIC secured_decrypt().
     * Two stage decryption of data
     *
     * Relies of config.php file to declare FIRSTKEY and SECONDKEY constants
     * see: https://www.php.net/manual/en/function.openssl-encrypt.php
     */
    /**public static function secured_decrypt($input=null)
    {
        if ($input) {
            $first_key = base64_decode(FIRSTKEY);
            $second_key = base64_decode(SECONDKEY);

            $mix = base64_decode($input);

            $method = "aes-256-cbc";
            $iv_length = openssl_cipher_iv_length($method);

            $iv = substr($mix,0,$iv_length);
            $second_encrypted = substr($mix,$iv_length,64);
            $first_encrypted = substr($mix,$iv_length+64);

            $data = openssl_decrypt($first_encrypted,$method,$first_key,OPENSSL_RAW_DATA,$iv);
            $second_encrypted_new = hash_hmac('sha3-512', $first_encrypted, $second_key, TRUE);

            if (hash_equals($second_encrypted,$second_encrypted_new))
                return $data;
        }
        return false;
    }
}

*/
class Cipher {


    private static $method = 'aes-256-cbc';
    private static $keylength = 32; // 32 bytes for AES-256
    private static $ivLength = 16; // IV must be 16 bytes for AES-256-CBC

    // Encrypt Data
    public static function encrypt($data) {
        $iv = openssl_random_pseudo_bytes(self::$ivLength); // Generate a random IV
        $key = openssl_random_pseudo_bytes(self::$keylength); //generates a random key
        $encrypted = openssl_encrypt($data, self::$method, $key, 0, $iv);
        return base64_encode($key. $iv . $encrypted); // Store key + Store IV + encrypted data
    }

    // Decrypt Data
    public static function decrypt($data) {
        if ($data == null) {
            return null;
        } else {
            # code...
            $data = base64_decode($data); //decodes
            $key2 = substr($data, 0, 32); //extract key
            $iv = substr($data, 32, self::$ivLength); // Extract IV
            $encrypted = substr($data, 48); // Extract encrypted part
            return openssl_decrypt($encrypted, self::$method, $key2, 0, $iv);
        }
        }
        
    }

?>
