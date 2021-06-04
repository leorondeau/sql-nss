--book 2 chap 10

--How many employees are there for each role?

select 
	et.name as employee_role,
	count(e.employee_id) as employees_per_role
from 
	employees e 
join
	employeetypes et ON et.employee_type_id = e.employee_type_id
group by 
	et.employee_type_id;

--How many finance managers work at each dealership?

select 
	d.business_name as dealership, 
	count(et.name) as fm_per_dealership
from
	dealerships d 
join
	dealershipemployees de on de.dealership_id = d.dealership_id 
join 
	employees e on e.employee_id = de.employee_id 
join 
	employeetypes et on et.employee_type_id = e.employee_type_id
where 
	et.name = 'Finance Manager'
group by 
	dealership; 

--Get the names of the top 3 employees who work shifts at the most dealerships?
SELECT
	COUNT(d.dealership_id) AS no_dealerships_employee_works_at,
	e.first_name||' '||e.last_name AS employee_name
FROM
	employees e
JOIN
	dealershipemployees de ON e.employee_id = de.employee_id
JOIN
	dealerships d ON d.dealership_id = de.dealership_id
GROUP BY
	e.employee_id
ORDER BY COUNT(de.dealership_id) DESC limit 3;

--Get a report on the top two employees who has made the most sales through leasing vehicles.

SELECT
	e.first_name||' '||e.last_name as employee,
	COUNT (s.employee_id) as employee_sales
FROM
	sales s
JOIN
	employees e ON s.employee_id = e.employee_id
JOIN	
	salestypes st ON s.sales_type_id = st.sales_type_id
WHERE
	st.name = 'Lease'
GROUP BY employee
ORDER BY employee_sales DESC LIMIT 2;





