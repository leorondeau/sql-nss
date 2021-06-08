--A sales employee at carnival creates a new sales record for a sale they are trying to close. 
--The customer, last minute decided not to purchase the vehicle. Help delete the Sales record with an 
--invoice number of '2436217483'.

delete from sales 
where invoice_number = '2436217483';

