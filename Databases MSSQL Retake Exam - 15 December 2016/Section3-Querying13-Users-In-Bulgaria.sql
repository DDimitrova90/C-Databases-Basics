SELECT u.Nickname, c.Title, l.Latitude, l.Longitude
FROM Users AS u 
LEFT OUTER JOIN Locations AS l 
ON u.LocationId = l.Id 
LEFT JOIN UsersChats AS uc 
ON uc.UserId = u.Id
LEFT OUTER JOIN Chats AS c
ON uc.ChatId = c.Id
WHERE l.Latitude BETWEEN 41.14 AND CAST(44.13 AS NUMERIC)   -- защо такаа?!?! 
AND l.Longitude BETWEEN 22.21 AND CAST(28.36 AS NUMERIC)
ORDER BY c.Title ASC