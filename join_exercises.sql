USE employees;

# --show each department along with the name of the current manager for that department
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees as e
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
JOIN departments as d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date > curdate()
ORDER BY d.dept_name;

# --Find the name of all departments currently managed by women
# departments table to obtain the department name
# employees table to obtain the employee's name
# dept_manager table is the associative table, has the relationships between manager and department
SELECT departments.dept_name as "Department Name",
  concat(employees.first_name, " ", employees.last_name) as "Manager Name"
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE to_date > now()
AND employees.gender = "F";

# Find the current titles of employees currently working in the Customer Service department.
# We need the titles table
# We need the dept_emp table b/c that's where the relationship data exists
# We need the departments table solely to isolate the dept_no of "Customer Service"
SELECT titles.title, count(*)
FROM titles
JOIN dept_emp ON titles.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date > now()
AND titles.to_date > now()
AND departments.dept_name = "Customer Service"
GROUP BY titles.title;

# Find the current salary of all current managers.
# salaries table to get salary numbers
# dept_manager table b/c it relates managers of departments
# departments table to get the department name
# employees table to get our names

SELECT departments.dept_name as "Department Name",
  concat(managers.first_name, ' ', managers.last_name) as "Name",
  salaries.salary as "Salary"
FROM employees as managers
JOIN dept_manager ON dept_manager.emp_no = managers.emp_no
JOIN salaries ON salaries.emp_no = managers.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE salaries.to_date > now()
AND dept_manager.to_date > now();


# Find the names of all current employees,
# their department name, and their current manager's name.
# Employee Name | Department Name  |  Manager Name
# --------------|------------------|-----------------
# Huan Lortz   | Customer Service | Yuchang Weedman
# employees table to get the employee first and last name
# dept_emp table to get the dept_no each employee works in
# departments table to get the dept_name
# dept_manager table to get emp_no of the manager
# managers table to get the emp_no of the manager

SELECT concat(employees.first_name, " ", employees.last_name) as "Employee Name",
  departments.dept_name as "Department Name",
  concat(managers.first_name, " ", managers.last_name) as "Manager Name"
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees AS managers
  ON managers.emp_no = dept_manager.emp_no
WHERE dept_emp.to_date > now()
AND dept_manager.to_date > now();

# department name, manager name, and how many reports
