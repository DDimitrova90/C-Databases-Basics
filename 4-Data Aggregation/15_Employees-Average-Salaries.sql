SELECT *
INTO EmployeesSalaries   -- creating new table
FROM Employees
WHERE Salary > 30000

DELETE 
FROM EmployeesSalaries -- deleting some rows
WHERE ManagerID = 42

UPDATE EmployeesSalaries
SET Salary += 5000        -- updating column Salary
WHERE DepartmentID = 1

SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM EmployeesSalaries                              -- get average salary by department
GROUP BY DepartmentID