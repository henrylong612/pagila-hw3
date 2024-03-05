/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */

SELECT
title
FROM (
    SELECT
    f1.title,
    count(*) AS actor_count
    FROM film f1
    JOIN film_actor fa1 USING (film_id)
    JOIN film_actor fa2 USING (actor_id)
    JOIN film f2 ON fa2.film_id = f2.film_id
    WHERE f2.title = 'AMERICAN CIRCUS'
    GROUP BY 1
) circus
WHERE actor_count >= 2
ORDER BY 1;

