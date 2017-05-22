SELECT 
i.Name,
i.Price,
i.MinLevel,
s.Strength,
s.Defence,
s.Speed,
s.Luck,
s.Mind 
FROM Items AS i
INNER JOIN [dbo].[Statistics] AS s
ON i.StatisticId = s.Id
WHERE s.Mind > (SELECT AVG(Mind) FROM Items as i
                INNER JOIN [Statistics] AS s
				ON i.StatisticId = s.Id
				WHERE s.Id = i.StatisticId)
AND s.Luck > (SELECT AVG(Luck) FROM Items as i
                INNER JOIN [Statistics] AS s
				ON i.StatisticId = s.Id
				WHERE s.Id = i.StatisticId)
AND s.Speed > (SELECT AVG(Speed) FROM Items as i
                INNER JOIN [Statistics] AS s
				ON i.StatisticId = s.Id
				WHERE s.Id = i.StatisticId)
ORDER BY i.Name ASC 

