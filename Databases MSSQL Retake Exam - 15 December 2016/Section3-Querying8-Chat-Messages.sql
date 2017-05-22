SELECT c.Id, c.Title, m.Id FROM Chats AS c
INNER JOIN Messages AS m
ON c.Id = m.ChatId
WHERE m.SentOn < '2012-03-26'
AND RIGHT(c.Title, 1) = 'x'
ORDER BY c.Id ASC, m.Id ASC
