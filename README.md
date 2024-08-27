# sql-challenge
Module 9 Challenge

For this project, I designed tables to hold the data from the given CSV files, imported the CSV files into a SQL database, and then answered questions about the data. The project is broken into 3 parts: data modeling, data engineering, and data analysis, respectively.

Files are numbered for easty reference. Follow my process through the steps below while viewing the files in the EmployeeSQL folder from 1 through 5.

Part 1: Data Modeling
    A. 1data-modeling.ipynb shows how the csv files were inspected for column names and data types.
    B. 2data-modeling-QuickDBD.txt is a record of the schema used in QuickDBD to generate the Entity Relationship Diagram (ERD).
    C. 3data-modeling-QuickDBD-diagram.png is the generated ERD.

Part 2: Data Engineering
    In 4Employees1980s-1990s.sql a table schemata was created for each of the CSV files. Each file was imported into its corresponding SQL table.

Part 3: Data Analysis
    In 5Employees1980s-1990s-Analysis.sql a query was written for each of the below questions:

    1. List the employee number, last name, first name, sex, and salary of each employee.

    2. List the first name, last name, and hire date for the employees who were hired in 1986.

    3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

    4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

    5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

    6. List each employee in the Sales department, including their employee number, last name, and first name.

    7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

    8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
    * I used this Stack Overflow page to help create a count of unique values. https://stackoverflow.com/questions/1521605/selecting-count-with-distinct