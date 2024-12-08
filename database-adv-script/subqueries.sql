-- Query to find all properties where the average rating is greater than 4.0 using a subquery

SELECT 
    name 
FROM 
    Property 
WHERE 
    property_id IN (
        SELECT 
            property_id 
        FROM 
            Review 
        GROUP BY 
            property_id 
        HAVING 
            AVG(rating) > 4.0
    );

-- a correlated subquery to find users who have made more than 3 bookings

SELECT 
    user_id,
    first_name,
    last_name,
    email,
    phone_number,
    role
FROM 
    User
WHERE 
    (SELECT COUNT(*) 
     FROM Booking
     WHERE user_id = user_id) > 3;