-- DATA ENGINEERING

-- create tables for each csv & import csv data then run the table
CREATE TABLE departments (
	dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);
SELECT * FROM departments

CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
	birth_date VARCHAR(11) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR(2) NOT NULL,
	hire_date VARCHAR(11) NOT NULL
);
SELECT * FROM employees

CREATE TABLE public.dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
	from_date VARCHAR(30) NOT NULL,
	to_date VARCHAR(30) NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES public.employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES public.departments(emp_no)
);
SELECT * FROM dept_emp

CREATE TABLE dept_manager (
	dept_no VARCHAR(5) NOT NULL,
	emp_no INT NOT NULL,
	from_date VARCHAR(11) NOT NULL,
	to_date VARCHAR(11) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES public.departments(emp_no)
);
SELECT * FROM dept_manager

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date VARCHAR(11) NOT NULL,
	to_date VARCHAR(11) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no)
);
SELECT * FROM salaries

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(30) NOT NULL,
	from_date VARCHAR(11) NOT NULL,
	to_date VARCHAR(11) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no)
);
SELECT * FROM titles