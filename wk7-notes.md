# Database Design - Week 7

***

## Joins

### Inner Join

Basic Syntax:

```sql
SELECT columns
    FROM table1
    INNER JOIN table2
    ON table1.column = table2.column;
```

An inner join returns all rows from both tables where the join condition is met.

```sql
SELECT * FROM album -- Select all columns from the album table
    INNER JOIN album_track -- Join the album_track table
    ON album.album_name = album_track.album_name; -- Join on the album_name column
    AND album.artist_id = album_track.artist_id; -- Join on the artist_id column
```

The above query will return all rows from both tables where the `album_name` and `artist_id` match.

This can create duplicate rows if there are multiple tracks on an album. we can use the following query to remove the duplicates.

```sql
SELECT album.artist_id, album.album_name, release_date, length, producer_id, record_label, track_name, track_order
    FROM album
    INNER JOIN album_track
    ON album.album_name = album_track.album_name
    AND album.artist_id = album_track.artist_id
```

Instead of using `SELECT *` we can select only the columns we want to return. This will remove the duplicate rows. In the case of `release_date` and others we can see that they aren't using the dot notation. This is because the DBMS knows that the column name is unique and doesn't need to be qualified.

We only want values where the artist is Pink Floyd (`artist_id` = 1). We can use the following query to do this.

```sql
SELECT album.artist_id, album.album_name, release_date, length, producer_id, record_label, track_name, track_order
    FROM album
    INNER JOIN album_track
    ON album.album_name = album_track.album_name
    AND album.artist_id = album_track.artist_id
    WHERE album.artist_id = 1;
```

This doesn't provide the results in a readable format. We can use the `ORDER BY` clause to order the results by `album_name` and `track_order`.

```sql
SELECT album.artist_id, album.album_name, release_date, length, producer_id, record_label, track_name, track_order
    FROM album
    INNER JOIN album_track
    ON album.album_name = album_track.album_name
    AND album.artist_id = album_track.artist_id
    WHERE album.artist_id = 1
    ORDER BY album_name, track_order;
```

### Aliases

We can use aliases to remove the need to use the dot notation. This can make the query easier to read.

```sql
SELECT a.artist_id, a.album_name, release_date, length, producer_id, record_label, track_name, track_order
    FROM album a
    INNER JOIN album_track t
    ON a.album_name = t.album_name
    AND a.artist_id = t.artist_id
    WHERE a.artist_id = 1
    ORDER BY a.album_name, t.track_order;
```

### Exercise

Choose the correct `JOIN` clause to select all records from the two tables where there is a match in both tables.

```sql
SELECT * FROM Orders
    INNER JOIN Customers 
    ON Orders.CustomerID=Customers.CustomerID;
```