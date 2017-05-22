CREATE PROC usp_GetEmployeesSalaryAbove35000
AS
   SELECT e.FirstName AS [First Name], e.LastName AS [Last Name] 
   FROM Employees AS e
   WHERE e.Salary > 35000
--GO

--EXEC usp_GetEmployeesSalaryAbove35000