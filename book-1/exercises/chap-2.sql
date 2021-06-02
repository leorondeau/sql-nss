--Chap 2 Filtering

 --Get a list of sales records where the sale was a lease.

select 
	*
FROM 
	sales s 
JOIN 
	salestypes st ON st.sales_type_id = s.sales_type_id 
where 
	st.name = 'Lease';

--Get a list of sales where the purchase date is within the last two years.

SELECT 
	*
from 
	sales s
where 
	s.purchase_date > current_date - interval '2 years';
 
	
--Get a list of sales where the deposit was above 5000 or the customer payed with American Express.
SELECT 
	*
FROM 
	sales s 
where 
	s.deposit > 10000 OR s.payment_method iLIKE 'american%';

--Get a list of employees whose first names start with "M" or ends with "E".

SELECT *
from 
	employees e 
WHERE 
	e.first_name iLIKE 'M%' OR e.first_name ilike '%e';

--Get a list of employees whose phone numbers have the 604 area code.
SELECT
	*
FROM
	employees e
WHERE 
	e.phone ilike '604%';