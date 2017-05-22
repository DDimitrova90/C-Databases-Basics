SELECT TOP 1 WITH TIES
cnt.Name AS CountryName, 
AVG(f.Rate) AS FeedbackRate
FROM Countries AS cnt
INNER JOIN Customers AS c
ON cnt.Id = c.CountryId
INNER JOIN Feedbacks AS f
ON c.Id = f.CustomerId
GROUP BY cnt.Name
ORDER BY FeedbackRate DESC
