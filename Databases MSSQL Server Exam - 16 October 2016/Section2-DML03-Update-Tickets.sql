UPDATE Tickets
SET Price += 0.5 * Price
WHERE FlightID IN (
                     SELECT f.FlightID 
					 FROM Flights AS f
                     WHERE f.AirlineID = (
                                          SELECT a.AirlineID 
					                      FROM Airlines AS a
                                          WHERE a.Rating = (SELECT MAX(Rating) FROM Airlines)
                                         )
					)