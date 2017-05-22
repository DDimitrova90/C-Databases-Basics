SELECT c.CountryCode, COUNT(m.MountainRange) AS MountainRanges
FROM Countries AS c
INNER JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
AND c.CountryName IN ('United States', 'Russia', 'Bulgaria')
INNER JOIN Mountains AS m
ON mc.MountainId = m.Id
GROUP BY c.CountryCode