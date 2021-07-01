select
	*
FROM denormalizedvehicles  dv;
-- Planning Time: 5.477 ms
-- Execution Time: 5.076 ms






SELECT * from Employees WHERE employee_type_id = 1;
  explain analyze select * from Employees WHERE employee_type_id = 1;
  SELECT * from Sales WHERE dealership_id = 500;
  explain analyze SELECT * from Sales WHERE dealership_id = 500;
  SELECT * from customers WHERE state = 'CA';
  explain analyze SELECT * from customers WHERE state = 'CA';
  SELECT * from vehicles where year_of_car BETWEEN 2018 AND 2020;
  explain analyze SELECT * from vehicles where year_of_car BETWEEN 2018 AND 2020;
  SELECT * from vehicles where floor_price < 30000;
   explain analyze  SELECT * from vehicles where floor_price < 30000;
8:11
SELECT * from Sales WHERE dealership_id = 50;
  explain analyze SELECT * from Sales WHERE dealership_id = 50;