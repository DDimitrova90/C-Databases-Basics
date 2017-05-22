SELECT DepartmentID, 
(SELECT DISTINCT Salary         -- not my solution!!!!
   FROM Employees 
   WHERE DepartmentID = e.DepartmentID 
   ORDER BY Salary DESC 
   OFFSET 2 ROWS 
   FETCH NEXT 1 ROW ONLY) AS ThidHighestSalary
FROM Employees e
WHERE (SELECT DISTINCT Salary 
         FROM Employees 
		 WHERE DepartmentID = e.DepartmentID 
		 ORDER BY Salary DESC 
		 OFFSET 2 ROWS 
		 FETCH NEXT 1 ROW ONLY) IS NOT NULL
GROUP BY DepartmentID

-- със ранкиране!!!!
/*
SELECT Salaries.DepartmentID, Salaries.MaxSalary FROM
(
  SELECT 
  DepartmentID,
  MAX(Salary) AS MaxSalary, 
  DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS Rank
  FROM Employees
  GROUP BY DepartmentID, Salary
) AS Salaries
WHERE Rank = 3
*/
