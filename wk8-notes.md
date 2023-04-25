# Database Design Week 8

***

## Joins Continued

### Topics to Learn

- LEFT OUTER JOIN (LEFT JOIN)
- RIGHT OUTER JOIN (RIGHT JOIN)
- FULL OUTER JOIN (FULL JOIN)

An `INNER JOIN` returns all records from both tables where the join condition is met.
A `LEFT JOIN` or `RIGHT JOIN` returns all records from one table and only the matching records from the other table.
A `FULL JOIN` returns all records from both tables regardless of whether the join condition is met.

## Inner Join

A small refresher on inner joins. 
Using the 100 Albums Database, find all artists who have albums and return all columns and records.

```sql
SELECT * FROM artist
    INNER JOIN album
    ON artist.artist_id = album.artist_id;
```