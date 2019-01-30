USE employees;

# Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
SELECT * FROM employees
WHERE first_name IN ('irena', 'vidya', 'maya');

# Find all employees whose last name starts with 'E' — 7,330 rows.
SELECT * FROM employees
WHERE last_name like 'E%';

# Find all employees hired in the 90s — 135,214 rows.
SELECT * FROM employees
WHERE hire_date like '199%';

# Find all employees hired in the 90s (use where between x and y)
SELECT * from employees
where hire_date between '1990-01-01' AND '1999-12-31';

# Find all employees born on Christmas — 842 rows.
SELECT * FROM employees
WHERE birth_date like '%-12-25';

# Find all employees with a 'q' in their last name — 1,873 rows.
SELECT * FROM employees
WHERE last_name like '%q%';

# Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
SELECT * FROM employees
WHERE first_name = 'vidya'
      or first_name = 'maya'
      or first_name = 'irena';

# Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
SELECT * FROM employees
WHERE first_name IN ('irena', 'vidya', 'maya')
AND gender = 'm';

# Find all employees whose last name starts or ends with 'E' — 30,723 rows.
SELECT * from employees
WHERE last_name like 'e%'
OR last_name like '%e';

# find all employees whose last name starts and ends with 'E' — 899 rows.
SELECT * from employees
where last_name like 'e%e';

# Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT * from employees
WHERE hire_date like '199%'
AND birth_date like '%-12-25';

# Find all employees with a q and without a qu
SELECT * from employees
where last_name like '%q%'
AND last_name not like '%qu%';