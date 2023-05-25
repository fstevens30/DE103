-- Week 12.2 Views

-- A view is a virtual table based on the result-set of an SQL statement.
-- A view contains rows and columns, just like a real table.
-- Views are good as they can provide security and simplify complex queries.

-- Basic Syntax
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

-- Example
CREATE VIEW album_view AS
    SELECT album_name, release_date, length, record_label
    FROM album;

-- Now we can query the view
SELECT * FROM album_view;

-- Modify the view to show the artist name
SELECT OR ALTER VIEW album_VIEW AS 
    SELECT al.album_name, ar.name, al.release_date, al.length, al.record_label
    FROM album al
        INNER JOIN artist ar
            ON al.artist_id = ar.artist_id;

-- Now we can query the view
SELECT * FROM album_view;

-- You cannot use ORDER BY in a view definition but you can use it when querying the view
-- Example 
SELECT * FROM album_view
ORDER BY album_name;

-- Hiding sensitive data

-- Create a view that hides the release date
CREATE VIEW restricted_album_view AS
    SELECT album_name, length, record_label
    FROM album;

-- Create a view that does not hide the release date
CREATE VIEW full_album_view AS
    SELECT album_name, release_date, length, record_label
    FROM album;

-- Now we can query the views to see the difference
SELECT * FROM restricted_album_view;
SELECT * FROM full_album_view;


-- We can create views that restrict to certain date, e.g albums from the 70's
CREATE VIEW seventies_album_view AS
    SELECT * FROM album
        WHERE release_date BETWEEN '1970-01-01' AND '1979-12-31';

-- Now we can query the view
SELECT * FROM seventies_album_view;