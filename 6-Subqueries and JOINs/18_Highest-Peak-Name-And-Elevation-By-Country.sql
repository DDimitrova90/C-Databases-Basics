SELECT TOP 5 RankedCoutries.CountryName AS Country,
CASE
WHEN RankedCoutries.PeakName IS NULL THEN '(no highest peak)'
ELSE RankedCoutries.PeakName
END AS HighestPeakName,
CASE
WHEN RankedCoutries.MaxPeak IS NULL THEN 0
ELSE RankedCoutries.MaxPeak
END AS HighestPeakElevation,
CASE
WHEN RankedCoutries.MountainRange IS NULL THEN '(no mountain)'
ELSE RankedCoutries.MountainRange
END AS Mountain
FROM
(SELECT c.CountryName, 
p.PeakName,
MAX(p.Elevation) AS MaxPeak,
m.MountainRange,
DENSE_RANK() OVER (PARTITION BY c.CountryName ORDER BY MAX(p.Elevation) DESC) AS Ranking
FROM Countries AS c
LEFT OUTER JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
LEFT OUTER JOIN Peaks AS p
ON mc.MountainId = p.MountainId
LEFT OUTER JOIN Mountains AS m
ON mc.MountainId = m.Id
GROUP BY c.CountryName, p.PeakName, m.MountainRange) AS RankedCoutries
WHERE RankedCoutries.Ranking = 1
ORDER BY Country ASC, HighestPeakName ASC
