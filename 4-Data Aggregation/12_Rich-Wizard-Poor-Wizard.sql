SELECT SUM(NewTable.SumDifference) AS SumDifference
FROM
(SELECT h.DepositAmount - (SELECT DepositAmount 
                             FROM WizzardDeposits 
							 WHERE Id = h.Id + 1) AS SumDifference  -- create new column
							 FROM WizzardDeposits h) AS NewTable    -- create new table

/*
var totalSum
var currentDeposit
var previousDeposit

while(there are deposits)
totalSum += previousDeposit - currentDeposit
*/

-- task with cursors
/*
DECLARE @currentDeposit DECIMAL(8,2)
DECLARE @previousDeposit DECIMAL(8,2)
DECLARE @totalSum DECIMAL(8,2) = 0

DECLARE wizardCursor CURSOR FOR SELECT DepositAmount FROM WizzardDeposits
OPEN wizardCursor
FETCH NEXT FROM wizardCursor INTO @currentDeposit

WHILE (@@FETCH_STATUS = 0)
BEGIN
  IF (@previousDeposit IS NOT NULL)
  BEGIN
    SET @totalSum += (@previousDeposit - @currentDeposit)
  END

  SET @previousDeposit = @currentDeposit
  FETCH NEXT FROM wizardCursor INTO @currentDeposit
END

CLOSE wizardCursor
DEALLOCATE wizardCursor


-- LEAD finds the next value, ànd LAG finds the previous one
SELECT @totalSum AS SumDifference
*/

/*
SELECT SUM(wizardDep.Difference) AS SumDifference FROM
(
  SELECT
  FirstName,
  DepositAmount,
  LEAD(FirstName) OVER (ORDER BY Id) AS GuestWizard,
  LEAD(DepositAmount) OVER (ORDER BY Id) AS GuestDeposit,
  DepositAmount - LEAD(DepositAmount) OVER (ORDER BY Id) AS Difference
  FROM WizzardDeposits
) AS wizardDep
*/

 