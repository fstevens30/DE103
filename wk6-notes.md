# Database Design

***

## Week 6.1 Notes - SQL Select, Update and Delete

## Topics to Learn

- How to use `SELECT` to get data from a single database table
- Selecting some of the data in a table using `WHERE`
- Sorting the selected data using `ORDER BY`
- Altering data in a database using `UPDATE`
- Deleting data from a database using `DELETE`

***

## `SELECT`

The `SELECT` statement is used to retrieve data from a database. It is the most common SQL statement.

```sql
SELECT * from table_name;
```

The `*` is a wildcard that means "all". It is used to select all columns in a table. The above script can be used to select all data from a table. We can select certain columns by listing them in the `SELECT` statement.

```sql
-- Select multiple columns
SELECT column1, column2, column3 from table_name;

-- Select a single column
SELECT column1 from table_name;
```

***

## `WHERE`

By using `WHERE` we can filter the data that is returned from a `SELECT` statement. The `WHERE` clause is used to filter the results of a `SELECT` statement.

```sql
-- Select all tracks from the album 'The Dark Side of the Moon'
SELECT * from album_track
    WHERE album_name = 'The Dark Side of the Moon';
```

We can also use `ORDER BY`  to sort the results of a `SELECT` statement.

```sql
-- Select all tracks from the album 'The Dark Side of the Moon' and sort them by track number
SELECT * from album_track
    WHERE album_name = 'The Dark Side of the Moon'
    ORDER BY track_number;

-- We can also sort in descending order using the keyword DESC
SELECT * from album_track
    WHERE album_name = 'The Dark Side of the Moon'
    ORDER BY track_number DESC;
```

Note that the default sort order is ascending.

***

## `UPDATE`

`UPDATE` is used to modify the existing records in a table.

```sql
-- Update the length of the ablum 'The Dark Side of the Moon' to 42:49
UPDATE album
    SET length = '42:49'
    WHERE album_name = 'The Dark Side of the Moon';
```

We can also use `UPDATE` to change the value of multiple columns in a table.

```sql
-- Update the length of the ablum 'The Dark Side of the Moon' to 42:49 and the release year to 1973
UPDATE album
    SET length = '42:49', release_year = 1973
    WHERE album_name = 'The Dark Side of the Moon';
```

***

## `INSERT`

`INSERT` is used to insert new records in a table.

```sql
-- Insert a new track into the album 'The Dark Side of the Moon'
INSERT INTO album_track (album_name, track_name, track_number, length)
    VALUES ('The Dark Side of the Moon', 'Time', 7, '7:49');
```

We can insert multiple records at once by using the `VALUES` clause multiple times.

```sql
-- Insert multiple tracks into the album 'The Dark Side of the Moon'
INSERT INTO album_track (album_name, track_name, track_number, length)
    VALUES ('The Dark Side of the Moon', 'Time', 7, '7:49'),
           ('The Dark Side of the Moon', 'Money', 8, '6:18'),
           ('The Dark Side of the Moon', 'Us and Them', 9, '7:21');
```

***

## `DELETE`

`DELETE` is used to delete records from a table.

```sql
-- Delete the track 'Time' from the album 'The Dark Side of the Moon'
DELETE FROM album_track
    WHERE album_name = 'The Dark Side of the Moon' AND track_name = 'Time';
```

Be careful when using `DELETE` as it will delete all records that match the `WHERE` clause. If you do not specify a `WHERE` clause, all records in the table will be deleted.
You will also run into issues when trying to delete records that are referenced by other records in other tables. For example, if you try to delete a record from the `album` table that is referenced by a record in the `album_track` table, you will get an error. This is good because it prevents you from deleting data that is still being used by other records.

The most important thing to remember is to **always back up your database before making any changes**.

***

## Week 6.2 Notes - SQL Operators

## Topics to Learn

- Comparison operators
- Logical operators

### Comparison Operators

- `<>` - Not equal to
- `>` - Greater than
- `>=` - Greater than or equal to
- `<` - Less than
- `<=` - Less than or equal to
- `=` - Equal to

Examples:

Using `=`, Equal to:

```sql
-- Select all tracks from the album 'Meddle'
SELECT * FROM album_track
    WHERE album_name = 'Meddle';
```

Using `<>`, Not equal to:

```sql
-- Select all tracks that are not from the album 'Meddle'
SELECT * FROM album_track
    WHERE album_name <> 'Meddle';
```

Using `>`, Greater than:

```sql
-- Select all tracks that have a track number greater than 3
SELECT track_name, track_order FROM album_track
    WHERE track_number > 3;

-- We can also use greater than on text e.g. 'A' > 'B' is false
SELECT track_name, track_order FROM album_track
    WHERE track_name > 'K'; -- This will return all tracks with a name after 'K'
```

Somes notes on text comparison when using `track_name > 'K'`:

| track_name  | RElationship to K          |
| ----------- | -----------                |
| K           | Equal to, not greater than |
| Ka          | Greater than               |
| Light       | Greater than               |