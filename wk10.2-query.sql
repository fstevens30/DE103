-- Report 1, Which items have not been returned.

SELECT  
        f.title, 
        i.inventory_id, i.media_type, 
        r.rental_date, r.return_date, 
        c.customer_id, c.first_name, c.last_name

    FROM rental r

        INNER JOIN inventory i
            ON r.inventory_id = i.inventory_id

        INNER JOIN customer c
            ON r.customer_id = c.customer_id

        INNER JOIN film f
            ON i.film_id = f.film_id

    WHERE r.return_date IS NULL;

    ORDER BY r.rental_date;


-- Report 2, Find films that we have more than four DVD copies of.

SELECT 
        f.title,
        COUNT(i.inventory_id) AS 'Number of Copies'

    FROM film f

        INNER JOIN inventory i
            ON f.film_id = i.film_id

    WHERE i.media_type = 'DVD'

    GROUP BY f.title

    HAVING COUNT(i.inventory_id) > 4;