drop table if exists Titles;
create table Titles(
	emp_title_id varchar(10) not null Primary key,
	title varchar(20) not null
);

Select * from Titles as T

drop table if exists Employees;
create table Employees(
	emp_no int Primary Key,
	emp_title_id varchar(10) not null,
	Foreign Key (emp_title_id) References Titles(emp_title_id),
	birth_date date,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	sex varchar(2) not null,
	hiredate date
);

Select * from Employees as E

drop table if exists Salary;
create table Salary(
	emp_no int,
	salary money
);
Select * from Salary as S

drop table if exists Dept_emp;
create table Dept_emp(
	emp_no int,
	dept_no varchar(10)
);
Select * from Dept_emp as DE

drop table if exists Department;
create table Department(
	dept_no varchar(10) Primary Key, 
	dept_name varchar(20)
);
Select * from Department as D

drop table if exists Dept_manager;
create table Dept_manager(
	manager varchar(10), 
	emp_no int
);
Select * from Dept_manager as DM