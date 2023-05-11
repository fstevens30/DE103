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



-- Workshop Quiz

-- How many VHS tapes are in the inventory?

SELECT 
        COUNT(i.inventory_id) AS 'Number of VHS Tapes'

    FROM inventory i

    WHERE i.media_type = 'VHS';


-- Which actors are in the film 'Caddyshack Jedi'?

SELECT 
        a.first_name, a.last_name

    FROM actor a

        INNER JOIN film_actor fa
            ON a.actor_id = fa.actor_id

        INNER JOIN film f
            ON fa.film_id = f.film_id

    WHERE f.title = 'Caddyshack Jedi';

-- Which films have the actor 'Emily Dee' appeared in?

SELECT 
        f.title

    FROM film f

        INNER JOIN film_actor fa
            ON f.film_id = fa.film_id

        INNER JOIN actor a
            ON fa.actor_id = a.actor_id

    WHERE a.first_name = 'Emily' AND a.last_name = 'Dee';