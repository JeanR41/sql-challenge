-- Create a departments table
CREATE TABLE departments (
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(200),
    PRIMARY KEY (dept_no)
);

--Create a titles table
CREATE TABLE titles (
	title_id VARCHAR(10) NOT NULL,
	title VARCHAR(200),
	PRIMARY KEY (title_id)
);

--Create an employees table
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(10),
	birth_date DATE,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	sex CHAR(1),
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

--Create a salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Create a dept_emp table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(10),
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create a dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(10),
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

--Check imported tables
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
