USE employees;

--show each department along with the name of the current manager for that department
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees as e
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
JOIN departments as d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date > curdate()
ORDER BY d.dept_name;

--Find the name of all departments currently managed by women
SELECT  dept.dept_name AS 'Department Name', CONCAT(emp.first_name, ' ', emp.last_name) AS 'Manager Name'
FROM departments AS dept
JOIN dept_manager AS dm
  ON dept.dept_no = dm.dept_no
  -- still need to join to employees table