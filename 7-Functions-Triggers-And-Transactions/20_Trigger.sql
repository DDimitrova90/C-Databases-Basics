UPDATE UsersGames                    
SET Cash += 50000
WHERE UserId IN (SELECT Id 
                 FROM Users
				 WHERE Username IN ('baleremuda', 'loosenoise', 'inguinalself', 
				                    'buildingdeltoid', 'monoxidecos'))
AND GameId = (SELECT GameId 
              FROM Games 
			  WHERE Name = 'Bali')


CREATE PROC usp_SelectUsers
AS
  SELECT 
  ug.UserId,
  ug.Level AS UserLevel,
  ug.Cash,
  i.MinLevel AS MinLevelItem,
  i.Name AS ItemName,
  i.Price AS ItemPrice 
  FROM UsersGames AS ug
  INNER JOIN UserGameItems AS ugi
  ON ug.GameId = ugi.UserGameId
  INNER JOIN Items AS i
  ON ugi.ItemId = i.Id
  INNER JOIN Games AS g
  ON ug.GameId = g.Id
  INNER JOIN Users AS u
  ON ug.UserId = u.Id
  WHERE g.Name = 'Bali'
  AND u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 
				     'buildingdeltoid', 'monoxidecos')


BEGIN TRANSACTION
  DECLARE @minItemLevel INT;
  DECLARE @UserLevel INT;
  
  SET @minItemLevel = (SELECT 
                       i.MinLevel AS MinLevelItem
                       FROM UsersGames AS ug
                       INNER JOIN UserGameItems AS ugi
                       ON ug.GameId = ugi.UserGameId
                       INNER JOIN Items AS i
                       ON ugi.ItemId = i.Id
                       INNER JOIN Games AS g
                       ON ug.GameId = g.Id
                       INNER JOIN Users AS u
                       ON ug.UserId = u.Id
                       WHERE g.Name = 'Bali'
                       AND u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 
				                           'buildingdeltoid', 'monoxidecos'));

   SET @UserLevel = (SELECT 
                  ug.Level AS UserLevel
                  FROM UsersGames AS ug
                  INNER JOIN UserGameItems AS ugi
                  ON ug.GameId = ugi.UserGameId
                  INNER JOIN Items AS i
                  ON ugi.ItemId = i.Id
                  INNER JOIN Games AS g
                  ON ug.GameId = g.Id
                  INNER JOIN Users AS u
                  ON ug.UserId = u.Id
                  WHERE g.Name = 'Bali'
                  AND u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 
				                       'buildingdeltoid', 'monoxidecos'));

   IF (@UserLevel < @minItemLevel)
   BEGIN
      RAISERROR('The user does not have needed level!', 16, 1);
	  RETURN;
   END
   ELSE
   BEGIN
      DECLARE @itemPrice MONEY;
      SET @itemPrice = (SELECT 
                  i.Price AS ItemPrice
                  FROM UsersGames AS ug
                  INNER JOIN UserGameItems AS ugi
                  ON ug.GameId = ugi.UserGameId
                  INNER JOIN Items AS i
                  ON ugi.ItemId = i.Id
                  INNER JOIN Games AS g
                  ON ug.GameId = g.Id
                  INNER JOIN Users AS u
                  ON ug.UserId = u.Id
                  WHERE g.Name = 'Bali'
                  AND u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 
				                       'buildingdeltoid', 'monoxidecos'));

	UPDATE UsersGames
	SET Cash -= @itemPrice
	WHERE UserId IN (SELECT 
                     ug.UserId  
                     FROM UsersGames AS ug
                     INNER JOIN UserGameItems AS ugi
                     ON ug.GameId = ugi.UserGameId
                     INNER JOIN Items AS i
                     ON ugi.ItemId = i.Id
                     INNER JOIN Games AS g
                     ON ug.GameId = g.Id
                     INNER JOIN Users AS u
                     ON ug.UserId = u.Id
                     WHERE g.Name = 'Bali'
                     AND u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 
                     			     'buildingdeltoid', 'monoxidecos'))
    
   END

ROLLBACK

  






SELECT 
u.Username,
g.Name,
ug.Cash,
i.Name
FROM Users AS u
INNER JOIN UsersGames AS ug
ON u.Id = ug.UserId
INNER JOIN Games as g
ON ug.GameId = g.Id
INNER JOIN UserGameItems AS ugi
ON ug.GameId = ugi.UserGameId
INNER JOIN Items AS i
ON ugi.ItemId = i.Id
WHERE g.Name = 'Bali'