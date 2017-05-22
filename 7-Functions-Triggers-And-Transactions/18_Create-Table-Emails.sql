CREATE TABLE NotificationEmails
(
Id INT PRIMARY KEY IDENTITY,
Recipient INT NOT NULL,
Subject VARCHAR(50) NOT NULL,
Body VARCHAR(200) NOT NULL,
CONSTRAINT FK_NotificationEmails_Accounts
FOREIGN KEY (Recipient)
REFERENCES Accounts(Id)
)


CREATE TRIGGER tr_NotificationEmailsInsert ON Logs
AFTER INSERT
AS
BEGIN
  DECLARE @inserted INT;

  SELECT @inserted = (SELECT COUNT(*) FROM inserted);

  IF (@inserted > 0)
  BEGIN
      DECLARE @recipient INT;
	  DECLARE @oldSum MONEY;
	  DECLARE @newSum MONEY;

	  SELECT @recipient = AccountID FROM inserted
	  SELECT @oldSum = OldSum FROM inserted
	  SELECT @newSum = NewSum FROM inserted

	  INSERT INTO NotificationEmails
	  VALUES (@recipient, CONCAT('Balance change for account: ', @recipient), CONCAT('On ', GETDATE(), ' your balance was changed from ', @oldSum, ' to ', @newSum, '.'))
  END
END

  UPDATE Accounts
  SET Balance += 100
  WHERE Id = 1
