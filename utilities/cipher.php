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
>
