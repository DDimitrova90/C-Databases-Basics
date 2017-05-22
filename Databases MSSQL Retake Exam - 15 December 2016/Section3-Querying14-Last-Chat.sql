SELECT c.Title, m.Content FROM Chats AS c
LEFT OUTER JOIN Messages AS m
ON c.Id = m.ChatId
WHERE c.Id = (
              SELECT c.Id FROM Chats AS c
              WHERE c.StartDate = (SELECT MAX(StartDate) FROM Chats)
             )
AND (m.SentOn = (
                SELECT MIN(SentOn) FROM Messages
				WHERE ChatId = (
				                SELECT c.Id FROM Chats AS c
                                WHERE c.StartDate = (SELECT MAX(StartDate) FROM Chats)
				               )
               ) OR m.SentOn IS NULL)
