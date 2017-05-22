ALTER TABLE Users
ADD CONSTRAINT MinPasswordLength
CHECK (len(Password) >= 5)

