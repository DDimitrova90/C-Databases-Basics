CREATE VIEW V_EmployeeNameJobTitle AS
SELECT FirstName + ' ' + IsNULL(MiddleName, '') + ' ' + LastName AS FullName, JobTitle
FROM Employees