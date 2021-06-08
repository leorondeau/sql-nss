
--Kristopher Blumfield an employee of Carnival has asked to be transferred to a 
--different dealership location. She is currently at dealership 9. She would like to work at dealership 20. 
--Update her record to reflect her transfer.

update dealershipemployees
set dealership_id = 20
where employee_id = 9;

--A Sales associate needs to update a sales record because her customer want to pay with a Mastercard instead of JCB. 
--Update Customer, Ernestus Abeau Sales record which has an invoice number of 9086714242

update sales
set payment_method = 'mastercard'
where invoice_number = '9086714242';