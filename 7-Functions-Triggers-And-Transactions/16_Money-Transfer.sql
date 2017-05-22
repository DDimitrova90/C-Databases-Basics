CREATE PROC usp_TransferMoney
  @senderId INT,
  @receiverId INT,
  @amount MONEY
AS
BEGIN
  BEGIN TRANSACTION
     IF ((SELECT Balance 
	     FROM Accounts
	     WHERE Id = @senderId) - @amount >= 0)
     BEGIN
	    UPDATE Accounts
		SET Balance += @amount
		WHERE Id = @receiverId

		UPDATE Accounts
		SET Balance -= @amount
		WHERE Id = @senderId

		-- or using procedures from two past problems
		-- EXEC usp_DepositMoney @receiverId, @amount;
		-- EXEC usp_WithdrawMoney @senderId, @amount;
	 END
	 ELSE
	 BEGIN
	   ROLLBACK;
	   RETURN;
	 END
  COMMIT    
END