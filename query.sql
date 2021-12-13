-- EXERCISE 1

-- SELECT all columns from the film table.
-- SELECT * FROM film

-- SELECT district,phone,postal_code from “address” table.
-- SELECT district, phone, postal_code FROM address

-- SELECT address, district,postal_code and concat them and get as “full_address”.
-- SELECT address || ' ' || district || ' ' || postal_code AS full_address FROM address;


-- Exercise 2
-- / SELECT customers that their name starts with “J”
-- SELECT first_name
-- FROM customer
-- WHERE first_name  LIKE 'J%'


-- / SELECT payments that amount value is between 3 and 5
-- SELECT amount
-- FROM payment
-- WHERE amount BETWEEN 3 and 5

-- / SELECT payments that happened between 2007-02-15 and 2007-02-20
-- SELECT payment_date
-- FROM payment
-- WHERE payment_date BETWEEN '2007-02-15' AND '2007-02-20'


-- / SELECT movies that in inventory. (hint : use sub-query)
-- SELECT title, film_id 
-- 	FROM film 
-- 	WHERE film_id 
-- 	IN(
-- 		SELECT film_id 
-- 		FROM inventory
-- 	)

-- / SELECT payments that amounts between 4-6 order desc by payment_date

-- SELECT amount, payment_date from payment
-- WHERE amount BETWEEN 4 AND 6
-- ORDER BY payment_date DESC

-- / SELECT first 5 customers ORDER by name DESC

-- SELECT first_name FROM customer
-- ORDER BY first_name DESC LIMIT 5

-- / SELECT first 5 customers ORDER by name ASC but skip first 10
-- SELECT first_name FROM customer
-- ORDER BY first_name DESC LIMIT 5 OFFSET 10

-- EXERCISE 3

-- INSERT INTO 
-- 	customer(
-- 	customer_id,
-- 	store_id,
-- 	first_name,
-- 	last_name,
-- 	email,
-- 	adDress_id
-- 	)
-- 	VALUES(
-- 	2001,
-- 	1,
-- 	'James',
-- 	'Hold',
-- 	'JHold1999007@gmail.com',
-- 	1),
-- 	(
-- 	2000,
-- 	1,
-- 	'Izzatillo',
-- 	'Mukhtor',
-- 	'n6mer123@gmail.com',
-- 	1),
-- 	(
-- 	2002,
-- 	1,
-- 	'John',
-- 	'Whick',
-- 	'JohnWhicjk@gmail.com',
-- 	1)
-- 	RETURNING *;
	
-- UPDATE customer
-- 	SET
-- 	first_name = 'tillo'
-- 	WHERE customer_id = 2000
-- 	RETURNING *;
--  SELECT * FROM customer


--   SELECT first_name FROM customer

--  DELETE FROM customer
--  WHERE first_name = 'tillo'
-- SELECT first_name FROM customer
-- WHERE customer_id = 2001

-- SELECT first_name, customer_id FROM customer
-- ORDER BY customer_id DESC


-- EXERCISE 4

-- / List the total spend that are
-- above the total average spend
-- by grouping them with the
-- customer_id.
-- / Round average with 2
-- precision using ROUND()
-- function

--  SELECT customer_id,
--  	SUM(amount) AS total_spent,
-- 	ROUND((SELECT AVG(amount) FROM payment),2)
-- 	FROM payment
--  	GROUP BY customer_id
--  	HAVING SUM(amount) > (SELECT AVG(amount) FROM payment)

-- EXERCISE 5

-- Get total payment that is above average, join staff who made rental and customer

-- SELECT
-- 	customer.first_name AS customer_first_name,
-- 	customer.last_name AS customer_last_name,
-- 	staff.first_name AS staff_first_name,
-- 	staff.last_name AS staff_last_name,
-- 	SUM(amount) AS total_paid
-- 	FROM payment p, customer c, staff s
-- 	GROUP BY customer.first_name, customer.last_name, staff.first_name, staff.last_name
-- 	HAVING SUM(amount) > (SELECT AVG(amount) FROM payment)
--  	JOIN customer cus ON c.customer.first_name = cus.customer.first_name
	
