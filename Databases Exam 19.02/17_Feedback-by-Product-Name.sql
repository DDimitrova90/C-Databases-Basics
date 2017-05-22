CREATE FUNCTION udf_GetRating (@productName NVARCHAR(25))
RETURNS VARCHAR(10)
AS 
BEGIN
   DECLARE @avgRate DECIMAL(10, 2) = (SELECT AVG(f.Rate) AS avgRate
                                   FROM Products AS p
                                   INNER JOIN Feedbacks AS f
                                   ON p.Id = f.ProductId
                                   WHERE p.Name = @productName
                                   GROUP BY p.Id);
   DECLARE @result VARCHAR(10);

   IF (@avgRate < 5)
   BEGIN
       SET @result = 'Bad';
   END
   ELSE IF (@avgRate BETWEEN 5 AND 8)
   BEGIN
       SET @result = 'Average';
   END
   ELSE IF (@avgRate > 8) 
   BEGIN
       SET @result = 'Good';
   END
   ELSE
   BEGIN
       SET @result = 'No rating';
   END

   RETURN @result;
END


