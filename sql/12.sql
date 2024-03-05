/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */

SELECT 
customer_id,
first_name,
last_name
FROM (
    SELECT
    customer_id,
    first_name,
    last_name,
    inventory_id,
    RANK() OVER (PARTITION BY customer_id ORDER BY rental_date DESC)
    FROM customer
    JOIN rental USING (customer_id)
) a
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE rank <= 5
GROUP BY 1,2,3
HAVING sum(CASE WHEN name = 'Action' THEN 1 ELSE 0 END) >= 4
ORDER BY customer_id;








SELECT
customer_id,
first_name,
last_name
FROM customer cu
JOIN LATERAL (
    SELECT
    rental_date, inventory_id
    FROM rental r
    WHERE r.customer_id = cu.customer_id
    ORDER BY rental_date DESC
    LIMIT 5
) a ON TRUE
JOIN inventory i USING (inventory_id)
JOIN film f USING (film_id)
JOIN film_category fc USING (film_id)
JOIN category ca USING (category_id)
GROUP BY 1,2,3
HAVING sum(CASE WHEN name = 'Action' THEN 1 ELSE 0 END) >= 4
ORDER BY customer_id;
