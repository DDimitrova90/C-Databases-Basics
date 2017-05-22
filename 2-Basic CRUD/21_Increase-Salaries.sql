UPDATE Employees
SET Salary += Salary * 0.12
WHERE DepartmentID IN (1, 2, 4, 11)

/* moje i taka: 
 WHERE DepartmentId IN (SELECT DepartmentId 
                          FROM Departments 
                          WHERE Name IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services')) */

SELECT Salary FROM Employees

