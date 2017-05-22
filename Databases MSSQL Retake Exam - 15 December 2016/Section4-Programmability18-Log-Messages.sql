CREATE TABLE MessageLogs
(
Id INT NOT NULL,
Content VARCHAR(200),
SentOn DATE,
ChatId INT,
UserId INT
)

CREATE TRIGGER TR_Messages_Delete
ON Messages AFTER DELETE
AS
BEGIN
  INSERT INTO MessageLogs
  SELECT * FROM deleted
END

DELETE FROM [Messages]
WHERE [Messages].Id = 1