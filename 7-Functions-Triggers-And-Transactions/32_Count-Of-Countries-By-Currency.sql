SELECT
cur.CurrencyCode,
cur.Description AS Currency,
COUNT(c.CountryCode) AS NumberOfCountries  --���� LEFT JOIN, �� �� � ������� � ��������
FROM Currencies AS cur
LEFT OUTER JOIN Countries AS c
ON c.CurrencyCode = cur.CurrencyCode
GROUP BY cur.CurrencyCode, cur.Description
ORDER BY NumberOfCountries DESC, Currency ASC
