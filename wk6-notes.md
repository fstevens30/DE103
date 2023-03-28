# Database Design

## Week 6 Notes - SQL Select, Update and Delete

## Topics to Learn

- How to use `SELECT` to get data from a single database table
- Selecting some of the data in a table using `WHERE`
- Sorting the selected data using `ORDER BY`
- Altering data in a database using `UPDATE`
- Deleting data from a database using `DELETE`

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

## `WHERE`

By using `WHERE` we can filter the data that is returned from a `SELECT` statement. The `WHERE` clause is used to filter the results of a `SELECT` statement.

```sql
-- Select all tracks from the album 'The Dark Side of the Moon'
SELECT * from album_track
    WHERE album_name = 'The Dark Side of the Moon';
```