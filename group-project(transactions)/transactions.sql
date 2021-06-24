--Adding 5 brand new 2021 Honda CR-Vs to the inventory. They have I4 engines and are classified as a Crossover SUV or CUV. 
--All of them have beige interiors but the exterior colors are Lilac, Dark Red, Lime, Navy and Sand.
--The floor price is $21,755 and the MSR price is $18,999.

do $$
declare
	newvehicletype int;
	newmake int;
	newmodel int;
	newtypeid int;
begin
insert into vehiclebodytype(name)
values('CUV')
returning vehicle_body_type_id into newvehicletype;
insert into vehiclemake(name)
values('Honda')
returning vehicle_make_id into newmake;
insert into vehiclemodel(name)
values('CR-V')
returning vehicle_model_id into newmodel;
insert into vehicletypes(body_type_id, make_id, model_id)
values(newvehicletype, newmake, newmodel)
returning vehicle_type_id into newtypeid;
-- 1
insert into vehicles 
(vin, 
engine_type, 
vehicle_type_id, 
exterior_color, 
interior_color, 
floor_price, 
msr_price, 
miles_count, 
year_of_car, 
is_sold, is_new, 
dealership_location_id)
VALUES(
'3452345fea45dscv', 
'I4', 
newtypeid, 
'lilac', 
'beige', 
21755, 
18999, 
0, 
2021, 
false, 
true, 
4);
--2
insert into vehicles 
(vin, 
engine_type, 
vehicle_type_id, 
exterior_color, 
interior_color, 
floor_price, 
msr_price, 
miles_count, 
year_of_car, 
is_sold, is_new, 
dealership_location_id)
VALUES(
'345234sd5fea45dscv', 
'I4', 
newtypeid, 
'dark red', 
'beige', 
21755, 
18999, 
0, 
2021, 
false, 
true, 
4);
--3
insert into vehicles 
(vin, 
engine_type, 
vehicle_type_id, 
exterior_color, 
interior_color, 
floor_price, 
msr_price, 
miles_count, 
year_of_car, 
is_sold, is_new, 
dealership_location_id)
VALUES(
'234sd5fea45dscv', 
'I4', 
newtypeid, 
'lime', 
'beige', 
21755, 
18999, 
0, 
2021, 
false, 
true, 
4);
--4
insert into vehicles 
(vin, 
engine_type, 
vehicle_type_id, 
exterior_color, 
interior_color, 
floor_price, 
msr_price, 
miles_count, 
year_of_car, 
is_sold, is_new, 
dealership_location_id)
VALUES(
'ppfgzr0dsvmWKE', 
'I4', 
newtypeid, 
'navy', 
'beige', 
21755, 
18999, 
0, 
2021, 
false, 
true, 
4);
--5
insert into vehicles 
(vin, 
engine_type, 
vehicle_type_id, 
exterior_color, 
interior_color, 
floor_price, 
msr_price, 
miles_count, 
year_of_car, 
is_sold, is_new, 
dealership_location_id)
VALUES(
'Silasd5fea45dscv', 
'I4', 
newtypeid, 
'sand', 
'beige', 
21755, 
18999, 
0, 
2021, 
false, 
true, z
4);
end;
$$
language plpgsql;
select *
from vehicle