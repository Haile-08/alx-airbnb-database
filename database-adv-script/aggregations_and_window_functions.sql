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

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received

SELECT 
    Property.property_id,
    Property.name AS property_name,
    COUNT(Booking.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS row_number_rank,
    RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS `rank`
FROM 
    Property
LEFT JOIN 
    Booking
ON 
    Property.property_id = Booking.property_id
GROUP BY 
    Property.property_id, Property.name;
