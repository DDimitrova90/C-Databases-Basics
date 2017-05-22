CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT
AS
BEGIN
     DECLARE @result BIT;
	 DECLARE @startIndex INT = 1;
	 DECLARE @wordLen INT = LEN(@word);
	 
	 WHILE (@startIndex <= @wordLen)   
	 BEGIN
	      DECLARE @currentLetter VARCHAR(1) = SUBSTRING(@word, @startIndex, 1);

	      IF (CHARINDEX(@currentLetter, @setOfLetters) > 0)
		  BEGIN
		       SET @startIndex += 1;
			   SET @result = 1;
		  END
		  ELSE
		  BEGIN
		       SET @result = 0;
		       RETURN @result; 
		  END
	 END

	 RETURN @result;
END

CREATE TABLE Test
(
SetOfLetters VARCHAR(50),
Word VARCHAR(50)
)

INSERT INTO Test
VALUES ('oistmiahf', 'Sofia'),
       ('oistmiahf', 'halves'),
	   ('bobr', 'Rob'),
       ('pppp', 'Guy')

SELECT 
t.SetOfLetters,
t.Word,
dbo.ufn_IsWordComprised(t.SetOfLetters, t.Word) AS Result
FROM Test AS t



/* From video
CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT
AS
BEGIN
    DECLARE @length INT = LEN(@word);
	DECLARE @index INT = 1;

	WHILE(@index <= @length)
	BEGIN
	   DECLARE @char CHAR(1) = SUBSTRING(@word, @index, 1);

	   IF(CHARINDEX(@char, @setOfLetters) <= 0)
	   BEGIN
	      RETURN 0;
	   END

	   SET @index = @index + 1;
	END

	RETURN 1;
END
*/