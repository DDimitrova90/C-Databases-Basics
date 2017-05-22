DELETE FROM Locations
WHERE Id IN (
             SELECT Id FROM Locations
             WHERE Id NOT IN (
                              SELECT Id FROM Locations
                              WHERE Id IN (SELECT LocationId FROM Users))
			)