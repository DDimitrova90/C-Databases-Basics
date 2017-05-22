CREATE TABLE Flights
(
FlightID INT,
DepartureTime DATETIME NOT NULL,
ArrivalTime DATETIME NOT NULL,
Status VARCHAR(9),
OriginAirportID INT,
DestinationAirportID INT,
AirlineID INT,
CONSTRAINT PK_Flights PRIMARY KEY (FlightID),
CONSTRAINT CH_Status CHECK (Status IN ('Departing', 'Delayed', 'Arrived', 'Cancelled')),
CONSTRAINT FK_Flights_Airports_OriginAirportID 
FOREIGN KEY (OriginAirportID) REFERENCES Airports(AirportID),
CONSTRAINT FK_Flights_Airports_DestinationAirportID
FOREIGN KEY (DestinationAirportID) REFERENCES Airports(AirportID),
CONSTRAINT FK_Flights_Airlines
FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
)

CREATE TABLE Tickets
(
TicketID INT,
Price DECIMAL(8,2) NOT NULL,
Class VARCHAR(6),
Seat VARCHAR(5) NOT NULL,
CustomerID INT,
FlightID INT,
CONSTRAINT PK_Tickets PRIMARY KEY (TicketID),
CONSTRAINT CH_Class CHECK (Class IN ('First', 'Second', 'Third')),
CONSTRAINT FK_Tickets_Customers
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
CONSTRAINT FK_Tickets_Flights
FOREIGN KEY (FlightID) REFERENCES Flights (FlightID)
)