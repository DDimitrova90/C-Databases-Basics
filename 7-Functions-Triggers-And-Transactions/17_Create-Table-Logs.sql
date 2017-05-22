CREATE TABLE Logs
(
LogId INT PRIMARY KEY IDENTITY,
AccountId INT NOT NULL,
OldSum MONEY NOT NULL,
NewSum MONEY NOT NULL,
CONSTRAINT FK_Logs_Accounts
FOREIGN KEY (AccountId)
REFERENCES Accounts(Id)
)

CREATE TRIGGER tr_LogsInsert ON Accounts 
AFTER UPDATE
AS
BEGIN
   DECLARE @deleted INT;
   DECLARE @inserted INT;

   SET @deleted = (SELECT COUNT(*) FROM deleted);
   SET @inserted = (SELECT COUNT(*) FROM inserted);

   IF (@inserted = @deleted)
   BEGIN
    DECLARE @accountId INT
	DECLARE @oldSum MONEY
	DECLARE @newSum MONEY

	SELECT @accountId = AccountHolderId FROM deleted
	SELECT @oldSum = Balance FROM deleted
	SELECT @newSum = Balance FROM inserted

    INSERT INTO Logs
	VALUES (@accountId, @oldSum, @newSum)
	END
END


UPDATE Accounts
SET Balance -= 100
WHERE Id = 1


/*  от видеото 
CREATE TABLE Logs
(
LogId INT IDENTITY,
AccountId INT,
OldSum MONEY,
NewSum MONEY,
CONSTRAINT PK_Logs PRIMARY KEY (LogId),
CONSTRAINT FK_Logs_Accounts FOREIGN KEY (AccountId) 
REFERENCES Accounts(Id)
)

CREATE TRIGGER T_Accounts_After_Update 
ON Accounts AFTER UPDATE
AS
BEGIN
   INSERT INTO Logs (AccountId, OldSum, NewSum)
   SELECT i.Id, d.Balance, i.Balance FROM inserted AS i
   INNER JOIN deleted AS d ON d.Id = i.Id
END
*/