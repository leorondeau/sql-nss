--Chap 1 Exercises Query Fundamentals

--Write a query that returns the business name, city, state, and website for each dealership. 
--Use an alias for the Dealerships table.

SELECT 
	d.business_name,
	d.city,
	d.state,
	d.website
FROM
	dealerships d;

--Write a query that returns the first name, last name, and email address of every customer. 
--Use an alias for the Customers table.

SELECT
	c.first_name ||' '|| c.last_name AS customer_name,
	c.email
FROM
	customers c; 