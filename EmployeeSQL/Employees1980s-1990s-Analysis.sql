-- Check imported tables
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- List the employee number, last name, first name, sex, and salary of each employee.
-- Perform a LEFT JOIN on the employees and salaries table for the requested columns
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s ON
e.emp_no=s.emp_no ;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31' ;

--List the manager of each department along with their \
--department number, department name, employee number, last name, and first name.
--Perform an INNER JOIN on the dept_manager and departments tables, and a LEFT JOIN on \
--the employees table for the requested columns.
SELECT dm.dept_no, dp.dept_name, dm.emp_no, e.last_name, e.first_name
FROM 
	(dept_manager AS dm INNER JOIN departments AS dp ON dm.dept_no=dp.dept_no)
	LEFT JOIN employees AS e ON dm.emp_no=e.emp_no ;

--List the department number for each employee along with that employee’s employee number, \
--last name, first name, and department name.
--Perform a LEFT JOIN on the employees and dept_emp tables, and a LEFT JOIN on \
--the departments table for the requested columns.
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, dp.dept_name
FROM
	(employees AS e LEFT JOIN dept_emp AS de ON e.emp_no=de.emp_no)
	LEFT JOIN departments AS dp ON de.dept_no=dp.dept_no ;

--List first name, last name, and sex of each employee whose first name is Hercules and whose \
--last name begins with the letter B.
--SELECT the requested columns from the employees table and filter with a WHERE clause.
--Use a wildcard to filter for last names that begin with B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%' ;

--List each employee in the Sales department, including their employee number, last name, and first name.
--Use subqueries to list the requested employees.
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name='Sales'
	)
) ;

--List each employee in the Sales and Development departments, including their employee number, \
--last name, first name, and department name.
--Perform a LEFT JOIN on the employees and dept_emp tables, and a LEFT JOIN on \
--the departments table for the requested columns. Then filter using WHERE.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM
	(employees AS e LEFT JOIN dept_emp AS de ON e.emp_no=de.emp_no)
	LEFT JOIN departments AS dp ON de.dept_no=dp.dept_no 
WHERE dp.dept_name='Sales' OR dp.dept_name='Development';

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
--GROUP BY last name and aggregate the last name count
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name 
ORDER BY frequency DESC;
