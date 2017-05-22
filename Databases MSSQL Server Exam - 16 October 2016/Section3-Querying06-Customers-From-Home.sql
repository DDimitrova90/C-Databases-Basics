SELECT 
c.CustomerID,
c.FirstName + ' ' + c.LastName AS FullName,
twn.TownName AS HomeTown
FROM Customers AS c
INNER JOIN Tickets AS t
ON c.CustomerID = t.CustomerID
INNER JOIN Flights AS f
ON t.FlightID = f.FlightID
INNER JOIN Airports AS a
ON f.OriginAirportID = a.AirportID
INNER JOIN Towns AS twn
ON a.TownID = twn.TownID
WHERE c.HomeTownID = twn.TownID
AND f.Status = 'Departing'
ORDER BY c.CustomerID ASC


