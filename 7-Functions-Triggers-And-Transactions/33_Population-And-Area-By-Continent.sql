SELECT 
con.ContinentName,
SUM(CONVERT(BIGINT, c.AreaInSqKm)) AS CountriesArea,       
SUM(CONVERT(BIGINT, c.Population)) AS CountriesPopulation
FROM Continents AS con
INNER JOIN Countries AS c
ON con.ContinentCode = c.ContinentCode
GROUP BY con.ContinentName
ORDER BY CountriesPopulation DESC