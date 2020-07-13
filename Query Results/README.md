## Query Results 

Here you will find the folder including all the results for the queries. 

Also, you can see the  SQL code that would be used to retrieve the data. 

# 1986 Employees
SELECT Employees.first_name, Employees.last_name, Employees.hire_date
FROM Employees
WHERE (((Employees.hire_date) Between #1/1/1986# And #12/31/1986#));


# Count of Last Names
SELECT Employees.last_name, Count(Employees.last_name) AS CountOflast_name
FROM Employees
GROUP BY Employees.last_name;


# Department Managers
SELECT Employees.last_name, Employees.first_name, Dept_manager.emp_no, Departments.dept_no, Departments.dept_name
FROM Departments INNER JOIN ((Employees INNER JOIN Dept_manager ON Employees.emp_no = Dept_manager.emp_no) INNER JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no) ON (Departments.dept_no = Dept_manager.dept_no) AND (Departments.dept_no = Dept_emp.dept_no);


# Employee Salaries
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees INNER JOIN Salaries ON Employees.emp_no = Salaries.emp_no;


# Employees and Department Names
SELECT Employees.last_name, Employees.first_name, Dept_manager.emp_no, Departments.dept_no, Departments.dept_name
FROM Departments INNER JOIN ((Employees INNER JOIN Dept_manager ON Employees.emp_no = Dept_manager.emp_no) INNER JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no) ON (Departments.dept_no = Dept_manager.dept_no) AND (Departments.dept_no = Dept_emp.dept_no);


# First Name Hercules with B as First Letter in Last Name
SELECT Employees.first_name, Employees.last_name, Employees.sex
FROM Employees
WHERE (((Employees.first_name)="Hercules") AND ((Employees.last_name) Like "B*"));


# Sales Department
SELECT Employees.last_name, Employees.first_name, Employees.emp_no, Departments.dept_name
FROM Departments INNER JOIN (Employees INNER JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no) ON Departments.dept_no = Dept_emp.dept_no
WHERE (((Departments.dept_name)="Sales"));


# Sales and Development Department Employees, Combined
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Departments INNER JOIN (Employees INNER JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no) ON Departments.dept_no = Dept_emp.dept_no
WHERE (((Departments.dept_name)="Sales" Or (Departments.dept_name)="Development"));

