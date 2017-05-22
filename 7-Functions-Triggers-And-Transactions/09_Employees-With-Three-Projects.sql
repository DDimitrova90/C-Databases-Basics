CREATE PROC usp_AssignProject (@employeeId INT, @projectID INT)
AS
  BEGIN TRANSACTION

    INSERT INTO EmployeesProjects
    VALUES (@employeeId, @projectID);

    IF ((SELECT COUNT(*) 
         FROM EmployeesProjects
         WHERE EmployeeID = @employeeId) > 3)
    BEGIN
         ROLLBACK;
	     RAISERROR('The employee has too many projects!', 16, 1);   -- THROW 5000, 'some text', 1;
	     RETURN;
    END

  COMMIT

EXEC usp_AssignProject 2, 4