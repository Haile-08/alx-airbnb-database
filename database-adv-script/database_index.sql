-- User Table Indexes
CREATE INDEX idx_user_user_id ON User(user_id);         -- Used in JOINs with Booking
CREATE INDEX idx_user_email ON User(email);             -- Used in WHERE clauses for login queries

-- Booking Table Indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);   -- Used in JOINs with User
CREATE INDEX idx_booking_property_id ON Booking(property_id); -- Used in JOINs with Property
CREATE INDEX idx_booking_status ON Booking(status);     -- Used in WHERE clauses to filter by status

-- Property Table Indexes
CREATE INDEX idx_property_property_id ON Property(property_id); -- Used in JOINs with Booking
CREATE INDEX idx_property_name ON Property(name);       -- Used in WHERE clauses to filter by property name
CREATE INDEX idx_property_location ON Property(location); -- Used in WHERE clauses to filter by location

-- Measuring Query Performance: Add EXPLAIN and EXPLAIN ANALYZE checks
-- Example 1: Before adding an index on Booking(user_id)
EXPLAIN 
SELECT * 
FROM Booking 
WHERE user_id = 'U1';

-- Example 2: After adding an index on Booking(user_id)
EXPLAIN ANALYZE
SELECT * 
FROM Booking 
WHERE user_id = 'U1';
