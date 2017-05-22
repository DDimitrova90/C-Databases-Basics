SELECT TOP 1 * FROM
(SELECT AVG(Salary) AS MinAverageSalary FROM Employees
GROUP BY DepartmentID) AS a
ORDER BY a.MinAverageSalary
