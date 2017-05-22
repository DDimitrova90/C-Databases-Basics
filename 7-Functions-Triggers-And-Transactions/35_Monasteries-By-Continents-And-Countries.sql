UPDATE Countries 
SET CountryName = 'Burma'
WHERE CountryName = 'Myanmar'

INSERT INTO Monasteries
VALUES ('Hanga Abbey', (SELECT c.CountryCode 
                        FROM Countries AS c
                        WHERE c.CountryName = 'Tanzania'))

INSERT INTO Monasteries
VALUES ('Myin-Tin-Daik', (SELECT c.CountryCode 
                        FROM Countries AS c
                        WHERE c.CountryName = 'Myanmar'))

SELECT 
con.ContinentName,
c.CountryName,
COUNT(m.Id) AS MonasteriesCount
FROM Continents AS con
LEFT OUTER JOIN Countries AS c
ON con.ContinentCode = c.ContinentCode
LEFT OUTER JOIN Monasteries AS m
ON c.CountryCode = m.CountryCode
WHERE c.IsDeleted = 0
GROUP BY con.ContinentName, c.CountryName
ORDER BY MonasteriesCount DESC, c.CountryName ASC