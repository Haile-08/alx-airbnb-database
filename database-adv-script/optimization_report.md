# Query Performance Analysis and Optimization

## Objective

This report analyzes the performance of frequently used queries in the database. Using tools such as `SHOW PROFILE` and `EXPLAIN ANALYZE`, bottlenecks were identified, optimizations were implemented, and improvements were documented.

---

## Step 1: Monitoring Query Performance

### Tools Used

1. **SHOW PROFILE**: Provides detailed information about query execution stages.
2. **EXPLAIN ANALYZE**: Combines the execution plan with actual execution metrics.

### Analyzed Queries

#### Query 1: Fetching Booking Details

```sql
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
```

### Observations (Using `SHOW PROFILE` and `EXPLAIN ANALYZE`)

- **Execution Time**: Query took 0.00176425 seconds.
- **Bottlenecks**:
  1. unoptimized joins.

---

## Step 2: Optimization Suggestions

### Suggested Changes

1. **Add Indexes**:

2. **Query Refactoring**:
   - Used INNER JOIN instead of LEFT JOIN for User and Property.

### Implemented Changes

#### 1. Indexing

```sql
CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);
```

#### 2. Refactored Query

```sql
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
```

---

## Step 3: Post-Implementation Analysis

### Results (Using `SHOW PROFILE` and `EXPLAIN ANALYZE`)

- **Execution Time**: Reduced to 0.00128125 seconds.

---
