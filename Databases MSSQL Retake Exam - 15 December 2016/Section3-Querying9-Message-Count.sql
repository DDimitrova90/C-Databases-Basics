SELECT TOP 5 c.Id, COUNT(m.Id) AS TotalMessages 
FROM Chats AS c
RIGHT OUTER JOIN Messages AS m   
ON c.Id = m.ChatId                 
WHERE m.Id < 90
GROUP BY c.Id
ORDER BY TotalMessages DESC, c.Id ASC
