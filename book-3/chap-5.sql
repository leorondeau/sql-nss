/* Create a trigger for when a new Sales record is added, set the purchase date to 3 days from the current date. */

/* Create a trigger for updates to the Sales table. If the pickup date is on or before the purchase date, set the pickup 
date to 7 days after the purchase date. If the pickup date is after the purchase date but less than 7 days out from the 
purchase date, add 4 additional days to the pickup date. */

CREATE OR REPLACE FUNCTION update_purchase_date()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
	AS
$$
BEGIN
		IF NEW.pickup_date <= NEW.purchase_date THEN
			UPDATE sales
			SET pickup_date = NEW.purchase_date + integer '7'
			WHERE sales.sale_id = NEW.sale_id;
		ELSEIF NEW.pickup_date > NEW.purchase_date AND NEW.purchase_date - integer '7'  THEN
			UPDATE sales
			SET pickup_date = NEW.pickup_date + integer '4'
			WHERE sales.sale_id = NEW.sale_id;
		END IF;
		
		RETURN NEW;
END;
$$