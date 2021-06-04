
--book chap 8
-- Write a query that shows the total purchase sales income per dealership.

select 
	d.business_name,
	sum(s.price) as purchases
from 
	dealerships d 
join 
	sales s ON s.dealership_id = d.dealership_id 
join 
	salestypes st using (sales_type_id)
where 
	st.name ='Purchase'
group by 
	d.business_name 
order by 
	purchases desc;

--Write a query that shows the purchase sales income per dealership for the current month.

select 
	d.business_name,
	sum(s.price) as purchases
from 
	dealerships d 
join 
	sales s ON s.dealership_id = d.dealership_id 
join 
	salestypes st using (sales_type_id)
where 
	st.name ='Purchase' and s.purchase_date > now() - interval '1 month'
group by 
	d.business_name 
order by 
	purchases desc;

--Write a query that shows the purchase sales income per dealership for the current year.
select 
	d.business_name,
	sum(s.price) as purchases
from 
	dealerships d 
join 
	sales s ON s.dealership_id = d.dealership_id 
join 
	salestypes st using (sales_type_id)
where 
	st.name ='Purchase' and s.purchase_date > now() - interval '1 year'
group by 
	d.business_name 
order by 
	purchases desc;

--Write a query that shows the total lease income per dealership

select 
	d.business_name,
	sum(s.price) as leases
from 
	dealerships d 
join 
	sales s ON s.dealership_id = d.dealership_id 
join 
	salestypes st using (sales_type_id)
where 
	st.name ='Lease'
group by 
	d.business_name 
order by 
	leases desc;

--Write a query that shows the lease income per dealership for the current month

select 
	d.business_name,
	sum(s.price) as leases
from 
	dealerships d 
join 
	sales s ON s.dealership_id = d.dealership_id 
join 
	salestypes st using (sales_type_id)
where 
	st.name ='Lease' and s.purchase_date > now() - interval '1 month'
group by 
	d.business_name 
order by 
	leases desc;

--Write a query that shows the purchase sales income per dealership for the current year.
select 
	d.business_name,
	sum(s.price) as leases
from 
	dealerships d 
join 
	sales s ON s.dealership_id = d.dealership_id 
join 
	salestypes st using (sales_type_id)
where 
	st.name ='Lease' and s.purchase_date > now() - interval '1 year'
group by 
	d.business_name 
order by 
	leases desc;

--Write a query that shows the total income (purchase and lease) per employee

select 	
	e.first_name||' '|| e.last_name as employee_name,
	sum(s.price) as total_sales_by_employee
from
	sales s 
join 
	employees e using (employee_id)
group by employee_name
order by total_sales_by_employee desc;








	