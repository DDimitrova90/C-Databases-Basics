CREATE PROC usp_EmployeesBySalaryLevel @levelOfSalay VARCHAR(7)
AS
   SELECT 
   e.FirstName AS [First Name],
   e.LastName AS [Last Name] 
   FROM Employees AS e
   WHERE @levelOfSalay = dbo.ufn_GetSalaryLevel(e.Salary)


EXECUTE usp_EmployeesBySalaryLevel 'High'


/* From video
CREATE PROC usp_EmployeesBySalaryLevel (@salaryLevel VARCHAR(10))
AS
BEGIN
    SELECT FirstName, LastName FROM Employees
	WHERE dbo.ufn_GetSalaryLevel(Salary) = @salaryLevel
END
*/