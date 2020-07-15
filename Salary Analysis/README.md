# Salary Analysis
Here you will find a Jupyter notebook file of an analysis of the data on salaries. I was able to do a query of the data that included the title, employee, and salary for each row. By importing this data with Pandas, I was able to group the data by title and create a bar chart to compare salaries by title. There is also a histogram of the data that looks at the frequency of each salary. 

## SQL Query
SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Salaries.salary, Departments.dept_name, Titles.title
FROM Titles INNER JOIN (Departments INNER JOIN ((Employees INNER JOIN Salaries ON Employees.emp_no = Salaries.emp_no) INNER JOIN Dept_emp ON (Salaries.emp_no = Dept_emp.emp_no) AND (Employees.emp_no = Dept_emp.emp_no)) ON Departments.dept_no = Dept_emp.dept_no) ON Titles.[title_id] = Employees.emp_title_id
GROUP BY Employees.emp_no, Employees.first_name, Employees.last_name, Salaries.salary, Departments.dept_name, Titles.title;



## Conclusions
You will see that despite the title, most salaries are relatively the same, meaning that this data may not be realistic for a true company. The distribution of the salaries is mostly around 40,000 per person, demonstrating why each position was paid relatively the same. 