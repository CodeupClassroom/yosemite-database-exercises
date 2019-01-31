USE employees;

show tables;

describe salaries;
show create table salaries;

select * from salaries
limit 5;

# insert into salaries
# (emp_no, salary, from_date, to_date)
#     VALUES
#       (123, 365000, '1990-01-01', '2000-01-01');


# show create table dept_emp;
# show create table salaries;

select *
from salaries
where emp_no = 101010;

select *
from departments;

select * from dept_manager;

show tables;

describe salaries;

select employees.emp_no, employees.first_name,
  employees.last_name, salaries.salary,
  salaries.from_date, salaries.to_date,
  titles.title
from employees
join salaries on salaries.emp_no = employees.emp_no
join titles on titles.emp_no = employees.emp_no
where hire_date like '%-01-30';


select departments.dept_name, salaries.salary, employees.first_name, employees.emp_no
from departments
join dept_emp on dept_emp.dept_no = departments.dept_no
join employees on employees.emp_no = dept_emp.emp_no
join salaries on salaries.emp_no = employees.emp_no
where employees.hire_date like '%-01-30'
AND salaries.salary > 100000
ORDER BY salary DESC;

select *
from dept_manager;

# employees table to get the first and last name
# dept_manager is the table that associates emp_no with dept_no
# departments table to get the name of dept

# Get the dept_no and emp_no of all current managers
select e.first_name, e.last_name, d.dept_name
from dept_manager
join employees as e on e.emp_no = dept_manager.emp_no
join departments d on dept_manager.dept_no = d.dept_no
where to_date = '9999-01-01';
