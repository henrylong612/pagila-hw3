/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

/*
SELECT
a1.first_name || ' ' || a1.last_name AS "Actor Name"
FROM actor a1
JOIN film_actor fa1 USING (actor_id)
JOIN film_actor fa2 USING (film_id)
JOIN film_actor fa3 ON fa2.actor_id = fa3.actor_id
JOIN film_actor fa4 ON fa4.film_id = fa4.film_id
JOIN actor a2 ON fa4.actor_id = a2.actor_id
WHERE a2.first_name = 'RUSSELL'
AND a2.last_name = 'BACALL'
EXCEPT
SELECT
a1.first_name || ' ' || a1.last_name AS "Actor Name"
FROM actor a1
JOIN film_actor fa1 USING (actor_id)
JOIN film_actor fa2 USING (film_id)
JOIN actor a2 ON fa2.actor_id = a2.actor_id
WHERE a2.first_name = 'RUSSELL'
AND a2.last_name = 'BACALL'
ORDER BY "Actor Name";
 */

SELECT
a1.first_name || ' ' || a1.last_name AS "Actor Name"
FROM actor a1
JOIN (
    SELECT
    fa1.actor_id
    FROM film_actor fa1
    JOIN film_actor fa2 USING (film_id)
    JOIN film_actor fa3 ON fa2.actor_id = fa3.actor_id
    JOIN film_actor fa4 ON fa4.film_id = fa4.film_id
    JOIN actor a2 ON fa4.actor_id = a2.actor_id
    WHERE a2.first_name = 'RUSSELL'
    AND a2.last_name = 'BACALL'
    EXCEPT
    SELECT
    fa1.actor_id
    FROM film_actor fa1
    JOIN film_actor fa2 USING (film_id)
    JOIN actor a2 ON fa2.actor_id = a2.actor_id
    WHERE a2.first_name = 'RUSSELL'
    AND a2.last_name = 'BACALL'
) lala USING (actor_id)
ORDER BY 1;
