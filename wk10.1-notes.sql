/* Week 10 Lesson 1

Null

Topics to learn:
    - NULL
    - ALTER TABLE AFTER COLUMN
    - Sentinel Values

*/

/* A NULL value in a database is a value that is unknown or missing. 
It is not the same as a zero or a blank space. 
It is a value that is not known. 
It is important to understand NULL values because they can affect the results of queries. */

-- We can use IS NULL or IS NOT NULL to check for NULL values in a database.
-- Example
SELECT column_names
FROM table_name
WHERE column_name IS NULL;

-- Example
SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;
