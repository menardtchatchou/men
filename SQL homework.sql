	# 1a
SELECT first_name, last_name FROM actor;

	# 1b
SELECT UPPER(CONCAT (first_name, ' ', last_name)) AS ActorName FROM actor;
	# 2a
SELECT first_name, last_name, actor_id FROM actor
WHERE first_name = Joe;
	# 2b
SELECT first_name, last_name, actor_id FROM actor
WHERE last_name LIKE '%GEN%';
	# 2c
SELECT first_name, last_name, actor_id
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;
	# 2d
SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');
	# 3a
ALTER TABLE actor
ADD COLUMN description blob AFTER last_name;
	#3b
ALTER TABLE actor DROP COLUMN description;
		#4a
SELECT last_name, count(last_name) AS last_namefrequency
FROM actor
GROUP BY last_name
HAVING last_namefrequency >= 1;
	# 4b
SELECT last_name, count(last_name) AS last_namefrequency
FROM actor
GROUP BY last_name
Having last_namefrequency >= 2;
	#4c
UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO'
and last_name = 'WILLIAMS';
	#4d
UPDATE actor
SET first_name = 
case
 WHEN first_name = 'HARPO'
	THEN 'GROUCHO'
ELSE 'MUCHO GROUCHO'
END
WHERE actor_id = 172;

	#5a
    
SHOW CREATE TABLE address;
	#6a s=staff, a= address
    
SELECT s.first_name, s.last_name, a.address FROM staff s
INNER JOIN address a
ON (s.address_id = a.address_id);
	#6b
SELECT s.first_name, s.last_name, SUM(pay.amount)
FROM staff AS s
INNER JOIN payment AS pay
ON pay.staff_id = s.staff_id
WHERE MONTH(pay.payment_date) = 08 AND YEAR(pay.payment_date) = 2005
GROUP BY s.staff_id;
	#6c f=film
SELECT f.title, COUNT(fa.actor_id) AS Actors
FROM film_actor AS fil
INNER JOIN film as f
ON f.film_id = fil.film_id
GROUP BY f.title
ORDER BY Actors desc;
	#6d
SELECT title, COUNT(inventory_id) AS 'count_of_ copies'
FROM film
INNER JOIN inventory
USING (film_id)
WHERE title = 'Hunchback Impossible'
GROUP BY title;
	#6e
SELECT c.first_name, c.last_name, SUM(pay.amount) AS 'sum Paid'
FROM payment AS pay
INNER JOIN customer AS c
ON pay.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;
	#7a
SELECT title
FROM film
WHERE title LIKE 'K%'
OR title LIKE 'Q%'
AND language_id IN
(
 SELECT language_id
 FROM language
 WHERE name = 'English'
);
	#7b
SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
  SELECT actor_id
  FROM film_actor
  WHERE film_id =
  (
     SELECT film_id
     FROM film
     WHERE title = 'Alone Trip'
    )
 );
	#7c
 SELECT first_name, last_name, email, country
FROM customer cus
INNER JOIN address a
ON (cus.address_id = a.address_id)
INNER JOIN city ci
ON (a.city_id = ci.city_id)
INNER JOIN country ct
ON (ci.country_id = ct.country_id)
WHERE ct.country = 'canada';
	#7d
SELECT title, c.name
FROM film f
INNER JOIN film_category fc
ON (f.film_id = fc.film_id)
INNER JOIN category c
ON (c.category_id = fc.category_id)
WHERE name = 'family';
	#7e
SELECT title, COUNT(title) as 'Rentals'
FROM film
INNER JOIN inventory
ON (film.film_id = inventory.film_id)
INNER JOIN rental
ON (inventory.inventory_id = rental.inventory_id)
GROUP by title
ORDER BY rentals desc;
	#7f
SELECT s.store_id, SUM(amount) AS Gross
FROM payment p
INNER JOIN rental r
ON (p.rental_id = r.rental_id)
INNER JOIN inventory i
ON (i.inventory_id = r.inventory_id)
INNER JOIN store s
ON (s.store_id = i.store_id)
GROUP BY s.store_id;
	#7g 
SELECT store_id, city, country
FROM store s
INNER JOIN address a
ON (s.address_id = a.address_id)
INNER JOIN city cit
ON (cit.city_id = a.city_id)
INNER JOIN country ctr
ON(cit.country_id = ctr.country_id);
	#7h
SELECT SUM(amount) AS 'Sales', c.name AS 'Genre'
FROM payment p
INNER JOIN rental r
ON (p.rental_id = r.rental_id)
INNER JOIN inventory i
ON (r.inventory_id = i.inventory_id)
INNER JOIN film_category fc
ON (i.film_id = fc.film_id)
INNER JOIN category c
ON (fc.category_id = c.category_id)
GROUP BY c.name
ORDER BY SUM(amount) DESC;
	#8a
CREATE VIEW top_five_genres AS
SELECT SUM(amount) AS 'Sales', c.name AS Genre
FROM payment p
INNER JOIN rental r
ON (p.rental_id = r.rental_id)
INNER JOIN inventory i
ON (r.inventory_id = i.inventory_id)
INNER JOIN film_category fc
ON (i.film_id = fc.film_id)
INNER JOIN category c
ON (fc.category_id = c.category_id)
GROUP BY c.name
ORDER BY SUM(amount) DESC
LIMIT 5;
	#8b
SELECT * FROM top_five_genres;
	#8c
DROP VIEW top_five_genres;













