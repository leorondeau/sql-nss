-- Chap 2 Group Project 3

-- Who are the top 5 employees for generating sales income?
select 
e.first_name||' '||e.last_name as employee_name,
sum(s.price) as total_price
from
	employees e 
join
	sales s ON s.employee_id = e.employee_id 
where 
	s.sale_returned = false 
group by 
	e.employee_id 
order by 
	total_price desc limit 5;
;

-- Who are the top 5 dealership for generating sales income?
select 
	d.business_name,
	sum(s.price) as total_sales
from
	dealerships d 
join
	sales s
	ON s.dealership_id = d.dealership_id 
group by 
	s.dealership_id, d.business_name 
order by 
	total_sales desc limit 5;


-- Which vehicle model generated the most sales income?
select 
	vm.name as vehicle_model,
	sum(s.price) as total_sales
from
	sales s 
join 
	vehicles v 
	on s.vehicle_id = v.vehicle_id 
join 
	vehicletypes vt 
	on vt.vehicle_type_id  = v.vehicle_type_id 
join 
	vehicle_model vm 
	on vt.vehicle_model_id = vm.vehicle_model_id
where 
	 v.is_sold is true
group by 
	  vm.name
order by 
	total_sales desc limit 1;

	
--Which employees generate the most income per dealership?

select 
 e.first_name||' '|| e.last_name as employee_name,
 d.business_name ,
 sum(s.price) as total_sales,
 row_number() over (
 partition by d.business_name
 order by sum(s.price) desc) as sales_ranking
from
sales s 
join dealerships d 
	ON s.dealership_id = d.dealership_id 
join employees e 
	ON e.employee_id = s.employee_id 
group by 
	e.employee_id, d.dealership_id 
order by 
	d.business_name, total_sales desc;

select * from 
(
select 
 e.first_name||' '|| e.last_name as employee_name,
 d.business_name ,
 sum(s.price) as total_sales,
 row_number() over (
 partition by d.business_name
 order by sum(s.price) desc) as sales_ranking
from
sales s 
join dealerships d 
	ON s.dealership_id = d.dealership_id 
join employees e 
	ON e.employee_id = s.employee_id 
group by 
	e.employee_id, d.dealership_id 
order by 
	d.business_name, total_sales desc
) as sales_ranking
where sales_ranking = 1;

