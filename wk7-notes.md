# Database Design - Week 7

***

## Joins

### Inner Join

An inner join returns all rows from both tables where the join condition is met.

```sql
SELECT * FROM album
    INNER JOIN album_track
    ON album.album_name = album_track.album_name;
    AND album.artist_id = album_track.artist_id;
```

The above query will return all rows from both tables where the `album_name` and `artist_id` match.
