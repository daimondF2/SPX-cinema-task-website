<?php

require_once("database.php");
require_once("auditlog.php");
require_once(__DIR__."/../utilities/cipher.php");
/**
 * STATIC secured_decrypt().
 * Two stage decryption of data
 *
 * Relies of config.php file to declare FIRSTKEY and SECONDKEY constants
 * see: https://www.php.net/manual/en/public function.openssl-encrypt.php
 */
CLASS Member EXTENDS Database {

    private $memberId;
    private $userName;
    private $password;
    private $firstName;
    private $lastName;
    private $role;
    private $street;
    private $town;
    private $state;
    private $postcode;
    private $phone;
    private $email;

    private $tableName;
    private $auditLog; // Get an auditlog to write to database

    /**
     * Constructor.
     *
     * @param all the fields in user - defaulting to null if not provided
     *
     */
    public function __construct(
        $memberId=null,
        $userName=null,
        $password=null,
        $firstName=null,
        $lastName=null,
        $role=null,
        $street=null,
        $town=null,
        $state=null,
        $postcode=null,
        $phone=null,
        $email=null
    ) {
        parent::__construct(); // gets a database connection
        $this->tableName = "members";

        $this->setMemberId($memberId);
        $this->setUserName($userName);
        $this->setPassword($password);
        $this->setFirstName($firstName);
        $this->setLastName($lastName);
        $this->setRole($role);
        $this->setStreet($street);
        $this->setTown($town);
        $this->setState($state);
        $this->setPostcode($postcode);
        $this->setPhone($phone);
        $this->setEmail($email);
        echo("here");
        // IF ($this->userExists()) {
        //     // Use this bit to get Aggregations
        // }
    }
    public function __destruct() {
        $entry = "DESTROY member object: memberId:".$this->getMemberId().", UserName:".$this->getUserName();
        $this->log(memberId:$this->getMemberId(),entry:$entry);
        echo("Destroying Member object");
    }

    public function setMemberId($memberId) {
        if ($memberId) {
            $this->memberId = $memberId;
        }
    }
    public function setUserName($userName) {
        if ($userName) {
            $this->userName = $userName;
        }
    }
    public function setPassword($password) {
        if ($password) {
            $this->password = $password;
        }
    }
    public function setFirstName($firstName=null) {
        IF ($firstName) {
            $this->firstName = cipher::encrypt($firstName);
        }
    }
    public function setLastName($lastName=null) {
        IF ($lastName) {
            $this->lastName = cipher::encrypt($lastName);
        }
    }
    public function setRole($role=null) {
        IF ($role) {
            $this->role = $role;
        }
    }
    public function setStreet($street=null) {
        IF ($street) {
            $this->street = cipher::encrypt($street);
        }
    }
    public function setTown($town=null) {
        IF ($town) {
            $this->town = cipher::encrypt($town);
        }
    }
    public function setState($state=null) {
        IF ($state) {
            $this->state = cipher::encrypt($state);
        }
    }
    public function setPostcode($postcode=null) {
        IF ($postcode) {
            $this->postcode = cipher::encrypt($postcode);
        }
    }
    public function setPhone($phone=null) {
        IF ($phone) {
            $this->phone = cipher::encrypt($phone);
        }
    }
    public function setEmail($email=null) {
        IF ($email) {
            $this->email = cipher::encrypt($email);
        }
    }

    public function getMemberId() {
        return $this->memberId;
    }

    public function getUserName() {
        return ($this->userName);
    }
    public function getFirstName() {
        return cipher::decrypt($this->firstName);
    }
    public function getLastName() {
        return cipher::decrypt($this->lastName);
    }
    public function getFullName() {
        return cipher::decrypt($this->firstName)." ".cipher::decrypt($this->lastName);
        ;
    }
    public function getRole() {
        return ($this->role);
    }
    public function getStreet() {
        return cipher::decrypt($this->street);
    }
    public function getTown() {
        return cipher::decrypt($this->town);
    }
    public function getState() {
        return cipher::decrypt($this->state);
    }
    public function getPostcode() {
        return cipher::decrypt($this->postcode);
    }
    public function getPhone() {
        return cipher::decrypt($this->phone);
    }
    public function getEmail() {
        return cipher::decrypt($this->email);
    }

    public function log($memberId=null, $entity="User", $action=null,$entry=null) {
        //$membe = getMemberId();
        //echo("<script>console.log('Entity:".$entity.", Action:".$action.", Entry:".$entry."');</script>");
        $this->auditLog = new auditLog();
        $this->auditLog->addLog($memberId, $entity, $action, $entry);
    }
    /**
     * Method:  userExists
     * @param:  $userName  optional
     *
     * Determines if user exists in database - returns TRUE or FALSE
     *
     */
    public function userExists($userName=null) {

        $action = "User Exists Check";

        IF ($userName) {
            $this->setUserName($userName);
        }
        // echo("Check: $userName");
        $sql        = "SELECT COUNT(*) AS numRows FROM ".$this->tableName." AS u WHERE u.userName = '".$this->getUserName()."'";
        $result     = $this->run($sql);
        $numRows    = $result->fetch_assoc()['numRows']; //num_rows;
        //echo($numRows);
        IF ($numRows==1) {
            $entry = "Verified: User Exists: <".$this->getUserName().">";
            $this->log(memberId:$this->getMemberId(),action:$action,entry:$entry);
        } ELSE {
            $entry = "Verified: User Does Not Exist:<".$this->getUserName().">";
            $this->log(memberId:$this->getMemberId(),action:$action,entry:$entry);
        }

    return ($numRows==1);
    }

    /**
     * LOGIN
     * This method takes the username and password and verifies
     * Returns different return codes (retCode) to flag success or
     * failures
     * retCode    Meaning
     *         0    Success
     *         1    Invalid Username
     *         2    Invalid Password
     *         9    Generic Error
     *
     * @param $iUserName     Input User Name
     * @param $iPassword    Input Password
     */
    public function login($iUserName=null, $iPassword=null) {

        // echo("Login with {".$iUserName."}, {".$iPassword."}<br/>");

        $retCode = 9;
        $action = "Login";

        $sql = "SELECT u.memberId, u.userName, u.firstName, u.lastName, u.password, u.role, u.street, u.town, u.state, u.postcode, u.phone, u.email FROM ".$this->tableName." AS u WHERE u.userName = ?";

        TRY {
            //NOTE: This is too complex for a generic Database Class Function
            $stmt = $this->getConn()->prepare($sql);
            $stmt->bind_param('s',$iUserName);
            echo($sql);

            //Executing the statement  
            $stmt->execute();
            /* Store the result (to get properties) */
            $stmt->store_result();

            //Binding values in result to variables - note these are encrypted values
            // Note: this does not fetch the data, just maps the db columns to the fields
            $stmt->bind_result(
                $this->memberId,
                $this->userName,
                $this->firstName,
                $this->lastName,
                //$this->password, // better not to store this
                $tempPassword,
                $this->role,
                $this->street,
                $this->town,
                $this->state,
                $this->postcode,
                $this->phone,
                $this->email);

            /* Get the number of rows */
            $num_of_rows = $stmt->num_rows;


            IF ($num_of_rows <= 0) {
                $retCode = 1;
                $entry = "UserName: <".$iUserName.">: - Failed Login: Invalid userName.";
                $this->log(entry:$entry);
            } ELSE {
                // Now fetch the result data from stmt object into the bound variables
                $stmt->fetch();
                //Verify the password before continuing
                
                IF (password_verify($iPassword, $tempPassword)) {
                    $retCode = 0;
                    $entry = "MemberId:".$this->getMemberId().", UserName:".$this->getUserName()." - Successful login.";

                    $this->log(memberId:$this->getMemberId(),action:$action,entry:$entry);
                } ELSE {
                    $retCode = 2;
                    $entry = "UserName:".$this->getUserName().": - Failed Login: Invalid Password";
                    $this->log(action:$action,entry:$entry);
                }
            }
            $stmt->close();

        } CATCH (Exception $e) {
            // echo("Error: ".$e->getMessage());
            $retCode = 9;
            $entry = "UserName:".$iUserName.": - Failed Login: System Error: ".$e->getMessage();
            $this->log(action:$action,entry:$entry);
        }
        RETURN $retCode;
    }

    public function logout() {
        $retCode = 0;
        $action = "logout";

        $entry = "memberId:".$this->getMemberId().", UserName:".$this->getUserName()." - has logged out";
        $this->log(memberId:$this->getMemberId(),action:$action,entry:$entry);

        return $retCode;
    }

    /**
     * Method: save
     *
     * If $memberId exists - then UPDATE record otherwise INSERT new record
     *
     * Note: we use the fields directly rather that the get method - as we want the encrypted value
     */
    public function save() {
        $retCode = 9;
        $action = "Save";
        $psword = $this->password;
        $hshPWD = password_hash($psword, PASSWORD_DEFAULT);

        IF ($this->memberId) {  //Existing Record
            $sql = <<<EOD
                UPDATE $this->tableName SET
                      userName = '$this->userName',
                    password = '$hshPWD',
                    firstName = '$this->firstName',
                    lastName = '$this->lastName',
                    street = '$this->street',
                    town = '$this->town',
                    state = '$this->state',
                    postcode = '$this->postcode',
                    phone = '$this->phone',
                    email = '$this->email'
                WHERE memberId = $this->memberId
                EOD;
            // ECHO($sql."<br/>");
            IF ($this->run($sql)) {
                $entry = "Update Successful: memberId:".$this->getMemberId().", UserName:".$this->getUserName();
                $this->log(memberId:$this->getMemberId(),action:$action,entry:$entry);
                $this->commit();
                $retCode = 0;
            } ELSE {
                $entry = "Update Failed:  memberId:".$this->getMemberId().", UserName:".$this->getUserName().", sql=".$sql. ", Error:" . $this->getError();
                $this->log(memberId:$this->getMemberId(),action:$action,entry:$entry);
                $retCode = 1;
            }


        } ELSE {  // New Record

            // Using Heredoc to allow multiline strings - may or maynot work
            $sql = <<<EOD
                INSERT INTO $this->tableName
                (userName, password, firstName, lastName, street, town, state, postcode, phone, email)
                VALUES (
                    '$this->userName',
                    '$hshPWD',
                    '$this->firstName',
                    '$this->lastName',
                    '$this->street',
                    '$this->town',
                    '$this->state',
                    '$this->postcode',
                    '$this->phone',
                    '$this->email'
                )
                EOD;
            IF ($this->run($sql)) {
                // Once INSERT is done, retrieve the new memberId and store in User object
                $this->memberId = $this->getConn()->insert_id;
                $action = "New User";
                $entry = "Add Successful: memberId:".$this->memberId.", UserName:".$this->userName;
                $this->log(action:$action,entry:$entry);
                $this->commit();
                $retCode = 0;
            } ELSE {
                $entry = "Add Failed:  memberId:".$this->memberId.", UserName:".$this->userName.", sql=".$sql. ", Error:" . $this->getError();
                // ECHO("User Save Add Error: " . $sql . "<br>" . $this-getError());
                $this->log(memberId:$this->getMemberId(),action:$action,entry:$entry);
                $retCode = 2;
            }

        }
        RETURN $retCode;

    }

    /**
     * Method: Delete
     *
     * If $memberId exists - then DELETE record
     *
     */
    public function delete() {

        $sql = "";
        // Comment out until DB is created
        //$sql .= "DELETE FROM basketItems WHERE basketId = (SELECT basketId FROM baskets WHERE memberId = $memberId); DELETE FROM baskets WHERE memberId = $memberId; DELETE FROM orderItems WHERE orderId = (SELECT orderId FROM orders WHERE memberId = $memberId); DELETE FROM orders WHERE memberId = $memberId;"
        $sql .= "DELETE FROM ".$this->tableName." WHERE memberId=".$this->getMemberId();
        $retCode = 9;
        $action = "Delete";

        IF ($this->runMulti($sql) === TRUE) {
            $entry = "Delete Successful: memberId:".$this->memberId.", UserName:".$this->userName;
            $this->log(action:$action,entry:$entry);
            $this->commit();            # Once User is deleted ,
            # then force User to login again or create new User
            $_SESSION["user"]=null;
            $retCode = 0;
        } ELSE {
            $entry = "Delete Failed: memberId:".$this->memberId.", UserName:".$this->userName.", SQL: " . $sql . ", Error:" . $this->getError();
            $this->log(memberId:$this->getMemberId(),action:$action,entry:$entry);
        }
    // } ELSE IF ($action == "ord") {
    //     header("Location: UserOrders.php");
    // } ELSE {
    //     $message = "Error: Invalid Action attempted: ".$action;
    //     $this->auditLog->addLog(entity:"User",action:"DELETE",entry:"Delete Failed:  memberId:".$this->memberId.", UserName:".$this->userName.", sql=".$sql);
    //     $retCode = 9;

        RETURN $retCode;
    }

}