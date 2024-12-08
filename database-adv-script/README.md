# Master SQL Joins: A Step-by-Step Guide

## 🎯 **Objective 1**

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

## 🎯 **Objective 2**

The goal of this task is to master the use of correlated and non-correlated subqueries in SQL.

## 📖 **Instructions**

- **Non-Correlated Subquery**: Write a query to find all properties where the average rating is greater than 4.0 using a subquery.

- **Correlated Subquery**: Write a correlated subquery to find users who have made more than 3 bookings.

---

### 1️⃣ Non-Correlated Subquery

Find all properties where the average rating is greater than 4.0.

#### **Query**:

```sql
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
```

#### 🔍 How it works:

##### Inner Subquery:

- Groups reviews by property_id.
- Calculates the average rating for each property.
- Filters to return only property_id values where the average rating is greater than 4.0.

##### Outer Query:

- Selects the name of properties from the Property table where property_id matches the IDs returned from the subquery

---

### 2️⃣ Correlated Subquery

Find users who have made more than 3 bookings.

#### **Query**:

```sql
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
     WHERE Booking.user_id = User.user_id) > 3;
```

#### 🔍 How it works:

##### Subquery:

- For each row in the User table, the subquery counts the number of bookings made by the current user (Booking.user_id = User.user_id).

- This subquery runs for each row in the User table, making it a correlated subquery.

##### Outer Query:

- Selects details (user_id, first_name, last_name, etc.) of users where the number of bookings is greater than 3.

---

### 📋 Key Concepts

- **Non-Correlated Subquery**: A subquery that runs independently of the outer query. It is executed once and its result is used by the outer query.

- **Correlated Subquery**: A subquery that runs for each row of the outer query. It refers to columns from the outer query in its WHERE clause.
