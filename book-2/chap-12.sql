--Create a view that lists all vehicle body types, makes and models.

CREATE view vehicle_types as
select 
	vbt.name as body_type,
	vmo.name as model,
	vma.name as make
from
	vehicletypes v 
join vehicle_body_type vbt 
	ON vbt.vehicle_body_type_id = v.vehicle_body_type_id 
join 
	vehicle_model vmo 
	on v.vehicle_model_id = vmo.vehicle_model_id 
join 
	vehicle_make vma
	on vma.vehicle_make_id = v.vehicle_make_id;

--Create a view that shows the total number of employees for each employee type.

CREATE view total_employees_per_type as
select 
	et.name,
	count(e.employee_type_id) as total_employee_type
from 
	employeetypes et
join employees e
	on e.employee_type_id = et.employee_type_id
group by
	e.employee_type_id, et.name ; 
--Create a view that lists all customers without exposing their emails, phone numbers and street address.
--Create a view named sales2018 that shows the total number of sales for each sales type for the year 2018.
--Create a view that shows the employee at each dealership with the most number of sales.