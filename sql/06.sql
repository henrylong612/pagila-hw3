/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

SELECT
DISTINCT a1.first_name || ' ' || a1.last_name AS "Actor Name"
FROM actor a1
JOIN film_actor fa1 USING (actor_id)
JOIN film_actor fa2 USING (film_id)
JOIN actor a2 ON fa2.actor_id = a2.actor_id
WHERE a2.first_name = 'RUSSELL'
AND a2.last_name = 'BACALL'
AND a1.first_name || ' ' || a1.last_name NOT IN ('RUSSELL BACALL')
ORDER BY "Actor Name";
