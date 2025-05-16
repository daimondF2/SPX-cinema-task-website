Shopping Cart Screen
The Member may choose to go to the  Shopping Cart to review their booking requests
Seats booked must be a minimum of 1 - otherwise prompt Member to delete Booking Request


They may wish to Change the Booking Request
Amend  the quantity of seats on the booking request
Seats booked must be a minimum of 1 - otherwise prompt Member to delete Booking Request

Changes to number of seats will need to update the Session will the number of booked seats and the Total Cost of the Booking Request (derived/calculated as Session Cost x Num Seats)
They cannot change the Session - Movie / Cinema - to do this they must delete a booking request and re-request
Audit Log entry made
They may choose to Delete a Booking Request
The booking request may be deleted.
Audit Log entry made.
Checkout requested
An Order is created for the Member
Order will simply contain
the date of the order
the Order Status - defaults to "Booked"
"Awaiting Payment" status and Payment Processing is out of scope for this Interation
"Cancelled" status for an already Booked Order is out of scope for this Iteration.
Each Booking Request is added as an Order Item and linked to that Order including
Date of Booking
Number of Seats
Session details - i.e. Movie and Cinema

<?php
require_once("database.php");
require_once("auditlog.php");

CLASS basket EXTENDS Database{

}
?>

?>