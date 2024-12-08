-- Drop the existing table if it exists
DROP TABLE IF EXISTS Booking;

-- Create the Booking table with partitioning based on the start_date column
CREATE TABLE Booking (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL, 
    total_price DECIMAL(10, 2) NOT NULL, 
    booking_status ENUM('pending', 'confirmed', 'cancelled') NOT NULL DEFAULT 'pending',
    payment_status ENUM('in_progress', 'paid', 'failed') NOT NULL DEFAULT 'in_progress',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (booking_id, start_date) -- Include start_date in the primary key
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p_before_2020 VALUES LESS THAN (2020),
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023 VALUES LESS THAN (2024),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);



-- Fetch booking within a specific date range
EXPLAIN ANALYZE
SELECT 
    booking_id, property_id, user_id, start_date, end_date, total_price
FROM 
    Booking
WHERE 
    start_date BETWEEN '2022-01-01' AND '2022-12-31';


-- Non-partitioned Booking table
DROP TABLE IF EXISTS Booking_non_partitioned;

CREATE TABLE Booking_non_partitioned LIKE Booking;
INSERT INTO Booking_non_partitioned SELECT * FROM Booking;

-- Test query
EXPLAIN ANALYZE
SELECT 
    booking_id, property_id, user_id, start_date, end_date, total_price
FROM 
    Booking_non_partitioned
WHERE 
    start_date BETWEEN '2022-01-01' AND '2022-12-31';