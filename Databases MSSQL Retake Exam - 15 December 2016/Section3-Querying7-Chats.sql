SELECT c.Title, c.IsActive 
FROM Chats AS c
WHERE (c.IsActive = 0 AND (LEN(c.Title) < 5) -- In requirement OR is bold!!!
OR (SUBSTRING(c.Title, 3, 2) = 'tl'))     
ORDER BY c.Title DESC

