/************************************
Mathematical operations

(Note some examples don't make much real world sense, but are just to show the syntax)
************************************/

-- 1. Addition 

-- Basic Syntax
SELECT column_name + column_name AS 'Column Name'
    FROM table_name;

-- Or

SELECT column_name + 1000 AS 'Column Name'
    FROM table_name;

-- Example from 100 Albums Database

SELECT album_name, number_of_sales, number_of_sales + 100 AS 'Number of Sales Plus 100'
    FROM album;