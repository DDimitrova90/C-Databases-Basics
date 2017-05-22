SELECT Id, ChatId, UserId 
FROM Messages                                                  -- not my solution!!!! :(
WHERE (UserId NOT IN (
                      SELECT uc.UserId FROM UsersChats AS uc
                      INNER JOIN Messages AS m
					  ON uc.ChatId = m.ChatId
					  AND uc.UserId = m.UserId
					  WHERE m.ChatId = 17
					 )
OR UserId IS NULL)
AND ChatId = 17
ORDER BY Id DESC

