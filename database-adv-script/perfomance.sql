-- Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on perfomance.sql
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    User.phone_number,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_date,
    Payment.payment_method
FROM 
    Booking
LEFT JOIN 
    User 
ON 
    Booking.user_id = User.user_id
LEFT JOIN 
    Property 
ON 
    Booking.property_id = Property.property_id
LEFT JOIN 
    Payment 
ON 
    Booking.booking_id = Payment.booking_id;


SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    User.phone_number,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_date,
    Payment.payment_method
FROM 
    Booking
INNER JOIN 
    User 
ON 
    Booking.user_id = User.user_id
INNER JOIN 
    Property 
ON 
    Booking.property_id = Property.property_id
LEFT JOIN 
    Payment 
ON 
    Booking.booking_id = Payment.booking_id;
