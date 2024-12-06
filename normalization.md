# 📚 Database Normalization: N1, N2, N3

## 🔹 First Normal Form (1NF)

- **Definition**: Ensures data is in atomic form, with no multi-valued fields, and every row is unique.

---

## 🔹 Second Normal Form (2NF)

- **Definition**: Builds on 1NF by eliminating **partial dependencies**. Every non-key attribute depends on the entire primary key.

---

## 🔹 Third Normal Form (3NF)

- **Definition**: Builds on 2NF by eliminating **transitive dependencies**. Non-key attributes must depend only on the primary key.

---

### **1. User Table**

| Column        | Type                                 | Notes                        |
| ------------- | ------------------------------------ | ---------------------------- |
| user_id       | UUID, Primary Key                    | Unique identifier for users. |
| first_name    | VARCHAR, NOT NULL                    | User's first name.           |
| last_name     | VARCHAR, NOT NULL                    | User's last name.            |
| email         | VARCHAR, UNIQUE, NOT NULL            | User's email address.        |
| password_hash | VARCHAR, NOT NULL                    | Secure password hash.        |
| phone_number  | VARCHAR, NULL                        | Optional phone number.       |
| role          | ENUM (guest, host, admin), NOT NULL  | User role.                   |
| created_at    | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP | Metadata.                    |

- **1NF:**

  - Atomic values: No multi-valued fields, e.g., `role` is stored as an `ENUM`.
  - Unique rows: `user_id` ensures uniqueness.

- **2NF:**

  - Each non-key column (e.g., `first_name`, `role`) depends entirely on `user_id`.

- **3NF:**
  - No transitive dependencies; attributes depend only on `user_id`.

---

### **2. Property Table**

| Column        | Type                                   | Notes                       |
| ------------- | -------------------------------------- | --------------------------- |
| property_id   | UUID, Primary Key                      | Unique property identifier. |
| host_id       | Foreign Key, references User(user_id)  | Host of the property.       |
| name          | VARCHAR, NOT NULL                      | Property name.              |
| description   | TEXT, NOT NULL                         | Details about the property. |
| location      | VARCHAR, NOT NULL                      | Property location.          |
| pricepernight | DECIMAL, NOT NULL                      | Pricing for the property.   |
| created_at    | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP   | Metadata.                   |
| updated_at    | TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP | Metadata.                   |

- **1NF:**

  - Atomic values: Single values for `name`, `location`, etc.

- **2NF:**

  - Non-key attributes like `name` and `pricepernight` depend entirely on `property_id`.

- **3NF:**
  - No transitive dependencies; attributes depend only on `property_id`.

---

### **3. Booking Table**

| Column      | Type                                          | Notes                      |
| ----------- | --------------------------------------------- | -------------------------- |
| booking_id  | UUID, Primary Key                             | Unique booking identifier. |
| property_id | Foreign Key, references Property(property_id) | Links booking to property. |
| user_id     | Foreign Key, references User(user_id)         | Links booking to user.     |
| start_date  | DATE, NOT NULL                                | Booking start date.        |
| end_date    | DATE, NOT NULL                                | Booking end date.          |
| total_price | DECIMAL, NOT NULL                             | Total cost of the booking. |
| status      | ENUM (pending, confirmed, canceled), NOT NULL | Status of the booking.     |
| created_at  | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP          | Metadata.                  |

- **1NF:**

  - Atomic values: Each column contains indivisible data.

- **2NF:**

  - Non-key attributes (e.g., `total_price`) depend fully on the primary key `booking_id`.

- **3NF:**
  - No transitive dependencies; attributes depend only on `booking_id`.

---

### **4. Payment Table**

| Column         | Type                                         | Notes                      |
| -------------- | -------------------------------------------- | -------------------------- |
| payment_id     | UUID, Primary Key                            | Unique payment identifier. |
| booking_id     | Foreign Key, references Booking(booking_id)  | Links payment to booking.  |
| amount         | DECIMAL, NOT NULL                            | Amount paid.               |
| payment_date   | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP         | Date of payment.           |
| payment_method | ENUM (credit_card, paypal, stripe), NOT NULL | Payment method used.       |

- **1NF:**

  - Atomic values: Each column holds single, indivisible data.

- **2NF:**

  - All non-key attributes (e.g., `amount`, `payment_date`) depend fully on the primary key `payment_id`.

- **3NF:**
  - No transitive dependencies; attributes depend directly on `payment_id`.

---

### **5. Review Table**

| Column      | Type                                                  | Notes                     |
| ----------- | ----------------------------------------------------- | ------------------------- |
| review_id   | UUID, Primary Key                                     | Unique review identifier. |
| property_id | Foreign Key, references Property(property_id)         | Links review to property. |
| user_id     | Foreign Key, references User(user_id)                 | Links review to user.     |
| rating      | INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL | Rating given by the user. |
| comment     | TEXT, NOT NULL                                        | Review comment.           |
| created_at  | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP                  | Metadata.                 |

- **1NF:**

  - Atomic values: Each column contains single values.

- **2NF:**

  - All non-key attributes (e.g., `rating`, `comment`) depend entirely on `review_id`.

- **3NF:**
  - No transitive dependencies; attributes depend directly on `review_id`.

---

### **6. Message Table**

| Column       | Type                                  | Notes                      |
| ------------ | ------------------------------------- | -------------------------- |
| message_id   | UUID, Primary Key                     | Unique message identifier. |
| sender_id    | Foreign Key, references User(user_id) | Sender of the message.     |
| recipient_id | Foreign Key, references User(user_id) | Recipient of the message.  |
| message_body | TEXT, NOT NULL                        | Content of the message.    |
| sent_at      | TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  | Date/time of sending.      |

- **1NF:**

  - Atomic values: Each column contains indivisible data.

- **2NF:**

  - All non-key attributes (e.g., `message_body`, `sent_at`) depend entirely on the primary key `message_id`.

- **3NF:**
  - No transitive dependencies; attributes depend directly on `message_id`.

---

## 🏆 **Conclusion**

Each table adheres to:

1. **1NF:** Atomic values and unique rows.
2. **2NF:** Non-key attributes depend fully on the primary key.
3. **3NF:** No transitive dependencies, ensuring the database is normalized and efficient.
