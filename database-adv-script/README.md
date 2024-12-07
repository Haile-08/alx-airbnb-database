# Master SQL Joins: A Step-by-Step Guide

## 🎯 **Objective**

The goal of this task is to master SQL joins by writing and executing complex queries using different types of joins.

---

## 📖 **Instructions**

### 1️⃣ **Inner Join: Retrieve All Bookings and Their Respective Users**

Use an `INNER JOIN` to fetch only the bookings that have associated users. This ensures that only matched records are retrieved.

#### **Query**:

```sql
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
```

---

## 2️⃣ **Left Join: Retrieve All Properties and Their Reviews**

Use a **LEFT JOIN** to fetch all properties, including those without any reviews. This ensures that even unmatched rows from the `Property` table are displayed with `NULL` values for the review columns.

### **Query:**

```sql
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
```

---

## 3️⃣ **Full Outer Join**

Simulate a **FULL OUTER JOIN** in MySQL (as it doesn’t natively support it) by combining a **LEFT JOIN** and a **RIGHT JOIN** using a **UNION**. This ensures all users and bookings are displayed, even if they don’t have matching records.

### **Query:**

```sql
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
```

---

## 🧑‍💻 **How It Works**

- **INNER JOIN**: Returns rows only when there is a match in both tables.
- **LEFT JOIN**: Returns all rows from the left table, and matching rows from the right table. If no match is found, `NULL` is returned for columns from the right table.
- **FULL OUTER JOIN (Simulated)**: Combines the results of **LEFT JOIN** and **RIGHT JOIN** to include all rows from both tables.

---

## 📝 **Output Examples**

### 1️⃣ **Inner Join Output:**

| **user_id** | **total_price** | **status** | **first_name** | **email**        | **phone_number** |
| ----------- | --------------- | ---------- | -------------- | ---------------- | ---------------- |
| 1           | 500.00          | confirmed  | John           | john@example.com | 123-456-7890     |

---

### 2️⃣ **Left Join Output:**

| **property_id** | **name**       | **location**    | **rating** | **comment**     |
| --------------- | -------------- | --------------- | ---------- | --------------- |
| 101             | Cozy Apartment | New York, NY    | 5          | "Amazing stay!" |
| 102             | Luxury Villa   | Los Angeles, CA | NULL       | NULL            |

---

### 3️⃣ **Full Outer Join Output:**

| **user_id** | **name** | **booking_id** | **total_price** | **status** |
| ----------- | -------- | -------------- | --------------- | ---------- |
| 1           | John     | 101            | 500.00          | confirmed  |
| 2           | Alice    | NULL           | NULL            | NULL       |
| NULL        | NULL     | 102            | 300.00          | pending    |

---

## 🚀 **Next Steps**

1. **Run the provided queries** in your MySQL environment.
2. **Explore the results** and identify patterns in the joins.
3. **Modify the queries** to include additional fields or filters for more complex scenarios.
