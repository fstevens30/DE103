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
/* Get all albums where the release date is >= 1/1/1980 */
SELECT COUNT(*) AS 'Number of ALbums from 1980 Onwards' FROM album
    WHERE release_date >= '1980-01-01';
```
