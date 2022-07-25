--Test query for successful connection to database
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
SELECT DISTINCT(release_year) FROM film;

--Distinct rental rate from film table
SELECT * FROM film;
SELECT DISTINCT(rental_rate) FROM film;

--Challenge
SELECT * FROM film;
SELECT DISTINCT(rating) FROM film;














