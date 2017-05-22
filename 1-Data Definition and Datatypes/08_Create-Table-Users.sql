CREATE TABLE Users 
(
Id int NOT NULL IDENTITY PRIMARY KEY,
Username varchar(30) UNIQUE NOT NULL,
Password varchar(26) NOT NULL,
ProfilePicture varbinary(max),
LastLoginTime varchar(10),
IsDeleted varchar(5) CHECK (IsDeleted in ('true', 'false'))
)

-- Трябва да се добави ръчно, защото ограничението е в KB, а ако напишем varbinary(900) това са 900 байта!!!!
ALTER TABLE Users
ADD CONSTRAINT CH_PictureSize CHECK (DATALENGTH(ProfilePicture) <= 900 * 1024)

-- Така все едно си създаваме снимка
-- DECLARE @C VARCHAR(MAX) = '|'
-- @ProfilePicture VARBINARY(MAX) = CONVERT(VARBINARY(MAX), REPLICATE(@C, (921600)));
 
INSERT INTO Users
VALUES ('kiki', '123', NULL, '13:25 PM', 'false')

INSERT INTO Users
VALUES ('viki', '456', NULL, '10:59 PM', 'true')

INSERT INTO Users
VALUES ('miki', '789', NULL, '08:11 AM', 'false')

INSERT INTO Users
VALUES ('tiki', '147', NULL, '00:00 PM', 'true')

INSERT INTO Users
VALUES ('riki', '258', NULL, '12:20 AM', 'false')