SELECT i.Name, i.Description, i.OriginCountryId 
FROM Ingredients AS i
WHERE i.OriginCountryId IN (1, 10, 20)
ORDER BY i.Id ASC