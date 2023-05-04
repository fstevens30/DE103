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