SELECT c.FirstName, c.Age, c.PhoneNumber
FROM Customers AS c
INNER JOIN Countries AS cnt
ON c.CountryId = cnt.Id
WHERE ((c.Age >= 21 AND CHARINDEX('an', c.FirstName) > 0)
OR RIGHT(c.PhoneNumber, 2) = '38')
AND cnt.Name <> 'Greece'
ORDER BY c.FirstName ASC, c.Age DESC