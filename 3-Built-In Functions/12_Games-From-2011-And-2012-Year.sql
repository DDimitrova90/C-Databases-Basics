SELECT TOP (50) Name, CONVERT(varchar(10), Start, 126)
FROM Games
WHERE DATEPART(year, Start) IN (2011, 2012)
ORDER BY Start, Name

/*
SELECT TOP (50) Name, FORMAT(Start, 'yyyy-MM-dd')
FROM Games
WHERE DATEPART(year, Start) IN (2011, 2012)
ORDER BY Start, Name
*/