SELECT u.Nickname, c.Email, c.Password 
FROM Credentials AS c
INNER JOIN Users AS u
ON u.CredentialId = c.Id
WHERE RIGHT(RTRIM(c.Email), 5) = 'co.uk'   -- WHERE c.Email LIKE '%co.uk'
ORDER BY c.Email ASC