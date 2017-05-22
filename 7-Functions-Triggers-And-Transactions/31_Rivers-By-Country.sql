SELECT 
c.CountryName,
con.ContinentName,
COUNT(cr.RiverId) AS RiversCount,
CASE
WHEN SUM(r.Length) IS NULL THEN 0
ELSE SUM(r.Length)
END AS TotalLength
FROM Continents AS con
LEFT OUTER JOIN Countries AS c
ON con.ContinentCode = c.ContinentCode
LEFT OUTER JOIN CountriesRivers AS cr
ON c.CountryCode = cr.CountryCode
LEFT OUTER JOIN Rivers AS r
ON cr.RiverId = r.Id
GROUP BY c.CountryName, con.ContinentName
ORDER BY RiversCount DESC, TotalLength DESC, c.CountryName ASC