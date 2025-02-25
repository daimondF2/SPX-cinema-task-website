<?php
//TODO CROSS SITE SCRIPTING PREVENTION 
/**Cross-Site Scripting prevention -- DOING
Text fields being displayed may be subverted by adding XSS javascript.
Add code to protect these fields from XSS.
Add XSS prevention for Firstname and LastName fields
Consider creating utility program called sanitize.php to provide functionality for "escaping" input text 
*/
function escapeGet($string){
    return htmlentities($string,ENT_QUOTES, 'UTF-8');

}
function escapePost($string){
    return htmlspecialchars($string);

}
function decodeUrl(){
    return urlencode($message);

}



?>