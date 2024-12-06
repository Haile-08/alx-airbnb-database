# 📘 Database Sample Data README

---

## 🎯 Objective

Provide SQL scripts to populate the database with sample data for testing purposes.

---

## 📝 Instructions

1. **Understand the Structure**

   - Review the database schema and relationships between tables.

2. **Insert Sample Data**

   - Execute the provided `INSERT` statements to populate the database.
   - Ensure data integrity and logical relationships across tables.

3. **Verify**
   - Run queries to validate that the data has been inserted correctly.

---

## 💾 Sample Data

### 1️⃣ User Table: Sample Data

```sql
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('550e8400-e29b-41d4-a716-446655440000', 'John', 'Doe', 'john.doe@example.com', 'hashedpassword1', '123-456-7890', 'guest'),
  ('550e8400-e29b-41d4-a716-446655440001', 'Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword2', '987-654-3210', 'host'),
  ('550e8400-e29b-41d4-a716-446655440002', 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashedpassword3', NULL, 'guest'),
  ('550e8400-e29b-41d4-a716-446655440003', 'Bob', 'Martin', 'bob.martin@example.com', 'hashedpassword4', '555-123-4567', 'admin');
```

### 2️⃣ Property Table: Sample Data

```sql
INSERT INTO "Property" (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('b2e5c6d7-d42f-41f9-bfa7-9b6437e2d601', '550e8400-e29b-41d4-a716-446655440001', 'Cozy Apartment', 'A small, cozy apartment in the city center', 'New York, NY', 150.00),
  ('b2e5c6d7-d42f-41f9-bfa7-9b6437e2d602', '550e8400-e29b-41d4-a716-446655440001', 'Luxury Villa', 'A luxury villa with an ocean view', 'Los Angeles, CA', 500.00),
  ('b2e5c6d7-d42f-41f9-bfa7-9b6437e2d603', '550e8400-e29b-41d4-a716-446655440002', 'Modern Loft', 'A modern loft in the heart of the city', 'San Francisco, CA', 300.00);

```

### 3️⃣ Booking Table: Sample Data

```sql
INSERT INTO "Booking" (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('b03c3a5b-00ac-41f3-a4de-88a142e432c1', 'b2e5c6d7-d42f-41f9-bfa7-9b6437e2d601', '550e8400-e29b-41d4-a716-446655440000', '2024-12-05', '2024-12-10', 750.00, 'confirmed'),
  ('b03c3a5b-00ac-41f3-a4de-88a142e432c2', 'b2e5c6d7-d42f-41f9-bfa7-9b6437e2d602', '550e8400-e29b-41d4-a716-446655440002', '2024-12-01', '2024-12-07', 2100.00, 'confirmed'),
  ('b03c3a5b-00ac-41f3-a4de-88a142e432c3', 'b2e5c6d7-d42f-41f9-bfa7-9b6437e2d603', '550e8400-e29b-41d4-a716-446655440000', '2024-12-12', '2024-12-15', 900.00, 'pending');

```

### 4️⃣ Payment Table: Sample Data

```sql
INSERT INTO "Payment" (payment_id, booking_id, amount, payment_method)
VALUES
  ('c03c3a5b-01ac-41f3-b1de-88a142e432c1', 'b03c3a5b-00ac-41f3-a4de-88a142e432c1', 750.00, 'credit_card'),
  ('c03c3a5b-01ac-41f3-b1de-88a142e432c2', 'b03c3a5b-00ac-41f3-a4de-88a142e432c2', 2100.00, 'paypal');

```

### 5️⃣ Review Table: Sample Data

```sql
INSERT INTO "Review" (review_id, property_id, user_id, rating, comment)
VALUES
  ('d03c3a5b-02ac-41f3-b2de-88a142e432c1', 'b2e5c6d7-d42f-41f9-bfa7-9b6437e2d601', '550e8400-e29b-41d4-a716-446655440000', 5, 'Great place, would definitely stay again!'),
  ('d03c3a5b-02ac-41f3-b2de-88a142e432c2', 'b2e5c6d7-d42f-41f9-bfa7-9b6437e2d602', '550e8400-e29b-41d4-a716-446655440002', 4, 'Lovely villa, but the pool could be warmer.'),
  ('d03c3a5b-02ac-41f3-b2de-88a142e432c3', 'b2e5c6d7-d42f-41f9-bfa7-9b6437e2d603', '550e8400-e29b-41d4-a716-446655440002', 3, 'Nice loft, but a bit noisy at night.');
```

### 6️⃣ Message Table: Sample Data

```sql
INSERT INTO "Message" (message_id, sender_id, recipient_id, message_body)
VALUES
  ('e03c3a5b-03ac-41f3-b3de-88a142e432c1', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440001', 'Is this property available for booking?'),
  ('e03c3a5b-03ac-41f3-b3de-88a142e432c2', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440000', 'Yes, it is available! You can book it for your dates.');

```
