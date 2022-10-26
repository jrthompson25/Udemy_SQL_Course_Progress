Got to --Test query for successful connection to database
SELECT * FROM film;


SELECT * FROM actor;

SELECT first_name, last_name FROM actor;

SELECT * FROM city;

--Challenge Question (Select Statement)
SELECT first_name, last_name, email
FROM customer;


--DISTINCT
--Distinct release years from film table
SELECT * FROM film;
SELECT DISTINCT release_year FROM film;

--Distinct rental rate from film table
SELECT * FROM film;
SELECT DISTINCT rental_rate FROM film;

--Challenge
SELECT * FROM film;
SELECT DISTINCT rating FROM film;

--Aggregate Functions - Count
SELECT * FROM payment;

--To get the amount of rows in the payment table without scrolling all the way down
SELECT COUNT(*) FROM payment;

--All the amounts in the amount column
SELECT amount FROM payment;

--Unique payment amounts
SELECT DISTINCT amount FROM payment;

--The number of unique amounts in the amount column
SELECT COUNT(DISTINCT amount) FROM payment;

--Where Clause
	--Used to filter results of the select statement
	--Appears Immediately after the FROM clause of the SELECT statement
	--Cannot use aggregate functions as part of the WHERE statement
	--Can use comparison operators - >, <, >=, <=, =, <> or !=
	--Logical Operators - AND, OR, NOT

--Get customers with first name of Jared from customer table
SELECT * FROM customer
WHERE first_name = 'Jared';

--Films with a rental rate of more than 4 dollars
SELECT * FROM film
WHERE rental_rate > 4;

--Films with a rental rate of more than 4 dollars and replacement cost of more than 19.99
SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99;

--Films with a rental rate of more than 4 dollars, replacement cost is equal to or more than 19.99 and rating is R.
SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';

--Film titles with a rental rate of more than 4 dollars, replacement cost is equal to or more than 19.99 and rating is R.
SELECT title FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';


--Count of film titles with a rental rate of more than 4 dollars, replacement cost is equal to or more than 19.99 and rating is R.
SELECT COUNT(title) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';

--OR Logical Operator

--Gets count of films with a rating of R or PG-13
SELECT COUNT(*) FROM film
WHERE rating = 'R' OR rating = 'PG-13';

--Gets all films with a rating other than R
SELECT * FROM film
WHERE rating != 'R';

--Challenge No.1
SELECT * FROM customer;
SELECT email FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

--Challenge No.2
SELECT * FROM film;
SELECT description FROM film
WHERE title = 'Outlaw Hanky';

--Challenge No.3
SELECT * FROM address;
SELECT phone FROM address
WHERE address = '259 Ipoh Drive';


--Order By
--Order By is done late in the query because you want to gather the results first them sort them after you have them
SELECT * FROM customer;

--Ordering everything in the customer table by the customer first name
SELECT * FROM customer
ORDER BY first_name ASC; --Even though ascending order is default if not declared ASC or DESC, ASC helps others who may read your code to know that the table is sorted in ascending order.


--Descending order
SELECT * FROM customer
ORDER BY first_name DESC; 

--Ordering by store_id and first_name columns
SELECT * FROM customer
ORDER BY store_id, first_name;

--Sorting by store_id and selecting certain columns out of customer table.
SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id;

--Same as before only now we're selecting certain columns out of customer table.
SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id, first_name;

--Same as before only now we're sorting store_id in Descending order and first_name in Ascending order.
SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id DESC, first_name ASC;

--Yu can sort by columns not included in Select statement
SELECT first_name, last_name FROM customer
ORDER BY store_id DESC, first_name ASC;

--LIMIT Keyword
--Table ordered by payment date in ascending order
SELECT * FROM payment
ORDER BY payment_date;

--Table ordered by payment date in descending order
SELECT * FROM payment
ORDER BY payment_date DESC;

--To get the 5 most recent purchases in the payment table, we can use DESC and LIMIT
SELECT * FROM payment
ORDER BY payment_date DESC
LIMIT 5;

--To get the 5 most recent purchases in the payment table that have an amount more than 0, we can use DESC and LIMIT
SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

--ORDER BY, LIMIT Challenge 1
SELECT * FROM payment;
SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;

--ORDER BY, LIMIT Challenge 2
SELECT * FROM film;
SELECT title, length FROM film
ORDER BY length ASC
LIMIT 5;

--ORDER BY, LIMIT Bonus Challenge
SELECT * FROM film;
SELECT COUNT(title) FROM film
WHERE length <= 50;


--BETWEEN Keyword Operator
--Is Inclusive 
--Can use BETWEEN coupled with the WHERE clause to figure out between values in a range
--Can use BETWEEN coupled with the WHERE clause to figure out values not between a certain range (less than low point or greater than high point)
--Can use WHERE value BETWEEN 

--Practice with BETWEEN Operator in pgAdmin
SELECT * FROM payment
LIMIT 2;

--Gets the number of amounts between 8 and 9 dollars.
SELECT COUNT(amount) FROM payment
WHERE amount BETWEEN 8 AND 9;

--Gets the number of amounts not between 8 and 9 dollars.
SELECT COUNT(amount) FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

SELECT * FROM payment;

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

--IN - When combined with WHERE statement, it is like multiple OR statements to find out if one or more values is in a column
--NOT IN - Excludes everything within the parenthesis of the IN statement
SELECT * FROM payment
LIMIT 2;

--Values in amount column that are 0.99, 1.98, 1.99
SELECT * FROM payment
WHERE amount IN (0.99, 1.98, 1.99);

--Count of values in amount column that are 0.99, 1.98, 1.99
SELECT COUNT(*) FROM payment
WHERE amount IN (0.99, 1.98, 1.99);

--Count of values in amount column that are not 0.99, 1.98, 1.99
SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99);

--All of customer table
SELECT * FROM customer;

SELECT * FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie');

--Everyone but John, Jake, and Julie
SELECT * FROM customer
WHERE first_name NOT IN ('John', 'Jake', 'Julie');

--LIKE and ILIKE
--Selects names of customers whose first names start with J
SELECT * FROM customer
WHERE first_name LIKE 'J%';

--Selects names of customers whose first names start with J and last name starts with S
SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

--Using ILIKE for the same result but with a lower-case j and s
SELECT * FROM customer
WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%';

--Count of customers with a first name that starts with J
SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'J%';

--Count of customers whose first names start with J and last name starts with S
SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

--Selects customers with the letters her anywhere in their first name
SELECT * FROM customer
WHERE first_name LIKE '%her%';

--Selects customers whose first name consisting of letter her after a single charater in their name followed by any number of characters
SELECT * FROM customer
WHERE first_name LIKE '_her%';

--Gets the opposite of the query above due to the NOT operator
SELECT * FROM customer
WHERE first_name NOT LIKE '_her%';

--Gets first names starting with A
SELECT * FROM customer
WHERE first_name LIKE 'A%'
ORDER BY last_name;

--Gets first names starting with A, sorts alphabetically by last name, and removes last names that start with B
SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;

--General Challege 1
SELECT * FROM payment;

SELECT COUNT(amount) FROM payment
WHERE amount > 5.00;

SELECT * FROM actor;

SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';

SELECT * FROM address;

SELECT COUNT(DISTINCT district) FROM address;

SELECT DISTINCT district FROM address;

SELECT * FROM film;

SELECT COUNT(*) FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';

--GROUP BY
SELECT * FROM film;

SELECT MIN(replacement_cost) FROM film;

SELECT MAX(replacement_cost) FROM film;

SELECT COUNT(*) FROM film;

SELECT AVG(replacement_cost) FROM film;

SELECT ROUND(AVG(replacement_cost), 2) FROM film;


SELECT SUM(replacement_cost) FROM film;


SELECT * FROM payment;

--Same as selecting the DISTINCT customer_id
SELECT customer_id FROM payment
GROUP BY customer_id;

SELECT DISTINCT customer_id FROM payment;

SELECT customer_id FROM payment
GROUP BY customer_id
ORDER BY customer_id;

--Customer spending the most money
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

--Count of transactions
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC;

SELECT * FROM payment;


SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY customer_id, staff_id;

SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id;

SELECT staff_id, customer_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id;

SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id;

--Date Function
SELECT * FROM payment;

--Date function removes time stamp from date info
SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount);

SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;


--Group By Challenge
--Taking a look at payment table
SELECT * FROM payment;

SELECT staff_id, COUNT(amount) 
FROM payment
GROUP BY staff_id;

SELECT staff_id, COUNT(payment_id) 
FROM payment
GROUP BY staff_id;

SELECT rating, ROUND(AVG(replacement_cost), 2)
FROM film
GROUP BY rating;

SELECT * FROM payment;

SELECT customer_id, SUM(amount) 
FROM payment
GROUP BY customer_id 
ORDER BY SUM(amount) DESC
LIMIT 5;

--Having Clause - Filtering aggregate values
--Example:
--SELECT company, SUM(sales)
--FROM finance_table
--WHERE company != 'Google'
--GROUP BY company
--HAVING SUM(sales) > 1000


SELECT * FROM payment;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT store_id, COUNT(customer_id)
FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

--HAVING Clause Challenge
SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40;


SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;

--Ready for Assessment Test
--************************Review These
SELECT * FROM payment;

SELECT customer_id
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;


SELECT COUNT(*) FROM film
WHERE title ILIKE 'j%';

SELECT * FROM customer;

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;


-- AS Statement - Aliases
SELECT COUNT(*) AS num_transactions
FROM payment;

SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT customer_id, amount AS new_name
FROM payment
WHERE amount > 2;

--INNER JOIN
SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT * FROM payment AS p
INNER JOIN customer AS c
ON p.customer_id = c.customer_id;

SELECT * FROM payment
INNER JOIN customer
USING (customer_id)

SELECT payment_id, payment.customer_id, first_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

--FULL JOIN and FULL JOIN EXCLUDING NON-NULLS
SELECT * FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id;

SELECT * FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS NULL OR payment.payment_id IS NULL;
--The result is that every customer_id has a payment_id associated with it and every payment_id has a customer_id associated with it, which in this scenanario is what we want to find.

--LEFT JOIN
SELECT * FROM film;
SELECT * FROM inventory;

--Left join of film and inventory tables
SELECT film.film_id, title, inventory_id, store_id FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id;

--Films only in film table and not in inventory table based on matching column (film_id)
--This answers the question of 'Which films do we not have in inventory?' 
--This can count as a use case or might would be something requested as an ad-hoc query
SELECT film.film_id, title, inventory_id, store_id FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL;


--Only films that match between film table and inventory based on matching column (film_id)
--This answers the question of 'Which films do we have in inventory?'
--This can count as a use case or might would be something requested as an ad-hoc query
SELECT film.film_id, title, inventory_id, store_id FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NOT NULL;

--RIGHT JOIN
--Same as LEFT JOIN only the right join brings in everything from the right table and only
--The things in the left table that match the things in the right table
--Doesn't matter which join you choose becasue they do the same thing....either you are doing a --left join, which keeps everything in the left table and only what matches the left table from --the right or you are doing a right join, which keeps everything in the right table and only ---what matches the right table from the left. Also, it is up to you which table is the left and --the right. So you could do a left join but do it in reverse by creating the same table but ----making it a right join or you could do a left join again but make the original left table to --be the right and the original right table to be the left. Either way works. 

--UNION
--Columns have to match in every way (same amount and criteria)
--Takes the results of two select statements and pastes them directly on top of the another

--JOIN Challenge
SELECT * FROM address;
SELECT * FROM customer;

--Correct answer
SELECT district, email FROM customer
INNER JOIN address 
ON address.address_id = customer.address_id
WHERE district = 'California';

--My answer
SELECT district, email FROM customer
LEFT JOIN address 
ON customer.address_id = address.address_id
WHERE district ILIKE 'California';

--A LEFT JOIN coded as such will render the same result because I'm looking for emails based on --customer and using customer as the left table and address as the right. It would be incorrect 
--if it were looking for customers (right) based on emails (left). This is an example where the 
--order in asymmetrical joins (left or right) matter greatly, whereas the order in a 
--symmetrical join (inner) does not. 

-- The joining key code is in a different order that the correct answer, but that doesn't 
-- matter. It can be done either way and it is not wrong. 

--The reason for the ILIKE was to make sure I extracted all results of the word 'California' regardless of case.


SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM film_actor;

--Correct Answer
SELECT title, first_name, last_name
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';

-- My answer-same results
SELECT actor.first_name, actor.last_name, film.title FROM actor 
LEFT JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
LEFT JOIN film
ON film_actor.film_id = film.film_id
WHERE actor.first_name = 'Nick' and actor.last_name = 'Wahlberg';

-- I could have done without the table name followed by dot notation and column name where 
-- those were used because all columns were unique but it works all the same.

































