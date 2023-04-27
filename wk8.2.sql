/* Example Syntax for Week 8.2 */

-- COUNT

SELECT COUNT(column_name)
FROM table_name
WHERE condition;

/* Returns the number of rows that matches a specified criteria */

-- SUM

SELECT SUM(column_name)
FROM table_name
WHERE condition;

/* Returns the total sum of a numeric column */

-- AVG

SELECT AVG(column_name)
FROM table_name
WHERE condition;

/* Returns the average value of a numeric column */

-- MAX

SELECT MAX(column_name)
FROM table_name
WHERE condition;

/* Returns the largest value of the selected column */

-- MIN

SELECT MIN(column_name)
FROM table_name
WHERE condition;

/* Returns the smallest value of the selected column */

-- GROUP BY

SELECT column_name
FROM table_name
WHERE condition
GROUP BY column_name
ORDER BY column_name;

/* Groups rows that have the same values into summary rows, like "find the number of customers in each country" */

-- HAVING

SELECT column_name
FROM table_name
WHERE condition
GROUP BY column_name
HAVING condition
ORDER BY column_name;

/* Used to filter records that work on summarized GROUP BY results */


-- Complex Example using 100 Albums database

/* Return all Pink Floyd albums that have more than 5 tracks */

SELECT a.name AS 'Artist', album.name AS 'Album Name', COUNT(track_name) AS 'Number of Tracks' FROM album_track t
    INNER JOIN artist a
        ON t.artist_id = a.artist_id
    WHERE a.name = 'Pink Floyd'
    GROUP BY a.name, album_name
    HAVING COUNT(track_name) > 5