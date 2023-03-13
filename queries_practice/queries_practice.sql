-- Query 1: Number of customers

SELECT COUNT(*)
FROM customer;

-- Query 2: Number of stores

SELECT COUNT(*)
FROM store;

-- Query 3: Max and Min payment_date

SELECT MIN (payment_date) AS min_payment,
	   MAX (payment_date) AS max_payment
FROM payment;

-- Query 4: JOINS

SELECT p.payment_id, p.rental_id, p.amount, r.inventory_id, i.film_id, f.title
FROM payment AS p
JOIN rental AS r ON p.rental_id = r.rental_id
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id;

-- Query 5: Total money made per movie

SELECT f.title, SUM(p.amount) AS revenue
FROM payment AS p
JOIN rental AS r ON p.rental_id = r.rental_id
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY revenue DESC;

-- Query 6: Top city that is providing the revenue based on the film sold

SELECT c.city, SUM(p.amount) AS revenue
FROM payment AS p
JOIN customer AS cu ON p.customer_id = cu.customer_id
JOIN address AS a ON cu.address_id = a.address_id
JOIN city AS c ON a.city_id = c.city_id
GROUP BY c.city
ORDER BY revenue DESC;