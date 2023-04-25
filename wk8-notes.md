# Database Design Week 8

***

## Joins Continued

### Topics to Learn

- LEFT OUTER JOIN (LEFT JOIN)
- RIGHT OUTER JOIN (RIGHT JOIN)
- FULL OUTER JOIN (FULL JOIN)

## Inner Join

A small refresher on inner joins. 
Using the 100 Albums Database, find all artists who have albums and return all columns and records.

```sql
SELECT * FROM artist
    INNER JOIN album
    ON artist.artist_id = album.artist_id;
```