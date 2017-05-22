CREATE PROC udp_SendMessage (@userId INT, @chatId INT, @content VARCHAR(200))
AS
BEGIN
   DECLARE @count INT = (
                         SELECT COUNT(*) FROM UsersChats AS uc   -- грешката ми беше, че търсих в Chats, а не в UsersChats
                         WHERE uc.UserId = @userId 
						 AND uc.ChatId = @chatId
						);

   IF (@count = 0)
   BEGIN
      RAISERROR('There is no chat with that user!', 16, 1);
   END
   ELSE
   BEGIN
      INSERT INTO Messages
	  VALUES (@content, CAST(GETDATE() AS DATE), @chatId, @userId)
   END
END

EXEC dbo.udp_SendMessage 19, 17, 'Awesome'

/*
CREATE PROCEDURE udp_SendMessage(@userId INT, @chatId INT, @content VARCHAR(250))
AS
BEGIN
    BEGIN TRAN
    INSERT INTO Messages(UserId,ChatId,Content,SentOn)
    VALUES(@userId,@chatId,@content,CONVERT(VARCHAR(10),GETDATE(),110))
    IF(@userId NOT IN (SELECT UserId FROM UsersChats WHERE ChatId = @chatId))
    BEGIN
	    ROLLBACK
        RAISERROR('There is no chat with that user!',16,1)
    END
    ELSE
    BEGIN
        COMMIT
    END
END
*/