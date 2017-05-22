SELECT e.EmployeeID, 
e.FirstName,
p.Name AS ProjectName 
FROM Employees AS e
LEFT OUTER JOIN EmployeesProjects AS ep
ON e.EmployeeID = ep.EmployeeID
LEFT OUTER JOIN Projects AS p
ON ep.ProjectID = p.ProjectID
AND p.StartDate < '2005'   
WHERE ep.EmployeeID = 24

/*
SELECT 
e.EmployeeID,
e.FirstName,
CASE
WHEN p.StartDate < '2005-01-01' THEN p.Name
ELSE NULL
END AS ProjectName
FROM Employees AS e
INNER JOIN EmployeesProjects AS ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects AS p
ON ep.ProjectID = p.ProjectID
WHERE e.EmployeeID = 24
*/
