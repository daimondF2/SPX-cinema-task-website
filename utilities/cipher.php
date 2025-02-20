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


class Cipher {
    /**private static $method = 'aes-256-cbc';
    private static $key = openssl_random_pseudo_bytes(32);
    private static $ivlength = 16;

    public static function encrypt($data) {
        $iv = openssl_random_pseudo_bytes(self::$ivlength);
        $encrypted = openssl_encrypt($data, self::$method, self::$key, 0, $iv);
        base64_encode($iv . $encrypted);
        return $encrypted;
    }
    public static function decrypt($data) {
        $iv = openssl_random_pseudo_bytes(self::$ivlength);
        $decrypted = openssl_decrypt($data, self::$method, self::$key, 0, $iv);
        return $decrypted;
    }

}*/
    private static $method = 'aes-256-cbc';
    private static $keylength = 32; // 32 bytes for AES-256
    private static $ivLength = 16; // IV must be 16 bytes for AES-256-CBC

    // Encrypt Data
    public static function encrypt($data) {
        $iv = openssl_random_pseudo_bytes(self::$ivLength); // Generate a random IV
        $key = openssl_random_pseudo_bytes(self::$keylength);
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
/**$res = openssl_pkey_new();
if ($res==false) {
    echo('<p>'.openssl_error_string().'</p>');
}
echo("res");
var_dump($res);
// Extract the private key from $res to $private_key
openssl_pkey_export($res, $private_key);

$bob_key = openssl_pkey_get_details($res);
echo ("private:");
echo $private_key, PHP_EOL;
var_dump($private_key);

$bob_public_key = $bob_key['key'];

echo ("pub:");
echo $bob_public_key, PHP_EOL;
var_dump($bob_public_key);
/*That's the basic infrastructure you had in your code and now is code that Bob executes. 
Bob generates the key pair and sends to Alice, in a real environment there must be a public key sharing mechanism.

//When Alice gets Bob's public key, she cyphers her message with this key:

/** ALICE CODE **/
/**$alice_msg = "Hi Bob, im sending you a private message";
openssl_public_encrypt($alice_msg, $pvt_msg, $bob_public_key);

echo $alice_msg, PHP_EOL;

echo $pvt_msg, PHP_EOL;
//Finally Bob receives the message and decrypts it

/**  BOB CODE **/
/**openssl_private_decrypt( $pvt_msg, $bob_received_msg, $private_key);
echo $bob_received_msg;
*/
?>
