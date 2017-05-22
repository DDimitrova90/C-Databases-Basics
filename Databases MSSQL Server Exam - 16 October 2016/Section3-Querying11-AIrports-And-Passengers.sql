SELECT 
a.AirportID,
a.AirportName,
COUNT(t.TicketID) AS Passengers
FROM Airports AS a
INNER JOIN Flights AS f 
ON a.AirportID = f.OriginAirportID
INNER JOIN Tickets AS t
ON f.FlightID = t.FlightID
WHERE f.Status = 'Departing'
GROUP BY a.AirportID, a.AirportName
HAVING COUNT(t.TicketID) > 0
ORDER BY a.AirportID ASC