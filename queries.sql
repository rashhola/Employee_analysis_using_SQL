SELECT *
FROM employee
 
-- --1. Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number

 
SELECT
  employee.emp_no,
  employee.last_name,
  employee.first_name,
  employee.sex,
  salaries.salary
FROM employee
JOIN salaries
ON employee.emp_no = salaries.emp_no  
ORDER BY employee.emp_no;
 
-- -- 2.Select the first name, last name, and hiring date for all employees hired in 1986

SELECT
  employee.first_name,
  employee.last_name,
  employee.hire_date
FROM employee
WHERE hire_date >= '1986-01-01' AND hire_date < '1986-12-31';


-- -- 3.Select the department number, department name, employee number, last name, and first name of all managers of each department

SELECT
  dept_manager.dept_no,
  departments.dept_name,
  employee.emp_no,
  employee.last_name,
  employee.first_name
FROM employee
JOIN dept_manager ON employee.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no;


-- -- 4. Select the employee number, last name, first name, and department of each employee, ordered by employee number
SELECT
  employee.emp_no,
  departments.dept_name,
  employee.first_name,
  employee.last_name
FROM employee
JOIN dept_emp ON employee.emp_no = dept_emp.emp_no 
JOIN departments ON departments.dept_no = dept_emp.dept_no
ORDER BY employee.emp_no;

-- -- 5. Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B" Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"

SELECT
  employee.first_name,
  employee.last_name,
  employee.birth_date,
  employee.sex
FROM employee
WHERE employee.first_name LIKE 'Hercules%' AND employee.last_name LIKE 'B%'
ORDER BY employee.emp_no;

-- -- 6...Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number

SELECT
  employee.emp_no,
  employee.first_name,
  employee.last_name,
  dept_emp.dept_no,
  departments.dept_name
FROM employee
JOIN dept_emp ON dept_emp.emp_no = employee.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
ORDER BY employee.emp_no;


-- -- 7.Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number
SELECT
  employee.emp_no,
  employee.first_name,
  employee.last_name,
  dept_emp.dept_no,
  departments.dept_name
FROM employee
JOIN dept_emp ON dept_emp.emp_no = employee.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY employee.emp_no;


-- -- 8.Count the number of employees, grouped by last name
SELECT 
employee.last_name,
COUNT(last_name) AS count_of_lastname
FROM employee
GROUP BY last_name;
 
