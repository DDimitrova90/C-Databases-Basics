CREATE FUNCTION udf_GetRadians (@degrees FLOAT)
RETURNS FLOAT
AS
BEGIN
   DECLARE @radians FLOAT;
   SET @radians = (@degrees * PI()) / 180;
   RETURN @radians;
END

SELECT dbo.udf_GetRadians(22.12) AS Radians