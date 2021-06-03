--Book 2 Chap 3


--Get a list of the sales that were made for each sales type.

SELECT
 	 s.*, st.name
from 
	sales s
JOIN 
	salestypes st ON s.sales_type_id = st.sales_type_id
ORDER BY
	st.name;

--Get a list of sales with the VIN of the vehicle, the first name and last name of the customer, 
--first name and last name of the employee who made the sale and the name, city and state of the dealership.
SELECT 
	v.vin,
	c.first_name ||' '|| c.last_name AS customer_name,
	e.first_name ||' '|| e.last_name AS employee_name,
	d.business_name,
	d.city,
	d.state
FROM
	sales s 
JOIN
	vehicles v ON	v.vehicle_id = s.vehicle_id 
JOIN
	customers c ON c.customer_id = s.customer_id 
JOIN 
	employees e ON e.employee_id = e.employee_id 
join 
	dealerships d ON d.dealership_id = s.dealership_id;


--Get a list of all the dealerships and the employees, if any, working at each one.
SELECT 
	d.*,
	e.first_name ||' '|| e.last_name AS employee_name
FROM
	dealerships d 
LEFT JOIN
	dealershipemployees de ON de.dealership_id = d.dealership_id 
JOIN 
	employees e ON e.employee_id = de.employee_id
ORDER by 
	d.business_name desc;

--Get a list of vehicles with the names of the body type, make, model and color.
select 
	v.exterior_color,
	vbt.name AS body_type,
	vma.name AS make,
	vmo.name AS model
FROM
	vehicles v 
JOIN 
	vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
JOIN 
	vehicle_body_type vbt ON vbt.vehicle_body_type_id = vt.vehicle_body_type_id
join 
	vehicle_model vmo ON vmo.vehicle_model_id = vt.vehicle_model_id
join 
	vehicle_make vma ON vma.vehicle_make_id = vt.vehicle_make_id;
	
