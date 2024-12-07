-- CREATE THE USER TABLE
CREATE TABLE IF NOT EXISTS User (
    user_id CHAR(36) CHARACTER SET ascii PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CREATE THE PROPERTY TABLE
CREATE TABLE IF NOT EXISTS Property (
    property_id CHAR(36) CHARACTER SET ascii PRIMARY KEY,
    host_id CHAR(36) CHARACTER SET ascii NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- CREATE THE BOOKING TABLE
CREATE TABLE IF NOT EXISTS Booking (
    booking_id CHAR(36) CHARACTER SET ascii PRIMARY KEY,
    property_id CHAR(36) CHARACTER SET ascii NOT NULL,
    user_id CHAR(36) CHARACTER SET ascii NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- CREATE THE PAYMENT TABLE
CREATE TABLE IF NOT EXISTS Payment (
    payment_id CHAR(36) CHARACTER SET ascii PRIMARY KEY,
    booking_id CHAR(36) CHARACTER SET ascii NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);

-- CREATE THE REVIEW TABLE
CREATE TABLE IF NOT EXISTS Review (
    review_id CHAR(36) CHARACTER SET ascii PRIMARY KEY,
    property_id CHAR(36) CHARACTER SET ascii NOT NULL,
    user_id CHAR(36) CHARACTER SET ascii NOT NULL,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- CREATE THE MESSAGE TABLE
CREATE TABLE IF NOT EXISTS Message (
    message_id CHAR(36) CHARACTER SET ascii PRIMARY KEY,
    sender_id CHAR(36) CHARACTER SET ascii NOT NULL,
    recipient_id CHAR(36) CHARACTER SET ascii NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- CREATE INDEXES FOR OPTIMIZATION
CREATE UNIQUE INDEX idx_user_email ON User(email);
CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_id ON Booking(booking_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
