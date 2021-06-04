--Book 2 chap-4

--Produce a report that lists every dealership, 
--the number of purchases done by each, and the number of leases done by each.

select 
	d.business_name,
	COUNT(CASE WHEN st.name = 'Lease' then 1 END) AS sales_type_lease,
	COUNT(CASE WHEN st.name = 'Purchase' then 1 END) AS sales_type_purchase
FROM
	dealerships d 
LEFT JOIN
	sales s ON s.dealership_id = d.dealership_id 
JOIN
	salestypes st ON st.sales_type_id = s.sales_type_id
GROUP by 
	 d.business_name
ORDER by 
	d.business_name asc;

--Produce a report that determines the most popular vehicle model that is leased
select 
 vmo.name AS vehicle_model,
 SUM(case when st.name ='Lease' then 1 end) AS sales_type
FROM
	vehicle_model vmo 
JOIN
	vehicletypes vt ON vt.vehicle_model_id = vmo.vehicle_model_id 
JOIN 
	vehicles v ON v.vehicle_type_id = vt.vehicle_type_id 
JOIN
	sales s ON s.vehicle_id = v.vehicle_id 
JOIN 
	salestypes st ON st.sales_type_id =s.sales_type_id 
WHERE 
	st.name = 'Lease'
GROUP by 
	vmo.name, st.name
ORDER by
	sales_type desc Limit 1;


--What is the most popular vehicle make in terms of number of sales?


SELECT 
	vma.name AS vehicle_make,
	SUM(s.price) AS total_sales
FROM
	vehicle_make vma 
JOIN
	vehicletypes vt ON vt.vehicle_make_id = vma.vehicle_make_id 
JOIN 
	vehicles v ON v.vehicle_type_id = vt.vehicle_type_id 
JOIN
	sales s ON s.vehicle_id = v.vehicle_id 
JOIN 
	salestypes st ON st.sales_type_id =s.sales_type_id 
GROUP by 
	vma.name, s.price;

SELECT 
	vehicle_make, 
	MAX(total_sales) as totalSales 
FROM (
	SELECT 
		vma.name AS vehicle_make,
		SUM(s.price) AS total_sales
	FROM
		sales s 
	JOIN
		vehicles v ON s.vehicle_id = v.vehicle_id
	JOIN 
		salestypes st ON st.sales_type_id =s.sales_type_id 
	JOIN 
		vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id 
	JOIN
		vehicle_make vma ON vt.vehicle_make_id = vma.vehicle_make_id
	GROUP BY 
		vma.name) AS total_sales
	GROUP by total_sales, vehicle_make
	ORDER BY total_sales desc limit 1;



--Which employee type sold the most of that make?
select 
	employee_name, vehicle_make, MAX(total_sales)
FROM (
	SELECT 
		vma.name AS vehicle_make,
		SUM(s.price) AS total_sales,
		e.first_name||' '||e.last_name AS employee_name
	FROM
		sales s 
	JOIN
		employees e ON e.employee_id = s.employee_id 
	JOIN
		vehicles v ON s.vehicle_id = v.vehicle_id
	JOIN 
		salestypes st ON st.sales_type_id =s.sales_type_id 
	JOIN 
		vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id 
	JOIN
		vehicle_make vma ON vt.vehicle_make_id = vma.vehicle_make_id
	GROUP BY 
		vma.name, employee_name) AS total_sales
	where 
		vehicle_make = 'Nissan'
	GROUP BY total_sales.employee_name, total_sales.vehicle_make, total_sales.total_sales 
	ORDER BY total_sales desc limit 1;

--------------------------
select 
	employeetype, vehicle_make, MAX(total_sales)
FROM (
	SELECT 
		vma.name AS vehicle_make,
		SUM(s.price) AS total_sales,
		et.name as employeetype
	FROM
		sales s 
	JOIN
		employees e ON e.employee_id = s.employee_id 
	JOIN 
		employeetypes et ON et.employee_type_id = e.employee_type_id 
	JOIN
		vehicles v ON s.vehicle_id = v.vehicle_id
	JOIN 
		salestypes st ON st.sales_type_id =s.sales_type_id 
	JOIN 
		vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id 
	JOIN
		vehicle_make vma ON vt.vehicle_make_id = vma.vehicle_make_id
	GROUP BY 
		vma.name, employeetype) AS total_sales
	where 
		vehicle_make = 'Nissan'
	GROUP BY total_sales.employeetype, total_sales.vehicle_make, total_sales.total_sales 
	ORDER BY total_sales desc limit 1;
-----------------------------

SELECT
 total_sales_by_employee_make
FROM (
	select
		vma.name as vehicle_make,
		SUM(s.price) as total_sales,
		e.first_name || ' ' || e.last_name as employee_name
	from
		sales s
	join employees e on
		e.employee_id = s.employee_id
	join vehicles v on
		s.vehicle_id = v.vehicle_id
	join salestypes st on
		st.sales_type_id = s.sales_type_id
	join vehicletypes vt on
		v.vehicle_type_id = vt.vehicle_type_id
	join vehicle_make vma on
		vt.vehicle_make_id = vma.vehicle_make_id
	group by
		vma.name,
		employee_name) as total_sales_by_employee_make
where
	vehicle_make = (
	select
		vehicle_make
	from
		(
		select
			vma.name as vehicle_make,
			SUM(s.price) as total_sales
		from
			sales s
		join vehicles v on
			s.vehicle_id = v.vehicle_id
		join salestypes st on
			st.sales_type_id = s.sales_type_id
		join vehicletypes vt on
			v.vehicle_type_id = vt.vehicle_type_id
		join vehicle_make vma on
			vt.vehicle_make_id = vma.vehicle_make_id
		group by
			vma.name) as total_sales_of_make
	group by
		total_sales,
		vehicle_make
	order by
		total_sales desc
	limit 1)
group by vehicle_make, total_sales_by_employee_make
order by total_sales_by_employee_make desc limit 1;

------------------

	
	
