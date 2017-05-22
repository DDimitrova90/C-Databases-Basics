SELECT 
p.Name AS ProductName,
AVG(f.Rate) AS ProductAverageRate,
d.Name AS DistributorName,
c.Name AS DistributorCountry 
FROM Products AS p
INNER JOIN Feedbacks AS f
ON p.Id = f.ProductId
INNER JOIN ProductsIngredients AS ip
ON p.Id = ip.ProductId
INNER JOIN Ingredients AS i
ON ip.IngredientId = i.Id
INNER JOIN Distributors AS d
ON i.DistributorId = d.Id
INNER JOIN Countries AS c
ON d.CountryId = c.Id
WHERE p.Id IN
(SELECT temp.Id FROM 
(SELECT 
p.Id,
p.Name AS ProductName,
AVG(f.Rate) AS ProductAverageRate,
d.Name AS DistributorName,
c.Name AS DistributorCountry
FROM Products AS p
INNER JOIN Feedbacks AS f
ON p.Id = f.ProductId
INNER JOIN ProductsIngredients AS ip
ON p.Id = ip.ProductId
INNER JOIN Ingredients AS i
ON ip.IngredientId = i.Id
INNER JOIN Distributors AS d
ON i.DistributorId = d.Id
INNER JOIN Countries AS c
ON d.CountryId = c.Id
GROUP BY p.Id, p.Name, d.Name, c.Name) AS temp
GROUP BY temp.Id
HAVING COUNT(temp.DistributorName) = 1)
GROUP BY p.Id, p.Name, d.Name, c.Name
ORDER BY p.Id ASC