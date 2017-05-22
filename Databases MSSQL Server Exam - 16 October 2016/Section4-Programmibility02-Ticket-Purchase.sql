CREATE PROC usp_PurchaseTicket
(@CustomerID INT, @FlightID INT, @TicketPrice DECIMAL(8,2), @Class VARCHAR(6), @Seat VARCHAR(5))
AS
BEGIN
    DECLARE @customerBalance DECIMAL(10,2) = (
	                                          SELECT cba.Balance FROM CustomerBankAccounts AS cba 
	                                          WHERE cba.CustomerID = @CustomerID
											 );
    IF (@customerBalance IS NULL)      -- може да го няма въобще в таблицата !!!
	BEGIN
	   SET @customerBalance = 0;
	END

	IF (@TicketPrice > @customerBalance)
	BEGIN
	    RAISERROR('Insufficient bank account balance for ticket purchase.', 16, 1);
	END
	ELSE
	BEGIN
	   DECLARE @ticketId INT = (SELECT MAX(t.TicketID) FROM Tickets AS t) + 1;

	   IF (@ticketId IS NULL)  -- тук може да проверявам дали COUNT-а е 0
	   BEGIN
	      SET @ticketId = 1;
	   END

	   INSERT INTO Tickets
	   VALUES (@ticketId, @TicketPrice, @Class, @Seat, @CustomerID, @FlightID)

	   UPDATE CustomerBankAccounts
	   SET Balance -= @TicketPrice
	   WHERE CustomerID = @CustomerID
	END
END