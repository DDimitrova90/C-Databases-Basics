SELECT 
f.FlightID,
f.DepartureTime,
f.ArrivalTime,
a.AirportName AS Origin,
a1.AirportName AS Destination
FROM Flights AS f
INNER JOIN Airports AS a
ON f.OriginAirportID = a.AirportID
INNER JOIN Airports AS a1
ON f.DestinationAirportID = a1.AirportID
WHERE f.Status = 'Departing'
ORDER BY f.DepartureTime ASC, f.FlightID ASC
OFFSET (SELECT COUNT(*) FROM (SELECT f.FlightID, f.DepartureTime, f.ArrivalTime, a.AirportName AS Origin, a1.AirportName AS Destination
                      FROM Flights AS f
                      INNER JOIN Airports AS a
                      ON f.OriginAirportID = a.AirportID
                      INNER JOIN Airports AS a1
                      ON f.DestinationAirportID = a1.AirportID
                      WHERE f.Status = 'Departing') AS temp) - 5 ROWS
FETCH NEXT 5 ROWS ONLY