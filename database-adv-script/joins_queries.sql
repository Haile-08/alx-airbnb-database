-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT
    Booking.user_id,
    Booking.total_price,
    Booking.status,
    User.first_name,
    User.email,
    User.phone_number
FROM
    Booking
INNER JOIN
    User
ON
    Booking.user_id = User.user_id;

-- Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT
    Property.property_id,
    Property.name,
    Property.location,
    Review.rating,
    Review.comment
FROM
    Property
LEFT JOIN
    Review
ON
    Property.property_id = Review.property_id
ORDER BY
    Review.rating;

-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT 
    *
FROM
    User
LEFT JOIN
    Booking
ON
    User.user_id = Booking.user_id
UNION
SELECT 
    *
FROM
    User
RIGHT JOIN
    Booking
ON
    User.user_id = Booking.user_id;
