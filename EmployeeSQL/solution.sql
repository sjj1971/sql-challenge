-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select emp_no, last_name, first_name, sex as gender, salaries.salary
from employees
join salaries
using (emp_no);

-- 2. List employees who were hired in 1986.
select * from employees
where hire_date like '%1986';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dept_no as "department number", departments.dept_name as "department name", emp_no as "manager employee number",
       employees.last_name as "last name", employees.first_name as "first name", employees.hire_date as "start employment dates" 
from dept_manager
join departments
using (dept_no)
join employees
using (emp_no);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select emp_no as "employee number", last_name, first_name, departments.dept_name as "department name"
from employees
join dept_emp
using(emp_no)
join departments
using(dept_no);

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where (first_name = 'Hercules') and (last_name like 'B%');

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp_no as "employee number", last_name, first_name, departments.dept_name as "department name"
from employees
join dept_emp
using(emp_no)
join departments
using(dept_no)
where departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp_no as "employee number", last_name, first_name, departments.dept_name as "department name"
from employees
join dept_emp
using(emp_no)
join departments
using(dept_no)
where departments.dept_name in ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "count of employee last names" from employees
group by last_name
order by count(last_name) desc;