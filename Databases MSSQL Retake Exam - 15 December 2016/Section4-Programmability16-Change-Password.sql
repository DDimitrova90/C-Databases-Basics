CREATE PROC udp_ChangePassword (@email VARCHAR(30), @newPassword VARCHAR(20))
AS
BEGIN
   DECLARE @count INT = (
                         SELECT COUNT(*) FROM Credentials AS c
                         WHERE c.Email = @email
                        );	
    IF (@count = 0)
    BEGIN
	   RAISERROR('The email does''t exist!', 16, 1);
    END
	ELSE
	BEGIN
	   UPDATE Credentials
	   SET Password = @newPassword
	   WHERE Email = (
	                  SELECT Email FROM Credentials AS c
                      WHERE c.Email = @email
					 )
	END
END

SELECT * FROM Credentials
WHERE Email = 'abarnes0@sogou.com'

EXEC udp_ChangePassword 'abarnes0@sogou.com','new_pass'
