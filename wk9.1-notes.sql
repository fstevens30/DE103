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

-- Class Exersise 1

/* Write a query that adds an album track's track_order to the producer id of the related album.
    Also give the track names in the output, include all album tracks in the result */

SELECT t.track_name, t.track_order, a.producer_id, t.track_order + a.producer_id AS 'Track Order Plus Producer ID' FROM album_track t
    INNER JOIN album a
        ON t.album_name = a.album_name
        AND t.artist_id = a.artist_id;


-- 2. Subtraction

/* Basically the same as addition, just use the - symbol instead of the + symbol */

-- Basic Syntax
SELECT column_name - column_name AS 'Column Name'
    FROM table_name;

-- Or
SELECT column_name - 1000 AS 'Column Name'
    FROM table_name;

-- Example from 100 Albums Database
SELECT album_name, number_of_sales, number_of_sales - 100 AS 'Number of Sales Minus 100'
    FROM album;


-- 3. Multiplication

-- Basic Syntax
SELECT column_name * column_name AS 'Column Name'
    FROM table_name;

-- Or
SELECT column_name * 1000 AS 'Column Name'
    FROM table_name;

-- Example from 100 Albums Database
-- Get each album length in seconds. (Note: 1 minute = 60 seconds)

SELECT album_name, length * 60 AS 'Album Length in Seconds'
    FROM album;

-- Complex example
SELECT r.name, a.album_name, a.sales_value * r.royalty AS 'Artist Earnings' FROM album a
    INNER JOIN artist r
        ON a.artist_id = r.artist_id;


-- 4. Division

-- Basic Syntax
SELECT column_name / column_name AS 'Column Name'
    FROM table_name;

-- Or
SELECT column_name / 1000 AS 'Column Name'
    FROM table_name;

-- When dividing numbers floats have priority over integers, so if you want to get an integer result you need to use the FLOOR() function.

-- Example from 100 Albums Database
-- Get the average value per unit sold
SELECT album_name, sales_value / number_of_sales AS 'Average Value Per Unit Sold'
    FROM album;

-- Class Exersise 2
SELECT  album_name, length, sales_value, sales_value / length AS 'Value Per Minute'
    FROM album;


-- Combining mathmatical operators

-- Get the value of albums sales less the royalties paid to the artist
SELECT a.album_name, a.sales_value - (a.sales_value * r.royalty) AS 'Value After Royalties' FROM album a
    INNER JOIN artist r
        ON a.artist_id = r.artist_id;

/* Remebmer the order of operations from math class, you can use brackets to change the order of operations in SQL as well. 
Therefore the parentheses in the above example are not needed, but they are there to make the code more readable. */

-- Calculate the average track length for each album
SELECT a.album_name, a.length, COUNT(t.track_name) AS 'Number of Tracks', a.length / COUNT(t.track_name) AS 'Average Track Length' FROM album a
    INNER JOIN album_track t
        ON a.album_name = t.album_name
        AND a.artist_id = t.artist_id
    GROUP BY a.album_name, a.length;

-- If we want this to display as a FLOAT we need to use the CAST() function
SELECT a.album_name, a.length, COUNT(t.track_name) AS 'Number of Tracks', CAST(a.length AS FLOAT) / COUNT(t.track_name) AS 'Average Track Length' FROM album a
    INNER JOIN album_track t
        ON a.album_name = t.album_name
        AND a.artist_id = t.artist_id
    GROUP BY a.album_name, a.length;
-- This gives a more accurate result compared to the previous example.