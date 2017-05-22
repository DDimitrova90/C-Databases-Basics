SELECT 
CASE
WHEN Age >= 0 AND Age <= 10 THEN '[0-10]'
WHEN Age >= 11 AND Age <= 20 THEN '[11-20]'
WHEN Age >= 21 AND Age <= 30 THEN '[21-30]'
WHEN Age >= 31 AND Age <= 40 THEN '[31-40]'
WHEN Age >= 41 AND Age <= 50 THEN '[41-50]'
WHEN Age >= 51 AND Age <= 60 THEN '[51-60]'
WHEN Age >= 61 THEN '[61+]'
END
AS AgeGroup,
COUNT(Id) AS WizardCount
FROM WizzardDeposits
GROUP BY 
CASE
WHEN Age >= 0 AND Age <= 10 THEN '[0-10]'
WHEN Age >= 11 AND Age <= 20 THEN '[11-20]'
WHEN Age >= 21 AND Age <= 30 THEN '[21-30]'
WHEN Age >= 31 AND Age <= 40 THEN '[31-40]'
WHEN Age >= 41 AND Age <= 50 THEN '[41-50]'
WHEN Age >= 51 AND Age <= 60 THEN '[51-60]'
WHEN Age >= 61 THEN '[61+]'
END

/*
SELECT w.Range AS AgeGroup, COUNT(*) AS WizardCount
FROM
(SELECT
CASE
WHEN Age >= 0 AND Age <= 10 THEN '[0-10]'
WHEN Age >= 11 AND Age <= 20 THEN '[11-20]'
WHEN Age >= 21 AND Age <= 30 THEN '[21-30]'
WHEN Age >= 31 AND Age <= 40 THEN '[31-40]'
WHEN Age >= 41 AND Age <= 50 THEN '[41-50]'
WHEN Age >= 51 AND Age <= 60 THEN '[51-60]'
WHEN Age >= 61 THEN '[61+]'
END AS Range FROM WizzardDeposits) w
GROUP BY w.Range
*/

-- from video
/*
SELECT ageGroups.AgeGroup, COUNT(*) AS WizardCount FROM 
(
SELECT
CASE
WHEN Age BETWEEN 0 AND 10 THEN '[0-10]'
WHEN Age BETWEEN 11 AND 20 THEN '[11-20]'
WHEN Age BETWEEN 21 AND 30 THEN '[21-30]'
WHEN Age BETWEEN 31 AND 40 THEN '[31-40]'
WHEN Age BETWEEN 41 AND 50 THEN '[41-50]'
WHEN Age BETWEEN 51 AND 60 THEN '[51-60]'
WHEN Age >= 61 THEN '[61+]'
END AS AgeGroup
FROM WizzardDeposits
) AS ageGroups
GROUP BY ageGroups.AgeGroup
*/
