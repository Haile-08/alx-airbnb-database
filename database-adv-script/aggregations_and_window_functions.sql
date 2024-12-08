-- Query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause

SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    User.phone_number,
    User.role,
    COUNT(Booking.booking_id) AS total_bookings
FROM 
    User
INNER JOIN
    Booking
ON
    User.user_id = Booking.user_id
GROUP BY 
    User.user_id;


