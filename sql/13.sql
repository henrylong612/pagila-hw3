/*
 * Management wants to create a "best sellers" list for each actor.
 *
 * Write a SQL query that:
 * For each actor, reports the three films that the actor starred in that have brought in the most revenue for the company.
 * (The revenue is the sum of all payments associated with that film.)
 *
 * HINT:
 * For correct output, you will have to rank the films for each actor.
 * My solution uses the `rank` window function.
 */

SELECT * FROM (
    SELECT
    actor_id,
    first_name,
    last_name,
    film_id,
    title,
    RANK() OVER (PARTITION BY actor_id ORDER BY sum(amount) DESC, film_id) AS rank,
    sum(amount) AS revenue
    FROM actor a
    JOIN film_actor fa USING (actor_id)
    JOIN film USING (film_id)
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
    GROUP BY 1,2,3,4,5
    ORDER BY 1,6
) a
WHERE rank <= 3;
