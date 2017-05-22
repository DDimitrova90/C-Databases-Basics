DECLARE @userGameId INT = (SELECT ug.Id FROM Users AS u
                       INNER JOIN UsersGames AS ug
			           ON u.Id = ug.UserId
			           INNER JOIN Games AS g
			           ON ug.GameId = g.Id
			           WHERE u.Username = 'Alex' AND g.Name = 'Edinburgh')

INSERT INTO UserGameItems
SELECT i.Id, @userGameId FROM Items AS i
                     WHERE i.Name IN ('Blackguard', 'Bottomless Potion of Amplification', 
					                  'Eye of Etlich (Diablo III)', 'Gem of Efficacious Toxin', 
									  'Golden Gorget of Leoric', 'Hellfire Amulet')

UPDATE UsersGames
SET Cash -= (SELECT SUM(i.Price) FROM Items AS i
             WHERE i.Name IN ('Blackguard', 'Bottomless Potion of Amplification', 
					          'Eye of Etlich (Diablo III)', 'Gem of Efficacious Toxin', 
						      'Golden Gorget of Leoric', 'Hellfire Amulet'))
WHERE Id = @userGameId

SELECT 
u.Username,
g.Name,
ug.Cash,
i.Name AS [Item Name]
FROM Users AS u
INNER JOIN UsersGames AS ug
ON u.Id = ug.UserId
INNER JOIN Games AS g
ON ug.GameId = g.Id
INNER JOIN UserGameItems AS ugi
ON ugi.UserGameId = ug.Id
INNER JOIN Items AS i
ON ugi.ItemId = i.Id
WHERE g.Name = 'Edinburgh'
ORDER BY i.Name ASC
