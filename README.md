# SQL-Challenge
Pewlett Hackard Employee Analysis

Research data provided by Pewlett Hackard on employees from the 1980s and 90s, in 6 .csv files departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv and titles.csv. 

Evaluate raw data and establish relationships between files. 

### Model

First the data was modeled:  

![ERDPHEmpDB](https://user-images.githubusercontent.com/98897041/168600570-9383d8fa-df14-4ebb-9e94-1ecded7f2911.PNG)

### Engineer

All tables were assigned natural primary keys, 

Employees and Departments were identified as entity tables, as a result they were given primary keys.     
Dept_emp assigned a compund primary key as emp_no is not unique.  
Dept_manager assigned compound key as manager(dept_no) is not unique

Employee has a clear foreign key to Titles on emp_no.
<!-- Dept_emp is a cross reference table and it was assigned foreign keys to the two tables it references. note: this tables containes a column called manager which is dept_id, it was not renamed for this exercise. In practice, this column should be renamed to dept_no to conform with the dataset standards.  -->

Create the database and populate with data from the .csv files. Tables definition scirpt can be found DBTables.sql.

### Analysis

Employee Details:  A look at employees and salaries first ten shown below:  

![EmployeeSalary](https://user-images.githubusercontent.com/98897041/167205385-90d38805-1cd6-40d8-8fd8-a938b0fb1e21.PNG)

Employess hired in 1986: 

![Hiredin86](https://user-images.githubusercontent.com/98897041/167205736-b9e12693-4a14-408f-9081-4d4502b0e551.PNG)

Manager of each department: a view of the top ten reveals that there is more than 1 manager for each department. 

![DepartmentManagers](https://user-images.githubusercontent.com/98897041/167205952-458ec345-16eb-4d90-9600-2dfe57287db4.PNG)

Current Manager for each department: this query show the current manager for each department, using the assumption that the most recently hired employee is the current manager. note: this data refects employees fron the 80's and 90's, it is stale, the "current manager" is only current to the provided dataset. 

![CurrentManager](https://user-images.githubusercontent.com/98897041/167206312-eb4e0aa3-e628-484b-ab0c-49704a7c2c01.PNG)

Employee department name:

![EmployeeDepartmentName](https://user-images.githubusercontent.com/98897041/167206412-4cf6affd-7491-4f2b-8b13-da65339f6b86.PNG)

Employees with the first name Hercules whos last name also starts with a B:

![HerculesB](https://user-images.githubusercontent.com/98897041/167206585-4ac96591-7787-475e-8193-4c508fe2df1b.PNG)

All Employees in the Sales department:

![EmployeeSales](https://user-images.githubusercontent.com/98897041/167206690-7531edd7-c416-4aea-82e7-53b385dd1cc2.PNG)

All Employees in either the Sales or Developement departments:

![EmployeeSalesDevelopment](https://user-images.githubusercontent.com/98897041/167206835-907f38cf-05ea-4395-86fc-53071ff846d4.PNG)

Frequency of employees with last name in common:

![PotentialNepotism](https://user-images.githubusercontent.com/98897041/167207006-9eeb64dc-f3e3-49a5-a636-c742cbebfe4e.PNG)

There are definitely some irregularities in the data when it comes to the frequency of both first names and last names in our dataset. 

### Jupyter Notebook Analysis

Salary histogram: 

![image](https://user-images.githubusercontent.com/98897041/167207459-b5aea45c-473a-4a3f-94bf-6300993f172c.png)

Salary Analysis  
While it is not unusual for salary ranges to skew to the low range, the lack of any low range compensation seems suspicious. It is possible that this company has a policy of minimum salaries (like that attempted by Ben and Jerry's), which could explain this result. Question like why are there no salaries under $40,000 would need to be asked.
Note: These salary numbers reach back to the mid 80's and Ben and Jerry's minimum salary for 2020 was $37,710.40, and even this number falls below the lowest salary reported by our company.


Salary by Title 

![image](https://user-images.githubusercontent.com/98897041/167207670-fd530908-ac8c-4200-8cd5-f3715aec2997.png)

Salary by Title Analysis  
This is unlikely to be real data. The bar chart above shows that all job title with the word engineer in them have the same average salary. This is repeated for the staff roles. It is not resonable that a an assistant engineer would have a salary on par with a senior engineer. It is safe to say if this were to be an accurate dataset, the company in question needs to reevaluate its compensation policies.

