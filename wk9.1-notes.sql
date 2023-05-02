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


