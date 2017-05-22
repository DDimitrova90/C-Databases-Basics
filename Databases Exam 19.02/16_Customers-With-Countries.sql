CREATE VIEW v_UserWithCountries
AS
SELECT 
CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
c.Age,
c.Gender,
cnt.Name AS CountryName
FROM Countries AS cnt
INNER JOIN Customers AS c
ON cnt.Id = c.CountryId

