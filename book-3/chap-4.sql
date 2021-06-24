/* Selling a Vehicle
Carnival would like to create a stored procedure that handles the case of updating their vehicle inventory when a sale occurs. 
They plan to do this by flagging the vehicle as is_sold which is a field on the Vehicles table. When set to True this flag will 
indicate that the vehicle is no longer available in the inventory. Why not delete this vehicle? We don't want to delete it because 
it is attached to a sales record.

Returning a Vehicle
Carnival would also like to handle the case for when a car gets returned by a customer. When this occurs they must add the car back 
to the inventory and mark the original sales record as sale_returned = TRUE.

Carnival staff are required to do an oil change on the returned car before putting it back on the sales floor. In our stored procedure, 
we must also log the oil change within the OilChangeLogs table.

Goals
Use the story above and extract the requirements.
Build two stored procedures for Selling a car and Returning a car. Be ready to share with your class or instructor your result.
 */


CREATE or replace PROCEDURE return_sold_vehicle_to_inventory(in invoice_num varchar)
LANGUAGE plpgsql
AS $$
Begin
update vehicles 
set is_sold = false
where vehicle_id = (
	select s.vehicle_id 
	from sales s
	where s.invoice_number = invoice_num
);
update sales
set sale_returned = true
where invoice_number = invoice_num;
insert into oilchangelogs(date_occured, vehicle_id)
values(now(), (
	select s.vehicle_id 
	from sales s
	where s.invoice_number = invoice_num 
));
END
$$;

CALL return_sold_vehicle_to_inventory('1936644983');
select is_sold, sale_returned, o.* 
from sales s 
left join oilchangelogs o on s.vehicle_id = o.vehicle_id 
join vehicles v on v.vehicle_id = s.vehicle_id 
where s.invoice_number = '1936644983'