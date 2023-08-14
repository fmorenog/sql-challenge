
-- CREATE TABLES SECTION


-- Create table called 'titles'
CREATE TABLE titles (
    title_id varchar(10) NOT NULL PRIMARY KEY,
    title varchar(50)
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


-- Create the first table called 'departments'
CREATE TABLE departments (
    dept_no varchar(10) NOT NULL PRIMARY KEY,
    dept_name varchar(50)
);


-- Create table called 'dept_manager'
CREATE TABLE dept_manager (
    dept_no varchar(10) NOT NULL REFERENCES departments(dept_no),
    emp_no int REFERENCES employees(emp_no)
);


-- Create table called 'dept_emp'
CREATE TABLE dept_emp (
    emp_no int NOT NULL REFERENCES employees(emp_no),
    dept_no varchar(10) NOT NULL REFERENCES departments(dept_no)
);
*/


-- Create table called 'salaries'
CREATE TABLE salaries (
    emp_no int NOT NULL REFERENCES employees(emp_no),
    salary int
);