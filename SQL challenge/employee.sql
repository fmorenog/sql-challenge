
-- CREATE TABLES SECTION


-- Create the first table called 'departments'
CREATE TABLE departments (
    dept_no varchar(10) NOT NULL PRIMARY KEY,
    dept_name varchar(50)
);



-- Create table called 'dept_emp'
CREATE TABLE dept_emp (
    emp_no int REFERENCES employees(emp_no),
    dept_no varchar(10) REFERENCES departments(dept_no)
);
*/


-- Create table called 'dept_manager'
CREATE TABLE dept_manager (
    dept_no varchar(10) REFERENCES departments(dept_no),
    emp_no int REFERENCES employees(emp_no)
);



-- Create table called 'employees'
CREATE TABLE employees (
  emp_no int NOT NULL PRIMARY KEY,
  emp_title_id varchar(10) NOT NULL REFERENCES titles(title_id),
	birth_date date,
	first_name varchar(50),
	last_name varchar(50),
	sex varchar(1),
	hire_date date
);



-- Create table called 'salaries'
CREATE TABLE salaries (
    emp_no int NOT NULL REFERENCES employees(emp_no),
    salary int
);



-- Create table called 'titles'
CREATE TABLE titles (
    title_id varchar(10) NOT NULL PRIMARY KEY,
    title varchar(50)
);



-- DATA ANALYSIS SECTION:

-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT * FROM employees

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-1-1' and '1986-12-31'
ORDER BY hire_date ASC


-- 3. List the manager of each department along with their department number,
-- department name, employee number, last name, and first name.

SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_manager dm
ON e.emp_no = dm.emp_no
JOIN departments d
ON dm.dept_no = d.dept_no


-- 4. List the department number for each employee along with that employee’s
-- employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no


-- 5. List first name, last name, and sex of each employee whose first name is Hercules
-- and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'


-- 6. List each employee in the Sales department, including their employee number,
-- last name, and first name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'


-- 7. List each employee in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')


-- 8. List the frequency counts, in descending order, of all the employee last names
-- (that is, how many employees share each last name).

SELECT last_name, COUNT(emp_no) AS shared_last_name
FROM employees
GROUP BY last_name
ORDER BY shared_last_name ASC
