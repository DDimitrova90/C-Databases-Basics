CREATE PROC usp_WithdrawMoney
  @accountId INT,
  @moneyAmount MONEY
AS
BEGIN
   BEGIN TRANSACTION
       UPDATE Accounts
	   SET Balance -= @moneyAmount
	   WHERE Id = @accountId
   COMMIT
END