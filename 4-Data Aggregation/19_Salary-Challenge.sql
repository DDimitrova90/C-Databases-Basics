SELECT TOP 10  e.FirstName, e.LastName, e.DepartmentID
FROM Employees AS e
JOIN
(SELECT e.DepartmentID, avg(e.Salary) AS avgs        -- not my solution!!!! with **
FROM Employees AS e
GROUP BY e.DepartmentID) AS avgSalaries
on e.DepartmentID = avgSalaries.DepartmentID
where e.Salary > avgSalaries.avgs
order by e.DepartmentID


-- Judge не го приема, решението е от видео
/*
SELECT FirstName, LastName, DepartmentID 
FROM Employees AS e
WHERE Salary > (
                 SELECT AVG(Salary) 
                 FROM Employees AS emp
                 WHERE e.DepartmentID = emp.DepartmentID
                 GROUP BY DepartmentID
               )
ORDER BY DepartmentID
*/