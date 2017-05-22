CREATE PROC usp_SubmitReview 
(@CustomerID INT, @ReviewContent VARCHAR(255), @ReviewGrade INT, @AirlineName VARCHAR(30))
AS
BEGIN
   IF (@AirlineName NOT IN (SELECT a.AirlineName FROM Airlines AS a))
   BEGIN
      RAISERROR('Airline does not exist.', 16, 1);
   END
   ELSE
   BEGIN
      DECLARE @ReviewId INT = (SELECT MAX(cr.ReviewID) FROM CustomerReviews AS cr) + 1;
	  DECLARE @AirlineId INT = (SELECT a.AirlineID FROM Airlines AS a WHERE a.AirlineName = @AirlineName);

	  IF (@ReviewId IS NULL)    
	  BEGIN
	     SET @ReviewId = 1;
	  END

      INSERT INTO CustomerReviews
	  VALUES (@ReviewId, @ReviewContent, @ReviewGrade, @AirlineId, @CustomerID)
   END
END