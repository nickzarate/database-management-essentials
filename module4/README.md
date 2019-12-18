# Module 4

## Key Lessons

This module primarily taught:

 1. How to use `SELECT` statement to make database queries
 2. Two ways of joining tables both with and without the `JOIN` keyword.

 Example with `JOIN`:

 ```SQL
SELECT location.locno, locname, facname
FROM location INNER JOIN facility
ON location.locno = facility.locno;
 ```

Example without `JOIN`:

```SQL
SELECT location.locno, locname, facname
FROM location, facility
WHERE location.locno = facility.locno;
```

3. Computing simple aggregate functions on multiple rows in a table such as `SUM` `AVG` and `COUNT` by using the `GROUP BY` keyword.
4. Difference between `WHERE` and `HAVING`: `WHERE` is used to filter rows based on conditions from individual rows, whereas `HAVING` is used to filter rows based on conditions from aggregated values.

## Practice Problems

All practice problems and related answers are located in `practice_problems.sql` and cover standard `SELECT` statements in MySQL using both `JOIN` and `GROUP BY` keywords. Problems reference tables in the ICA database.

## Graded Assignment

All problems in the graded assignment and related answers are located in `graded_assignment.sql` and cover more `SELECT` statements in MySQL using both `JOIN` and `GROUP BY` keywords. Problems also reference tables in the ICA database.
