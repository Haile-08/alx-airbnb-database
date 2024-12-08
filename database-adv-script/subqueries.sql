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
