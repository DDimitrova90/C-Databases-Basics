CREATE FUNCTION ufn_CalculateFutureValue (@initialSum MONEY, @yearlyInterestRate FLOAT, @numberOfYears INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @futureValue MONEY = @initialSum * POWER((1 + @yearlyInterestRate), @numberOfYears);

	RETURN @futureValue;
END

SELECT
dbo.ufn_CalculateFutureValue(1000, 0.1, 5) AS FutureValue
