CREATE PROC usp_SendFeedback
(@customerId INT, @productId INT, @rate DECIMAL(10,2), @description NVARCHAR(255))
AS 
BEGIN
	BEGIN TRANSACTION
	   INSERT INTO Feedbacks (Description, Rate, ProductId, CustomerId)
	   VALUES (@description, @rate, @productId, @customerId)

	   DECLARE @feedbackCount INT = (SELECT COUNT(f.Rate)
	                              FROM Feedbacks AS f
	                              WHERE f.CustomerId = @customerId
	                              AND f.ProductId = @productId
	                              GROUP BY f.CustomerId); 

	   IF (@feedbackCount > 3)
	   BEGIN
	      ROLLBACK;
		  RAISERROR('You are limited to only 3 feedbacks per product!', 16, 1);
		  RETURN;
	   END

    COMMIT
END