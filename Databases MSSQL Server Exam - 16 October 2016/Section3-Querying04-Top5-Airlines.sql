SELECT TOP 5 * FROM Airlines AS a
WHERE a.AirlineID IN (
                      SELECT f.AirlineID FROM Flights AS f
                     )
ORDER BY a.Rating DESC, a.AirlineID ASC