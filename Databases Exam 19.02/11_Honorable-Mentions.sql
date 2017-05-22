SELECT 
f.ProductId,
CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
f.Description AS FeedbackDescription
FROM Customers AS c
INNER JOIN Feedbacks AS f
ON c.Id = f.CustomerId
WHERE c.Id IN (SELECT CustomerId FROM Feedbacks GROUP BY CustomerId HAVING COUNT(Id) >= 3) 
ORDER BY f.ProductId ASC, CustomerName ASC, f.Id ASC