/* Week 9 Lesson 2 Notes */

/*
    Set Operators
        - UNION
        - UNION ALL
        - INTERSECT
        - EXCEPT
*/

-- 1. UNION
-- Combines the results of two or more SELECT statements into a single result set that includes all the rows that belong to all SELECT statements in the union.

-- Basic Syntax
SELECT column_name1 FROM table1
UNION
SELECT column_name2 FROM table2;

-- Example from 100 Albums Database
-- Get the names of all artists and producers in the database.
SELECT name FROM artist
UNION
SELECT name FROM producer;

-- This will return a list of all the names of artists and producers in the database. It will also remove any duplicates if there is someone who is both an artist and a producer.

-- 2. UNION ALL
-- Combines the results of two or more SELECT statements into a single result set that includes all the rows that belong to all SELECT statements in the union. The difference between UNION and UNION ALL is that UNION ALL will not remove duplicates.

-- Basic Syntax
SELECT column_name1 FROM table1
UNION ALL
SELECT column_name2 FROM table2;

-- Example from 100 Albums Database
-- Get the names of all artists and producers in the database.
SELECT name FROM artist
UNION ALL
SELECT name FROM producer;

-- This will return a list of all the names of artists and producers in the database, unlike UNION, it will not remove duplicates.


-- A more real world example using UNION all to show who is an artist and who is a producer.
SELECT name, 'Artist' AS "Type" FROM artist
UNION ALL
SELECT name, 'Producer' AS FROM producer;