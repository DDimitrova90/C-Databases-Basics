SELECT 
p.PeakName,
m.MountainRange AS Mountain,
c.CountryName,
con.ContinentName
FROM Continents AS con
INNER JOIN Countries AS c
ON con.ContinentCode = c.ContinentCode
INNER JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
INNER JOIN Mountains AS m
ON mc.MountainId = m.Id
INNER JOIN Peaks AS p
ON m.Id = p.MountainId
ORDER BY p.PeakName ASC, c.CountryName ASC