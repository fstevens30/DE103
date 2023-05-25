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