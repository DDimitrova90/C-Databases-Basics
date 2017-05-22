SELECT TOP 5 c.CountryName, 
MAX(p.Elevation) as HighestPeakElevation, 
MAX(r.Length) AS LongestRiverLength
FROM Countries AS c
LEFT OUTER JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
LEFT OUTER JOIN Peaks AS p
ON mc.MountainId = p.MountainId
LEFT OUTER JOIN CountriesRivers AS cr
ON c.CountryCode = cr.CountryCode
LEFT OUTER JOIN Rivers AS r
ON cr.RiverId = r.Id
GROUP BY c.CountryName
ORDER BY MAX(p.Elevation) DESC, MAX(r.Length) DESC, c.CountryName ASC


SELECT TOP 5
c.CountryName,
MAX(p.Elevation) AS HighestPeakElevation,
MAX(r.Length) AS LongestRiverLength
FROM Countries AS c
LEFT OUTER JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
LEFT OUTER JOIN Peaks AS p
ON mc.MountainId = p.MountainId
LEFT OUTER JOIN CountriesRivers AS cr
ON c.CountryCode = cr.CountryCode
LEFT OUTER JOIN Rivers AS r
ON cr.RiverId = r.Id
GROUP BY c.CountryName
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, CountryName ASC