TODO EXPORT DATABASE
 

TODO Stage 2 - Movie Listings and Bookings

To that end you are required to develop a dynamic website that will have the following Business features:

Movie Listings Selection Screen
Have a filter at the top of page by Location - default ALL
Clicking on a Location filters movies from that Location
Movies will be listed with the following information
Location / Cinema Name
Movie Name
Movie Poster
Link to Movie Details Screen 
Movie Details Screen
Movie information
Location / Cinema Name
Movie Name
Movie Poster
Link to Movie Details Screen 
Embedded Youtube of Movie Trailer
Session Information
Session Times
Session Cost
User selects a session and request to Book that session ("button" or link on each session)
Booking Screen
Members may select a Movie at a particular Session and choose to Add a Booking
The Booking Screen will show
the Movie and Cinema details
the Session details - including the number of available seats left
Member submits a Booking Request
The Number of Seats to book for this session
Total Cost is calculated as Session cost x Number of Seats
the Date of the Booking (default to today)
Once submitted the booking request  is stored in the Member's shopping cart
Audit Log entry made

Shopping Cart Screen
The Member may choose to go to the  Shopping Cart to review their booking requests
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

Order History Screen
Members may wish to view previous Orders
Each Order will show each Order Item - that will include
Movie and Session and Cinema
Seats Booked
 