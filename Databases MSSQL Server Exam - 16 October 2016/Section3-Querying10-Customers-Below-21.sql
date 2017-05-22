SELECT 
DISTINCT c.CustomerID,
c.FirstName + ' ' + c.LastName AS FullName,  -- a client can fly more than one time, so we have to use DISTINCT
DATEDIFF(YEAR, c.DateOfBirth, '2016') AS Age
FROM Customers AS c
INNER JOIN Tickets AS t
ON c.CustomerID = t.CustomerID
INNER JOIN Flights AS f
ON t.FlightID = f.FlightID
WHERE DATEDIFF(YEAR, c.DateOfBirth, '2016') < 21
AND f.Status = 'Arrived'
ORDER BY Age DESC, c.CustomerID ASC

