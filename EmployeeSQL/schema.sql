drop table dept_manager;
drop table salaries;
drop table dept_emp;
drop table employees;
drop table titles;
drop table departments;

-- define tables
create table departments(
	dept_no varchar(30) not null,
	dept_name varchar(30) not null,
	primary key (dept_no)
);

create table titles(
	title_id varchar(30) not null,
	title varchar(30) not null,
	primary key (title_id)
);

create table employees(
	emp_no integer not null,
	emp_title_id varchar(30) not null,
	foreign key (emp_title_id) references titles(title_id),
	birth_date varchar(30),
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex char(10),
	hire_date varchar(30) not null,
	primary key (emp_no)
);

create table dept_emp(
	emp_no integer not null,
	foreign key (emp_no) references employees(emp_no),
	dept_no varchar(30) not null,
	foreign key (dept_no) references departments(dept_no),
	primary key (emp_no, dept_no)
);

create table dept_manager(
	dept_no varchar(30) not null,
	foreign key (dept_no) references departments(dept_no),
	emp_no integer not null,
	foreign key (emp_no) references employees(emp_no)
);

create table salaries(
	emp_no integer not null,
	foreign key (emp_no) references employees(emp_no),
	salary integer not null
);

-- after importing csv files for tables

select * from departments
limit 5;

select * from titles
limit 5;

select * from employees
limit 5;

select * from dept_emp
limit 5;

select * from dept_manager
limit 5;

select * from salaries
limit 5;


