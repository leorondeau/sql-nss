
--Kristopher Blumfield an employee of Carnival has asked to be transferred to a 
--different dealership location. She is currently at dealership 9. She would like to work at dealership 20. 
--Update her record to reflect her transfer.

update dealershipemployees
set dealership_id = 20
where employee_id = 9;