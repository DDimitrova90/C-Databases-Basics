SELECT
g.Name AS Game,
gt.Name AS [Game Type],  
u.Username,
ug.Level,
ug.Cash,
ch.Name AS Character
FROM Users AS u
INNER JOIN UsersGames AS ug
ON u.Id = ug.UserId
INNER JOIN Games AS g
ON ug.GameId = g.Id
INNER JOIN GameTypes AS gt
ON g.GameTypeId = gt.Id
INNER JOIN Characters AS ch
ON ch.Id = ug.CharacterId
ORDER BY ug.Level DESC, u.Username ASC, g.Name ASC