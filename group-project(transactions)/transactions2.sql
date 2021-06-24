/* 
For the CX-5s and CX-9s in the inventory that have not been sold, change the year of the car to 2021 since we will be updating 
our stock of Mazdas. For all other unsold Mazdas, update the year to 2020. The newer Mazdas all have red and black interiors. 
*/

do $$
begin 
with all_cx_models as
(select v.vehicle_type_id 
from vehiclemodels vm
join vehicletypes vt on vm.vehicle_model_id = vt.vehicle_model_id 
join vehicles v on vt.vehicle_type_id = v.vehicle_type_id 
where vm.name like 'CX-5' or vm.name like 'CX-9')
update vehicles v
set year_of_car = 2021, interior_color = 'Red and Black'
where year_of_car = 2020 and is_sold = false and v.vehicle_type_id in (select * from all_cx_models);
update vehicles v 
set year_of_car = 2020
where year_of_car < 2020 and is_sold = false and v.vehicle_type_id in (select * from all_cx_models);
end;
$$ language plpgsql;


/* 
The vehicle with VIN KNDPB3A20D7558809 is about to be returned. Carnival has a pretty cool program where it offers the returned 
vehicle to the most recently hired employee at 70% of the cost it previously sold for. The most recent employee accepts this offer and 
will purchase the vehicle once it is returned. The employee and dealership who sold the car originally will be on the new sales transaction. 
*/

/*  
1. The vehicle with VIN KNDPB3A20D7558809 is about to be returned. Carnival has a pretty cool program where it offers the
returned vehicle to the most recently hired employee at 70% of the cost it previously sold for. The most recent employee 
accepts this offer and will purchase the vehicle once it is returned. 
The employee and dealership who sold the car originally will be on the new sales transaction.
*/
/*
Returned vehicle
most recently hired employee
employee and dealership who sold the car originally will be on the new sales transaction.
 */

do $$ 
declare
most_recent_hire_id int;
returned_vehicle_id int;
original_sale_id int;
customer_first_name varchar;
customer_last_name varchar;
customer_email_address varchar;
customer_phone varchar;
new_sale_employee_id int;
new_sale_dealership_id int;
new_customer_id int;
begin
select v.vehicle_id
from vehicles v 
join sales s on v.vehicle_id = s.vehicle_id
where v.vin = 'KNDPB3A20D7558809'
limit 1
into returned_vehicle_id;
select max(sale_id)
from sales s 
where vehicle_id = returned_vehicle_id
into original_sale_id;
update sales
set sale_returned = true 
where sale_id = original_sale_id;
update vehicles
set is_sold = false
where vehicle_id = returned_vehicle_id;
select max(employee_id)
from employees
into most_recent_hire_id;
select
first_name,
last_name,
email_address,
phone
from employees
where employee_id = (select max(employee_id)
from employees)
into customer_first_name,
customer_last_name,
customer_email_address,
customer_phone;
select employee_id, dealership_id
from sales
where vehicle_id = returned_vehicle_id
 order by purchase_date desc 
 limit 1
into 
new_sale_employee_id,
new_sale_dealership_id;
INSERT INTO customers
(first_name, last_name, email, street, city, state, zipcode, company_name, phone_number)
VALUES(customer_first_name, customer_last_name, customer_email_address, '123 sesame' , 'NY', 'NY', '55555', 'Carnival Big Yellow Bird', customer_phone)
returning customer_id into new_customer_id;
INSERT INTO sales
(sales_type_id, vehicle_id, employee_id, customer_id, dealership_id, price, deposit, purchase_date, pickup_date, invoice_number, payment_method, sale_returned)
VALUES(1, returned_vehicle_id, new_sale_employee_id, new_customer_id, new_sale_dealership_id, 65000, 5000, '2021-06-22', '2021-06-25', '123456789', 'mastercard', false);
end;
$$
language plpgsql;
select *
from customers c 
where c.customer_id = 1109;