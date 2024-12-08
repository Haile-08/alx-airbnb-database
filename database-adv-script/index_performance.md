## 📚 **1️⃣ Identify High-Usage Columns**

Based on frequently used queries, the following columns are identified as candidates for indexing:

| **Table**    | **Column**    | **Reason for Indexing**                                  |
| ------------ | ------------- | -------------------------------------------------------- |
| **User**     | `user_id`     | Used in **JOIN** clauses to link with **Booking** table. |
| **User**     | `email`       | Used frequently in **WHERE** clauses for login queries.  |
| **Booking**  | `user_id`     | Used in **JOIN** with the **User** table.                |
| **Booking**  | `property_id` | Used in **JOIN** with the **Property** table.            |
| **Booking**  | `status`      | Used in **WHERE** to filter bookings by status.          |
| **Property** | `property_id` | Used in **JOIN** with the **Booking** table.             |
| **Property** | `name`        | Used in **WHERE** for searching properties by name.      |
| **Property** | `location`    | Used in **WHERE** when filtering properties by location. |
