SELECT * from Employees WHERE employee_type_id = 1;
 CREATE INDEX idx_employeeType ON Employees
(
   employee_type_id ASC
);
  explain analyze select * from Employees WHERE employee_type_id = 1;
  SELECT * from Sales WHERE dealership_id = 50;
  CREATE INDEX idx_dealershipID ON Sales
(
   dealership_id ASC
);
  explain analyze SELECT * from Sales WHERE dealership_id = 50;
  SELECT * from customers WHERE state = 'CA';
  CREATE INDEX idx_state ON customers
(
   state ASC
);
  explain analyze SELECT * from customers WHERE state = 'CA';
  SELECT * from vehicles where year_of_car BETWEEN 2018 AND 2020;
  CREATE INDEX idx_year_of_car ON vehicles
(
  year_of_car ASC
);
  explain analyze SELECT * from vehicles where year_of_car BETWEEN 2018 AND 2020;
  SELECT * from vehicles where floor_price < 30000;
  CREATE INDEX idx_floorPrice ON vehicles
(
  floor_price ASC
);
   explain analyze  SELECT * from vehicles where floor_price < 30000;