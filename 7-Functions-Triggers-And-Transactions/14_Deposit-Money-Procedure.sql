CREATE PROC usp_DepositMoney 
  @accountId INT,
  @moneyAmount Money
AS
BEGIN
   BEGIN TRANSACTION
     UPDATE Accounts
	 SET Balance += @moneyAmount
	 WHERE Id = @accountId
   COMMIT 
END

EXEC usp_DepositMoney 1, 400
