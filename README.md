Audit Logging  ------DONE
Implement additional table in database
image.png
Create an "auditLog" object relational class (subclass to database) in the "model" subfolder
addLog function - adds an entry to the auditLog table

Each Business Object (e.g. member.php for the member table) major action needs to add an entry in the Audit Log
Login
Logout
Update
Insert
Delete

Password Hashing  ----- done
Ensure the database field in Member table can store a hashed password rather than plaintext password 
Member Business Object 
Add code to login function to check the entered password against the hashed password
Save functionality to hash the password when saving password to the database 
see for more information
https://www.php.net/manual/en/function.password-hash.phpLinks to an external site.
https://www.php.net/manual/en/function.password-verify.phpLinks to an external site.

Data Encryption --------DONE
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

Cross-Site Scripting prevention -- DONE
Text fields being displayed may be subverted by adding XSS javascript.
Add code to protect these fields from XSS.
Add XSS prevention for Firstname and LastName fields
Consider creating utility program called sanitize.php to provide functionality for "escaping" input text 
