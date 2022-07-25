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


















