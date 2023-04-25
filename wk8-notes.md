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

## Left Join

Find all artists, albums that have an artist, and return all columns and records.

```sql
SELECT * FROM artist
    LEFT JOIN album
    ON artist.artist_id = album.artist_id;
```

## Right Join

Find all albums and their producers, including producers that have no albums, and return all columns and records.

```sql
SELECT * FROM album
    RIGHT JOIN producer
    ON album.producer_id = producer.producer_id;
```

As you can see, a `RIGHT JOIN` is the same as a `LEFT JOIN` but with the tables reversed.

The above query can also be written to be a `LEFT JOIN` by reversing the tables and columns.

```sql
SELECT * FROM producer
    LEFT JOIN album
    ON producer.producer_id = album.producer_id;
```

`RIGHT JOIN` can be helpful when the relational database is complex. It is easier to use `LEFT JOIN` most of the time.

## Full Join

Produce a report on albums and record labels, including albums that have no record label and record labels that have no albums.

```sql
SELECT * FROM album
    FULL JOIN record_label
    ON album.record_label = record_label.name
```

## Complex Joins

We have been asked for a report showing all the albums that have record labels and producers associated with them, all record labels and all producers (including those that have no albums associated with them).

```sql
SELECT * FROM album
    RIGHT JOIN record_label
        ON album.record_label = record_label.name
    FULL JOIN producer
        ON album.producer_id = producer.producer_id;
```

The key takeaway is that the order of the joins is important. The `RIGHT JOIN` must be the first join, followed by the `FULL JOIN`. 
The query first joins the `album` and `record_label` tables, then joins the `producer` table to the result of the first join.