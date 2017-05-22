CREATE TABLE ArrivedFlights
(
FlightID INT,
ArrivalTime DATETIME NOT NULL,
Origin VARCHAR(50) NOT NULL,
Destination VARCHAR(50) NOT NULL,
Passengers INT NOT NULL,
CONSTRAINT PK_ArrivedFlights PRIMARY KEY (FlightID)
)

CREATE TRIGGER TR_Flights_Update 
ON Flights
FOR UPDATE
AS
BEGIN
     INSERT INTO ArrivedFlights
	 SELECT 
	 i.FlightID,
	 i.ArrivalTime,
	 a1.AirportName AS Origin,
	 a2.AirportName AS Destination,
	 (SELECT COUNT(t.TicketID) AS Passengers FROM Tickets AS t WHERE t.FlightID = i.FlightID)
	 FROM inserted AS i
	 INNER JOIN deleted AS d
	 ON i.FlightID = d.FlightID
	 INNER JOIN Airports AS a1
	 ON i.OriginAirportID = a1.AirportID
	 INNER JOIN Airports AS a2
	 ON i.DestinationAirportID = a2.AirportID
	 WHERE i.Status = 'Arrived'
	 AND d.Status <> 'Arrived'
END


-- не е мое решение
CREATE TRIGGER tr_LogArrivedFlight
ON Flights
AFTER UPDATE
AS
BEGIN
    INSERT INTO ArrivedFlights
        SELECT
            i.FlightID,
            i.ArrivalTime,
            (SELECT a.AirportName FROM Airports AS a WHERE a.AirportID = i.OriginAirportID) AS Origin,
            (SELECT a.AirportName FROM Airports AS a WHERE a.AirportID = i.DestinationAirportID) AS Destination,
            (SELECT COUNT(t.TicketID) FROM Flights AS f INNER JOIN Tickets AS t ON t.FlightID = f.FlightID AND f.FlightID = i.FlightID)
        FROM inserted AS i
        INNER JOIN deleted AS d ON d.FlightID = i.FlightID
        WHERE i.Status = 'Arrived' AND d.Status != 'Arrived'
END