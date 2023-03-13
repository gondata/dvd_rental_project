-- STAR SCHEMA
SELECT dimMovie.title, dimDate.month, dimCustomer.city, SUM(sales_amount) AS revenue
FROM factSales 
JOIN dimMovie    ON (dimMovie.movie_key      = factSales.movie_key)
JOIN dimDate     ON (dimDate.date_key         = factSales.date_key)
JOIN dimCustomer ON (dimCustomer.customer_key = factSales.customer_key)
GROUP BY (dimMovie.title, dimDate.month, dimCustomer.city)
ORDER BY dimMovie.title, dimDate.month, dimCustomer.city, revenue DESC;


-- 3NF
SELECT f.title, EXTRACT(month FROM p.payment_date) AS month, ci.city, sum(p.amount) AS revenue
FROM payment p
JOIN rental r    ON ( p.rental_id = r.rental_id )
JOIN inventory i ON ( r.inventory_id = i.inventory_id )
JOIN film f ON ( i.film_id = f.film_id)
JOIN customer c  ON ( p.customer_id = c.customer_id )
JOIN address a ON ( c.address_id = a.address_id )
JOIN city ci ON ( a.city_id = ci.city_id )
GROUP BY (f.title, month, ci.city)
ORDER BY f.title, month, ci.city, revenue DESC;