use employees;

-- use DISTINCT to find the unique titles in the titles table
select distinct title
from titles;

--find just the unique last names that start and end with 'E' using GROUP BY
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
group by last_name;


--find unique combinations of first and last name where the last name starts and ends with 'E'
SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'e%e'
group by last_name, first_name;

--Find the unique last names with a 'q' but not 'qu'
SELECT last_name
FROM employees
WHERE last_name like '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

--Add a COUNT() to your results and use ORDER BY
SELECT last_name, count(last_name)
FROM employees
WHERE last_name like '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY last_name;

--count(*) and GROUP BY to find the number of employees for each gender with those names. Y
SELECT count(*), gender
FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya'
GROUP BY gender;
