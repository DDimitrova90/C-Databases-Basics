SELECT DepositGroup
FROM WizzardDeposits
GROUP BY DepositGroup
HAVING AVG(MagicWandSize) <= (SELECT TOP (1) AVG(MagicWandSize) AS AverageWandSize 
                                FROM WizzardDeposits 
								GROUP BY DepositGroup 
								ORDER BY AverageWandSize)


/*
SELECT DepositGroup 
FROM WizzardDeposits
GROUP BY DepositGroup
HAVING AVG(MagicWandSize) = (
                            SELECT MIN(WizardAvgWandSizes.AvgMagicWandSize) 
                            FROM (
                                  SELECT DepositGroup, AVG(MagicWandSize) AS AvgMagicWandSize 
                                  FROM WizzardDeposits
                                  GROUP BY DepositGroup
                                 ) AS WizardAvgWandSizes 
                            )
*/


/*
SELECT TOP 1 WITH TIES DepositGroup   -- with ties връща и всички, равни на TOP 1  
FROM WizzardDeposits
GROUP BY DepositGroup
ORDER BY AVG(MagicWandSize)
*/

/*
SELECT DepositGoup
FROM WizzardDeposits
GROUP BY DepositGroup
HAVING AVG(MagicWandSize) =
  (SELECT TOP 1 AVG(MagicWandSize) AS mws
   FROM WIzzardDeposits
   GROUP BY DepositGroup
   ORDER BY AVG(MagicWandSize))
*/