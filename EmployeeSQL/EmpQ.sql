-- SQL queries challenge 
--------------------------------
-- 1 
-- Employees with salary 
SELECT E.emp_no, first_name, last_name, sex, Salary
FROM Employees  E
LEFT JOIN Salary S
ON E.emp_no = S.emp_no

-- 2
-- Employees hired in 1986
SELECT first_name, last_name, hiredate
From Employees E
where hiredate between '1/1/1986' and '12/31/1986'

-- 3
-- The managers of each department 
SELECT  D.dept_no, dept_name, E.emp_no, last_name, first_name
FROM Employees  E
JOIN Dept_manager DE ON E.emp_no = DE.emp_no
JOIN Department    D ON DE.manager = D.dept_no  

-- 3 refined
-- The managers of each department 
-- Showing only the current manager of each department 

SELECT  DD.dept_no, dept_name, E.emp_no, last_name, first_name
FROM	Employees    E
		JOIN Dept_manager DM ON E.emp_no  = DM.emp_no
		JOIN Department    D ON DM.manager = D.dept_no  
		join (
				SELECT DMH.Manager dept_no, MAX(HireDate) HireDate
				FROM Employees EE
					JOIN Dept_manager DMH ON EE.emp_no = DMH.emp_no
				group by DMH.Manager
				) DD on D.dept_no = DD.dept_no and E.HireDate = DD.HireDate
				
-- 4
-- Employees with Department Names
SELECT  E.emp_no, last_name, first_name, dept_name
FROM Employees  E
JOIN Dept_manager DE ON E.emp_no = DE.emp_no
JOIN Department    D ON DE.manager = D.dept_no  


-- 5
-- Employees named 'Hercules', last name starts with B
Select first_name, last_name, sex
from Employees
where first_name = 'Hercules' and last_name like 'B%'


-- 6
-- Where dept = '%Sales%'
SELECT  E.emp_no, last_name, first_name, dept_name
FROM Employees  E 
JOIN Dept_manager DE ON E.emp_no = DE.emp_no
JOIN Department    D ON DE.manager = D.dept_no  and D.dept_name = 'Sales'

-- 7 
-- Where dept = '%Sales%' or 'Development'
SELECT  E.emp_no, last_name, first_name, dept_name
FROM Employees  E 
JOIN Dept_manager DE ON E.emp_no = DE.emp_no
JOIN Department    D ON DE.manager = D.dept_no  and D.dept_name = 'Sales' or D.dept_name = 'Development'

-- 8 
-- Frequency count of employee last names in decending order 
Select last_name, Count(*) 
From Employees
group by last_name





