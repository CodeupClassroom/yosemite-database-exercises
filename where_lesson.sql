USE employees;

SELECT concat(first_name, " ", last_name) as "full name",
  birth_date, hire_date
FROM employees
WHERE birth_date like '%-01-29'
AND hire_date like '%-01-29';

SELECT *
FROM salaries
where salary BETWEEN 80000 AND 90000
AND from_date < '1990-01-01';

# AND limits results since we need ALL cases to be true
SELECT *
FROM employees
where first_name like '%ana%'
AND birth_date < '1955-01-01';

# Parentheses allow us to dictate order
# employees born before 1955 with "ana" in their first name
SELECT *
FROM employees
WHERE (first_name like '%ana%'
AND birth_date < '1955-01-01')
OR hire_date like '%-01-29';

# a single wildcard can be inside of a string
SELECT *
from employees
where first_name like '%r';

# WHERE IN syntax works kind of like an or
SELECT *
FROM employees
WHERE emp_no IN (10101, 20202, 30303, 12345, 12346);

SELECT *
FROM employees
WHERE hire_date IN ('1990-01-29', '1991-01-29');

SELECT *
FROM employees
WHERE hire_date IN ('1990-01-29', '1991-01-29')
OR last_name like '%ors%';

SELECT first_name, last_name
from employees
where emp_no in (
  select emp_no
  from salaries
  where salary > 100000
);
