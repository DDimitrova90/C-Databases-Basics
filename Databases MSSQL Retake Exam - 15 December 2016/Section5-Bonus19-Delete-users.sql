CREATE TRIGGER TR_Users_Delete
ON Users INSTEAD OF DELETE
AS
BEGIN
   DELETE FROM UsersChats 
   WHERE UserId = (SELECT Id FROM deleted)

   DELETE FROM Messages
   WHERE UserId = (SELECT Id FROM deleted)

   UPDATE Users
   SET CredentialId = NULL
   WHERE Id = (SELECT Id FROM deleted)

   DELETE FROM Credentials
   WHERE Id = (SELECT CredentialId FROM deleted)

   DELETE FROM Users
   WHERE Id = (SELECT Id FROM deleted)
END

DELETE FROM Users
WHERE Users.Id = 1