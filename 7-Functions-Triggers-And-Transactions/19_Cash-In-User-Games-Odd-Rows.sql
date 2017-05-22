CREATE FUNCTION ufn_CashInUsersGames (@gameName VARCHAR(100))
RETURNS TABLE
AS
   RETURN (SELECT SUM(NumberedCashes.Cash) AS SumCash
	       FROM (SELECT
	             ug.GameId, 
	             ug.Cash,
	             ROW_NUMBER() OVER (ORDER BY ug.Cash DESC) AS Row
	             FROM UsersGames AS ug
		         INNER JOIN Games AS g
		         ON ug.GameId = g.Id
		         WHERE g.Name = @gameName) AS NumberedCashes
	       WHERE NumberedCashes.Row % 2 = 1)
