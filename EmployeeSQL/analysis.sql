-- List the employee number, last name, 
-- first name, sex, and salary of each employee
SELECT E.ID AS EmployeeID, E.last_name, E.first_name, E.sex, S.amount AS salary
FROM Employee E JOIN Salary S ON E.ID = S.EmployeeID;

-- List the first name, last name, 
-- and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM Employee WHERE EXTRACT(year FROM hire_date) = 1986;

-- List the manager of each department along with their 
-- department number, department name, employee number, last name,
-- and first name
SELECT DM.DepartmentID, D.Name AS Dept_Name, DM.EmployeeID, E.last_name, E.first_name
FROM Dep_Manager DM JOIN Department D ON DM.DepartmentID = D.ID
	JOIN Employee E ON DM.EmployeeID = E.ID;

-- List the department number for each employee along with 
-- that employee’s employee number, last name, first name, 
-- and department name
SELECT DE.EmployeeID, DE.DepartmentID, D.Name AS Dept_Name, E.last_name, E.first_name
FROM Dep_Employee DE JOIN Department D ON DE.DepartmentID = D.ID
	JOIN Employee E ON DE.EmployeeID = E.ID;
	
-- List first name, last name, and sex of each employee whose 
-- first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex FROM Employee
WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including 
-- their employee number, last name, and first name
SELECT D.Name AS Dept_Name, E.ID AS EmployeeID, E.last_name, E.first_name 
FROM Dep_Employee DE JOIN Department D ON DE.DepartmentID = D.ID
	JOIN Employee E ON DE.EmployeeID = E.ID
WHERE D.Name='Sales';
	
-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and 
-- department name
SELECT D.Name AS Dept_Name, E.ID AS EmployeeID, E.last_name, E.first_name
FROM Dep_Employee DE JOIN Department D ON DE.DepartmentID = D.ID
	JOIN Employee E ON DE.EmployeeID = E.ID
WHERE D.Name='Sales' OR D.Name='Development';

-- List the frequency counts, in descending order, of all the 
-- employee last names (that is, how many employees share each
-- last name)
SELECT last_name, COUNT(last_name) FROM Employee
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;