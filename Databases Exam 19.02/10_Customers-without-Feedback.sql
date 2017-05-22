SELECT 
CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
c.PhoneNumber,
c.Gender
FROM Customers AS c
WHERE c.Id NOT IN (SELECT f.CustomerId FROM Feedbacks AS f)
ORDER BY c.Id ASC