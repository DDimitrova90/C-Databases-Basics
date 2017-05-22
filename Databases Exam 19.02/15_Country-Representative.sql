SELECT temp.CountryName, temp.DistributorName FROM
(SELECT 
c.Name AS CountryName,
d.Name AS DistributorName,
COUNT(i.Name) AS IngrNum,
DENSE_RANK() OVER (PARTITION BY c.Name ORDER BY COUNT(i.Name) DESC) AS Ranking
FROM Countries AS c
INNER JOIN Distributors AS d
ON c.Id = d.CountryId
INNER JOIN Ingredients AS i
ON d.Id = i.DistributorId
GROUP BY c.Name, d.Name) AS temp
WHERE temp.Ranking = 1
ORDER BY temp.CountryName ASC, temp.DistributorName ASC
