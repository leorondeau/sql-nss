/* 
Because Carnival is a single company, we want to ensure that there is consistency in the data provided to the user. 
Each dealership has it's own website but we want to make sure the website URL are consistent and easy to remember. 
Therefore, any time a new dealership is added or an existing dealership is updated, we want to ensure that the website
URL has the following format: http://www.carnivalcars.com/{name of the dealership with underscores separating words}. 
*/

CREATE OR REPLACE FUNCTION update_dealership_website()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
	AS
$$
BEGIN
	NEW.website := concat('http://www.carnivalcars.com/' , REPLACE(NEW.business_name, ' ', '_'));
		
	RETURN NEW;
END;
$$
--------Triggered
CREATE TRIGGER update_dealership
	BEFORE UPDATE OR INSERT
	ON dealerships
	FOR EACH ROW
	EXECUTE PROCEDURE update_dealership_website();
--------Before it inserts it should update to 'http://www.carnivalcars.com/New_Dealership_in_Music_City'
INSERT INTO dealerships(business_name, phone, city, state, website, tax_id)
VALUES ('New Dealership in Music City', '615-200-2000', 'Nashville', 'Tennessee', 'www.test.com', 'ab-200-2000');
--------Before it updates it should update to 'http://www.carnivalcars.com/Mildner_Autos_of_Louisiana'
UPDATE dealerships
SET city = 'Franklin'
WHERE dealership_id = 14;
--------Before it inserts it should update to 'http://www.carnivalcars.com/Test_New_Name'
UPDATE dealerships
SET business_name = 'Mildner Autos of Louisiana'
WHERE dealership_id = 14;