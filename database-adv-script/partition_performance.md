# Report on Query Performance: Partitioned vs. Non-Partitioned Table

## Objective

The goal of this analysis was to compare the performance of queries executed on a partitioned `Bookings` table and a non-partitioned `Booking_non_partitioned` table for filtering data within a specific date range (`2022-01-01` to `2022-12-31`).

---

## Observations

| **Table Type**            | **Execution Plan**                                                                      | **Actual Execution Time** |
| ------------------------- | --------------------------------------------------------------------------------------- | ------------------------- |
| **Partitioned Table**     | - Filter: `(Bookings.start_date BETWEEN '2022-01-01' AND '2022-12-31')`.                | **0.0172 seconds**        |
|                           | - Table scan within relevant partitions only.                                           |                           |
| **Non-Partitioned Table** | - Filter: `(Booking_non_partitioned.start_date BETWEEN '2022-01-01' AND '2022-12-31')`. | **0.0103 seconds**        |
|                           | - Full table scan was performed, as no partitioning optimizations were available.       |                           |

---

## Key Findings

### Partition Pruning:

- **Partitioned Table:**  
  MySQL limited the scan to the relevant partition(s) based on the `start_date`. This ensures that only a subset of the table is scanned, reducing I/O overhead for large datasets.
- While the dataset used in this analysis was small, the performance gain from partition pruning would be more evident with larger tables.

### Full Table Scan:

- **Non-Partitioned Table:**  
  Executed a full table scan, checking all rows even when filtering by `start_date`. This behavior would degrade performance as the table size grows.

### Execution Time:

- The observed execution time for the partitioned table was slightly **higher** than the non-partitioned table in this specific case (`0.0172s` vs. `0.0103s`).
- The higher execution time is likely due to the dataset's small size, where the overhead of partition management outweighs pruning benefits.

---

## Conclusions

### Partitioning Benefits:

- For **large tables** with millions of rows, partitioning is expected to offer significant performance improvements, especially for queries filtering data by the partitioning key (e.g., `start_date`).
- Partition pruning reduces the number of rows scanned, leading to faster query execution for large datasets.

### Current Dataset:

- With a **small dataset**, the performance gain from partitioning is minimal. In fact, the added complexity of managing partitions may introduce slight overhead for queries.

---

## Recommendations

1. **Use Partitioning:**
   - For very large tables where filtering by the partitioning key (e.g., `start_date`) is frequent.
2. **Indexing for Small Tables:**
   - For smaller tables, index the filtering columns (e.g., `start_date`) instead of partitioning to avoid unnecessary complexity.
3. **Monitor Query Patterns:**
   - Analyze real-world query patterns and table sizes to determine the optimal optimization strategy based on the application's requirements.
