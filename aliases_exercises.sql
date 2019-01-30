use employees;

--Return 10 employees in a result set named 'full_name' in the format of 'lastname, firstname' for each employee
SELECT concat(last_name, ', ', first_name) as full_name
from employees
limit 10;

-- Add the date of birth for each employee as 'DOB' to the query
SELECT concat(emp_no, ' - ', last_name, ', ', first_name) as full_name, birth_date as DOB
from employees
limit 10;

