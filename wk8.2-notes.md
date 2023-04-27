# Database Design Week 8.2

***

## Aggregate Functions

### Topics to learn

- COUNT
- SUM
- AVG
- MIN and MAX
- GROUP BY
- HAVING


### COUNT

`COUNT` is used to get the number of records that match the conditions of the query.

```sql
/* Get all records in a table */
SELECT COUNT(*) FROM album;
```

```sql
/* Give the output a title using the following syntax */
SELECT COUNT(*) AS 'My Title' FROM my_table;
/* or */
SELECT COUNT(*) My_Table_Name FROM my_table;
```

```sql
/* Get all albums where the release date is >= 1/1/1980 */
SELECT COUNT(*) AS 'Number of ALbums from 1980 Onwards' FROM album
    WHERE release_date >= '1980-01-01';
```

```sql
/* Get all Pink Floyd albums */
SELECT COUNT(*) AS 'Total Number of Pink Floyd Albums' FROM album
    INNER JOIN artist
        ON album.artist_id = artist.artist_id
    WHERE artist.name = 'Pink Floyd';
```

### SUM

`SUM` is used to add numbers to get a total value.

```sql
/* Get the total length of all albums in the database */
SELECT SUM(length) AS 'Total Length of All Albums' FROM album;
```

```sql
/* Get the total length of all albums where the release date is >= 1/1/1980 */
SELECT SUM(length) AS 'Total Length of All Albums from 1980 Onwards' FROM album
    WHERE release_date >= '1980-01-01';
```

```sql
/* Get the total length of all albums by Pink Floyd */
SELECT SUM(length) AS 'Total Length of All Pink Floyd Albums' FROM album
    INNER JOIN artist
        ON album.artist_id = artist.artist_id
    WHERE artist.name = 'Pink Floyd';
```

### AVG

`AVG` is used to get the average value of a column.

```sql
/* Get the average length of all albums in the database */
SELECT AVG(length) AS 'Average Length of All Albums' FROM album;
```

```sql
/* Get the average length of all albums where the release date is >= 1/1/1980 */
SELECT AVG(length) AS 'Average Length of All Albums from 1980 Onwards' FROM album
    WHERE release_date >= '1980-01-01';
```

```sql
/* Get the average length of all albums by Pink Floyd */
SELECT AVG(length) AS 'Average Length of All Pink Floyd Albums' FROM album
    INNER JOIN artist
        ON album.artist_id = artist.artist_id
    WHERE artist.name = 'Pink Floyd';
```

This query returns an integer value. If you want to return a decimal value, you can use the `CAST` function. This way it is not rounded down.

```sql
/* Get the average length of all albums by Pink Floyd */
SELECT AVG(CAST(length AS FLOAT)) AS 'Average Length of All Pink Floyd Albums' FROM album
    INNER JOIN artist
        ON album.artist_id = artist.artist_id
    WHERE artist.name = 'Pink Floyd';
```

### MIN and MAX

`MIN` and `MAX` are used to get the minimum and maximum values of a column.

```sql
/* Get the shortest album in the database */
SELECT MIN(length) AS 'Shortest Album' FROM album;
```

```sql
/* Get the longest album in the database */
SELECT MAX(length) AS 'Longest Album' FROM album;
```

### GROUP BY

`GROUP BY` is used to group the results of a query by a column.

```sql
/* Basic Syntax */
SELECT column_names
    FROM table_name
    WHERE conditions
    ORDER BY column_name
    GROUP BY column_name;
```

```sql
/* Show the number of tracks on each album */
SELECT artist.name AS 'Artist', album_track.album_name AS 'Album', COUNT(album_track.track_name) AS 'Number of Tracks' FROM album_track
    INNER JOIN artist
        ON album_track.artist_id = artist.artist_id
    GROUP BY artist.name, album_track.album_name;
```

### HAVING

`HAVING` is used to filter the results of an aggregate function. It is similar to `WHERE`, but `WHERE` cannot be used with aggregate functions.

```sql
/* Show the number of tracks on each album with 5 or more tracks */
SELECT artist_id, album_name, COUNT(track_name) AS 'Number of Tracks' FROM album_track
    GROUP BY artist_id, album_name
    HAVING COUNT(track_name) >= 5;
```

***