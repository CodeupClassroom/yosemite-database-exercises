use employees;

# WHERE column1 IN (SELECT column1 FROM ...)
SELECT salary
from salaries
where emp_no in (101010, 202020, 202021);

SELECT salary
from salaries
where emp_no IN (
  select emp_no
  from employees
  where emp_no = 101010
  or emp_no = 202020
  or emp_no = 202021
);



# employee names for folks that are "staff"
# or engineer title
# SELECT first_name, last_name
# FROM employees
# WHERE emp_no IN (
#   SELECT emp_no
#   from titles
#   where title IN ("Staff", "Engineer")
# );

SELECT *
from salaries
WHERE emp_no IN (
  SELECT emp_no
  FROM dept_manager
  WHERE dept_manager.to_date > now()
)
AND salaries.to_date > now();

SELECT *
  FROM employees
  WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE hire_date like '%-01-31')
  AND emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE gender = "F"
  );

# get salaries of all engineers across all time
SELECT salary
from salaries
where emp_no IN (
  select emp_no
  from titles
  where title = "Engineer"
);

# get salaries of all engineers across all time
# This gets the same data as the subquery
SELECT salary
from salaries
join titles on titles.emp_no = salaries.emp_no
where title = "Engineer";


## Get the salary for current engineers with today as work anniversary
SELECT salary
from salaries
where emp_no IN (
  select emp_no
  from titles
  where title = "Engineer"
  AND to_date > now()
) AND to_date > now()
AND emp_no IN (
  SELECT emp_no
  from employees
  where hire_date like '%-01-31'
);


select first_name, last_name
from employees
where emp_no in (
  select emp_no
  from salaries
  where salary in (
    select max(salary)
    from salaries
  )
);




