SELECT m.Content, m.SentOn FROM Messages AS m
WHERE m.SentOn > '2014-05-12'
AND CHARINDEX('just', m.Content) > 0
ORDER BY m.Id DESC