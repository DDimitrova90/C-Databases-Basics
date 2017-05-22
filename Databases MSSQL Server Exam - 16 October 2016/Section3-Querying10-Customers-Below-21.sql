SELECT 
DISTINCT c.CustomerID,
c.FirstName + ' ' + c.LastName AS FullName,  -- може да има един клиент, който е лятал повече от един път и затова тр DISTINCT
DATEDIFF(YEAR, c.DateOfBirth, '2016') AS Age
FROM Customers AS c
INNER JOIN Tickets AS t
ON c.CustomerID = t.CustomerID
INNER JOIN Flights AS f
ON t.FlightID = f.FlightID
WHERE DATEDIFF(YEAR, c.DateOfBirth, '2016') < 21
AND f.Status = 'Arrived'
ORDER BY Age DESC, c.CustomerID ASC

