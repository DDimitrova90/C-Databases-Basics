SELECT 
Username,                         
g.Name AS Game, 
MAX(c.Name) AS Character,
SUM(its.Strength) + MAX(chs.Strength) + MAX(gts.Strength) AS [Strength],
SUM(its.Defence) + MAX(chs.Defence) + MAX(gts.Defence) AS [Defence],
SUM(its.Speed) + MAX(chs.Speed) + MAX(gts.Speed) AS [Speed],
SUM(its.Mind) + MAX(chs.Mind) + MAX(gts.Mind) AS [Mind],
SUM(its.Luck) + MAX(chs.Luck) + MAX(gts.Luck) AS [Luck]
 FROM Users u
 LEFT JOIN UsersGames AS ug 
 ON ug.UserId =u.Id
 LEFT JOIN Games AS g 
 ON g.Id = ug.GameId
 LEFT JOIN GameTypes AS gt 
 ON g.GameTypeId = gt.Id
 LEFT JOIN UserGameItems AS ugi 
 ON ugi.UserGameId = ug.Id
 LEFT JOIN Items AS i 
 ON i.Id = ugi.ItemId
 LEFT JOIN Characters AS c 
 ON c.Id = ug.CharacterId
 LEFT JOIN [Statistics] AS chs 
 ON chs.Id = c.StatisticId
 LEFT JOIN [Statistics] AS gts 
 ON gts.Id = gt.BonusStatsId
 LEFT JOIN [Statistics] AS its 
 ON its.Id = i.StatisticId
 GROUP BY Username, g.Name
 ORDER BY Strength DESC, Defence DESC, Speed DESC, Mind DESC, Luck DESC