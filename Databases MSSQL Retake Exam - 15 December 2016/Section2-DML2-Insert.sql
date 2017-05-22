INSERT INTO Messages (Content, SentOn, ChatId, UserId)    -- между SELECT и FROM трябва да се изброят колоните
SELECT 
CONCAT(u.Age, '-', u.Gender, '-', l.Latitude, '-', l.Longitude),
CONVERT(DATE, GETDATE()),
CASE
WHEN u.Gender = 'M' THEN CEILING(POWER((u.Age / 18), 3))
WHEN u.Gender = 'F' THEN CEILING(SQRT(u.Age * 2))
END,
u.Id 
FROM Users AS u
INNER JOIN Locations AS l
ON u.LocationId = l.Id
WHERE u.Id BETWEEN 10 AND 20
		
