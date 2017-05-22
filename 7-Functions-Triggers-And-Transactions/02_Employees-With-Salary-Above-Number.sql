CREATE PROC usp_GetEmployeesSalaryAboveNumber @number MONEY
AS
   SELECT 
   e.FirstName AS [First Name],
   e.LastName AS [Last Name] 
   FROM Employees AS e
   WHERE e.Salary >= @number

--EXECUTE usp_GetEmployeesSalaryAboveNumber 48100