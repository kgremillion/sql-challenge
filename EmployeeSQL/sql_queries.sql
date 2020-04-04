--DATA ANALYSIS

--1. list employee number, last name, first name, gender, and salary for each employee
SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.gender,
	salaries.salary
FROM employees 
JOIN salaries
ON employees.emp_no = salaries.emp_no

-- 2. list employees who were hired in 1986
SELECT emp_no, first_name, last_name, hire_date  
FROM employees
WHERE hire_date LIKE '1986%' ;

-- 3. List manager of each departments' department number, department name, employee number, last name, first name, and start and end employment dates
SELECT dept_manager.dept_no, 
	departments.dept_name, 
	employees.emp_no, 
	employees.first_name,
	employees.last_name,
	dept_manager.from_date,
	dept_manager.to_date
FROM departments 
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees 
ON employees.emp_no = dept_manager.emp_no;

-- 4. list each employee's employee number, last name, first name, and department name
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees 
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no;

-- 5. list all employees whose first name is "Hercules" and last names begin with "B"
SELECT first_name, last_name FROM employees
WHERE 
	first_name = 'Hercules' AND
	last_name LIKE 'B%' ;
	
-- 6. List all employees in the Sales department's employee number, last name, first name, and department name
SELECT departments.dept_name,
	employees.last_name,
	employees.first_name,
	employees.emp_no
FROM employees 
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no
WHERE 
 	departments.dept_name = 'Sales';
	
-- 7. list all employees in the Sales and Development departments' employee number, last name, first name, and department name
SELECT departments.dept_name,
	employees.last_name,
	employees.first_name,
	employees.emp_no
FROM employees 
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no
WHERE 
	departments.dept_name IN ('Sales', 'Development');
	
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, COUNT(last_name) AS "name count"
FROM employees
GROUP BY last_name
ORDER BY "name count" DESC;