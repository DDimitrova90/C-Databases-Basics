CREATE PROC usp_GetTownsStartingWith @firstLetter VARCHAR(MAX)
AS 
   SELECT t.Name AS Town 
   FROM Towns AS t
   WHERE LEFT(t.Name,LEN(@firstLetter)) = @firstLetter


--EXECUTE usp_GetTownsStartingWith 'b'