BEGIN TRANSACTION
  ALTER TABLE Employees
  DROP CONSTRAINT [FK_Employees_Employees]

  ALTER TABLE Departments
  DROP CONSTRAINT [FK_Departments_Employees]

  ALTER TABLE EmployeesProjects
  DROP CONSTRAINT [FK_EmployeesProjects_Employees]

  UPDATE Employees
  SET ManagerID = NULL
  WHERE ManagerID IN (SELECT e.EmployeeID FROM Employees AS e
                     INNER JOIN Departments AS d
					 ON e.DepartmentID = d.DepartmentID
					 WHERE d.Name IN ('Production', 'Production Control'))

  DELETE FROM Employees
  WHERE DepartmentID IN (SELECT d.DepartmentID FROM Employees AS e
                        INNER JOIN Departments AS d
						ON e.DepartmentID = d.DepartmentID
						WHERE d.Name IN ('Production', 'Production Control')
						GROUP BY d.DepartmentID)

  DELETE FROM Departments
  WHERE Name IN ('Production', 'Production Control')
ROLLBACK  -- трябва да е COMMIT


/*  от видеото
ALTER TABLE Departments
ALTER COLUMN ManagerId INT NULL

SELECT e.EmployeeID FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE d.Name IN ('Production', 'Production Control')

DELETE FROM EmployeesProjects
WHERE EmployeeID IN (
                     SELECT e.EmployeeID FROM Employees AS e
                     INNER JOIN Departments AS d
                     ON e.DepartmentID = d.DepartmentID
                     WHERE d.Name IN ('Production', 'Production Control')
					)

UPDATE Employees
SET ManagerID = NULL
WHERE ManagerID IN (
                     SELECT e.EmployeeID FROM Employees AS e
                     INNER JOIN Departments AS d
                     ON e.DepartmentID = d.DepartmentID
                     WHERE d.Name IN ('Production', 'Production Control')
					)

UPDATE Departments
SET ManagerID = NULL
WHERE ManagerID IN (
                     SELECT e.EmployeeID FROM Employees AS e
                     INNER JOIN Departments AS d
                     ON e.DepartmentID = d.DepartmentID
                     WHERE d.Name IN ('Production', 'Production Control')
					)

DELETE FROM Employees
WHERE EmployeeID IN (
                     SELECT e.EmployeeID FROM Employees AS e
                     INNER JOIN Departments AS d
                     ON e.DepartmentID = d.DepartmentID
                     WHERE d.Name IN ('Production', 'Production Control')
					)

DELETE FROM Departments
WHERE Name IN ('Production', 'Production Control')
*/