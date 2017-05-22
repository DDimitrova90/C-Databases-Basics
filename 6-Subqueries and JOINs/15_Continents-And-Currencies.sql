SELECT RankedCurrs.ContinentCode,
RankedCurrs.CurrencyCode,
RankedCurrs.CurrUs AS CurrencyUsage     -- my solution with little help :)
FROM
(SELECT 
c.ContinentCode,
c.CurrencyCode, 
COUNT(c.CurrencyCode) AS CurrUs,
DENSE_RANK() OVER (PARTITION BY c.ContinentCode ORDER BY COUNT(c.CurrencyCode) DESC) AS Ranking
FROM Countries AS c
GROUP BY c.ContinentCode, c.CurrencyCode) AS RankedCurrs
WHERE RankedCurrs.Ranking = 1
AND RankedCurrs.CurrUs > 1 
ORDER BY RankedCurrs.ContinentCode


/*
SELECT ContinentCode, CurrencyCode, CurrencyUsage FROM
(SELECT ContinentCode, CurrencyCode, CurrencyUsage, DENSE_RANK() OVER (PARTITION BY ContinentCode ORDER BY CurrencyUsage DESC) AS [Rank] FROM
(SELECT ContinentCode, CurrencyCode, COUNT(CountryCode) AS CurrencyUsage FROM Countries
GROUP BY ContinentCode, CurrencyCode
HAVING COUNT(CountryCode) > 1) AS cudata) as rankedcudata
WHERE [Rank] = 1
*/

/*      From the exercise video!!!
SELECT 
maxUsages.ContinentCode, 
usages.CurrencyCode, 
maxUsages.MaxUsage AS CurrencyUsage 
FROM
(
  SELECT usages.ContinentCode, MAX(usages.Usage) AS MaxUsage
  FROM
  (
    SELECT 
    ContinentCode, 
    CurrencyCode,
    COUNT(*) AS Usage
    FROM Countries AS c
    GROUP BY ContinentCode, CurrencyCode
  ) AS usages
  GROUP BY usages.ContinentCode
) AS maxUsages
INNER JOIN 
(
SELECT 
ContinentCode, 
CurrencyCode,
COUNT(*) AS Usage
FROM Countries AS c
GROUP BY ContinentCode, CurrencyCode
HAVING COUNT(*) > 1
) AS usages
ON maxUsages.ContinentCode = usages.ContinentCode
AND maxUsages.MaxUsage = usages.Usage
*/


