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


-- Another complex example
-- Produce a list of only the artists and producers who have been associated with an album.
SELECT name FROM artist
    INNER JOIN album
        ON artist.artist_id = album.artist_id
UNION
SELECT name FROM producer
    INNER JOIN album
        ON producer.producer_id = album.producer_id;

-- Class Exersise 1
-- Write a query that returns the names of all albums in the album table and all albums in the genre table, keeping duplicates.
SELECT album_name FROM album
UNION ALL
SELECT album_name FROM genre;


-- 3. INTERSECT
-- Returns records (rows) that are in both sets

-- Basic Syntax
SELECT column_name1 FROM table1
INTERSECT
SELECT column_name2 FROM table2;

-- Example from 100 Albums Database
-- Find the names of all who are both artists and producers.
SELECT name FROM artist
INTERSECT
SELECT name FROM producer;

-- Class Exersise 2
-- Write a query that returns a list of album tracks that have the same name as albums. E.g there is a song (track) called "Protection" on the album "Protection".
SELECT track_name FROM album_track
INTERSECT
SELECT album_name FROM album;
