CREATE FUNCTION ufn_GetSalaryLevel(@salary MONEY)
RETURNS VARCHAR(7)
AS
BEGIN
      DECLARE @salaryLevel VARCHAR(7);

	  IF(@salary < 30000)
	  BEGIN
	        SET @salaryLevel = 'Low';
	  END
	  ELSE IF (@salary BETWEEN 30000 AND 50000)
	  BEGIN
	        SET @salaryLevel = 'Average';
	  END
	  ELSE
	  BEGIN
	        SET @salaryLevel = 'High';
	  END

      RETURN @salaryLevel;
END

SELECT 
e.Salary, 
dbo.ufn_GetSalaryLevel(salary) AS [Salary Level]
FROM Employees AS e

/* from video
CREATE FUNCTION ufn_GetSalaryLevel(@salary MONEY)
RETURNS VARCHAR(10)
AS
BEGIN
     DECLARE @returnValue VARCHAR(10);

	 IF(@salary < 30000)
	 BEGIN
	     SET @returnValue = 'Low';
	 END
	 ELSE IF(@salary BETWEEN 30000 AND 50000)
	 BEGIN
	     SET @returnValue = 'Average';
	 END
	 ELSE IF(@salary > 50000)
	 BEGIN
	     SET @returnValue = 'High';
	 END

	 RETURN @returnValue;
END
*/