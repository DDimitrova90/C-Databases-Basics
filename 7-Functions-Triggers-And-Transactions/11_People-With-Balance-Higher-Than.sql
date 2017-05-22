CREATE PROC usp_GetHoldersWithBalanceHigherThan
  @number MONEY
AS
BEGIN
  SELECT 
  ah.FirstName AS [First Name],
  ah.LastName AS [Last Name] 
  FROM AccountHolders AS ah
  INNER JOIN Accounts AS a
  ON ah.Id = a.AccountHolderId
  GROUP BY ah.FirstName, ah.LastName
  HAVING SUM(a.Balance) > @number
END

EXECUTE usp_GetHoldersWithBalanceHigherThan 500000

/*   From video
CREATE PROC usp_GetHoldersWithBalanceHigherThan(@value MONEY)
AS 
BEGIN
    SELECT ah.FirstName, ah.LastName FROM AccountHolders AS ah
	LEFT JOIN Accounts AS a ON a.AccountHolderId = ah.Id
	GROUP BY FirstName, LastName
	HAVING SUM(a.Balance) > @value
END
*/