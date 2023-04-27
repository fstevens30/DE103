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

Count is used to get the number of records that match the conditions of the query.

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
