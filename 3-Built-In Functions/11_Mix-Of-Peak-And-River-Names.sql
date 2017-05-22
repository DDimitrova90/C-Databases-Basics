SELECT PeaKName, RiverName, 
LOWER(PeakName) + LOWER(SUBSTRING(RiverName, 2, LEN(RiverName) - 1)) AS Mix
FROM Peaks
INNER JOIN Rivers
ON RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix


/*
SELECT 
PeakName,
RiverName,
LOWER(PeakName + RIGHT(RiverName, LEN(RiverName) - 1)) AS Mix
FROM Rivers, Peaks
WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix
*/