-- Practice: Adding new tables for Carnival
-- Use the Carnival ERD to identify the tables that are still missing in your database.

-- Which tables need to be created after reviewing the ERD?
-- What levels of normalization will these new tables be supporting?
-- Do any of these tables have a foreign key in another table? What is the child table that would hold the foreign key(s).
-- Practice: Running a data migration
-- What is a data migration? It is simply moving/changing your data from one location to another.

-- A data migration will need to take place for Carnival where we will convert text to integers. Since that is not a learning requirment at this point we are providing the SQL script for you to conduct this.

-- The result of the script will change all the text words to id integers. The important thing to note is that the data migration script does not change the datatype of these fields. You will be respnonsible for changing the datatype in the next practice below.

-- Review data migration SQL here

-- Practice: Altering a Table
-- With the addition of our new tables, Carnival is changing the way their data relates between tables, what needs to be done to the child table still?

-- What kind of changes need to take place to the child table and the data?
-- What potential problems arise in the child table now that we need to add the foreign keys?
-- Write and run the SQL statement(s) that are required to make these structural changes.

-- Fork 1
CREATE TABLE VehicleBodyTypes (
      vehicle_body_type_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      name VARCHAR (20)
);

CREATE TABLE VehicleMakes (
      vehicle_make_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      name VARCHAR (20)
);

CREATE TABLE VehicleModels (
      vehicle_model_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      name VARCHAR (20)
);


-- + import csvs



-- Fork 2
ALTER TABLE vehicleTypes
RENAME COLUMN body_type TO body_type_id;

ALTER TABLE vehicleTypes
RENAME COLUMN make TO make_id;

ALTER TABLE vehicleTypes
RENAME COLUMN model TO model_id;


ALTER TABLE vehicleTypes
ALTER COLUMN body_type_id TYPE INT USING body_type_id::integer,
ALTER COLUMN make_id TYPE INT USING make_id::integer,
ALTER COLUMN model_id TYPE INT USING model_id::integer;


-- Merge those forks
ALTER TABLE vehicleTypes
ADD CONSTRAINT constraint_fk_vehicle_body_type
FOREIGN KEY (body_type_id)
REFERENCES VehicleBodyTypes(vehicle_body_type_id);


ALTER TABLE vehicleTypes
ADD CONSTRAINT constraint_fk_vehicle_make
FOREIGN KEY (make_id)
REFERENCES VehicleMakes(vehicle_make_id);


ALTER TABLE vehicleTypes
ADD CONSTRAINT constraint_fk_3
FOREIGN KEY (model_id)
REFERENCES VehicleModels(vehicle_model_id);