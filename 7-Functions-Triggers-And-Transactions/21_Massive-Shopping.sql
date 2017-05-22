DECLARE @userGameId INT = (SELECT ug.Id 
                           FROM Users AS u
						   INNER JOIN UsersGames AS ug
						   ON u.Id = ug.UserId
						   INNER JOIN Games AS g
						   ON ug.GameId = g.Id
						   WHERE u.Username = 'Stamat'
						   AND g.Name = 'Safflower');

DECLARE @firstItemsPrice MONEY = (SELECT SUM(i.Price) 
                                  FROM Items AS i
								  WHERE i.MinLevel IN (11, 12));
DECLARE @userCash MONEY = (SELECT ug.Cash FROM Users AS u
                     INNER JOIN UsersGames AS ug
					 ON u.Id = ug.UserId
					 INNER JOIN Games AS g
					 ON ug.GameId = g.Id
					 WHERE u.Username = 'Stamat'
					 AND g.Name = 'Safflower');

BEGIN TRANSACTION
   IF (@userCash >= @firstItemsPrice)
   BEGIN
      UPDATE UsersGames
	  SET Cash -= @firstItemsPrice
	  WHERE Id = @userGameId

	  INSERT INTO UserGameItems
	  SELECT i.Id, @userGameId FROM Items AS i
	                        WHERE i.MinLevel IN (11, 12)
	  COMMIT
   END
   ELSE
   BEGIN
      ROLLBACK;  -- ј тук без RAISERROR и RETURN
   END
         -- тук б€х сложила COMMIT, а не горе в IF-а и не ставаше
DECLARE @secondItemsPrice MONEY = (SELECT SUM(i.Price) 
                                  FROM Items AS i
								  WHERE i.MinLevel IN (19, 20, 21));

BEGIN TRANSACTION
   IF (@userCash >= @secondItemsPrice)
   BEGIN
      UPDATE UsersGames
	  SET Cash -= @secondItemsPrice
	  WHERE Id = @userGameId

	  INSERT INTO UserGameItems
	  SELECT i.Id, @userGameId FROM Items AS i
	                        WHERE i.MinLevel IN (19, 20, 21)

	  COMMIT
   END
   ELSE
   BEGIN
      ROLLBACK;
   END

SELECT i.Name AS [Item Name] 
FROM Games AS g
INNER JOIN UsersGames AS ug
ON g.Id = ug.GameId
INNER JOIN UserGameItems AS ugi
ON ug.Id = ugi.UserGameId
INNER JOIN Items AS i
ON ugi.ItemId = i.Id
WHERE g.Name = 'Safflower'
ORDER BY [Item Name] ASC
