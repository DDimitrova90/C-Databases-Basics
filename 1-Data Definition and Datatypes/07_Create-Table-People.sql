CREATE TABLE People 
(
Id int NOT NULL IDENTITY PRIMARY KEY,
Name nvarchar(200) NOT NULL,
Picture image,
Height decimal(10,2),
Weight decimal(10,2),
Gender varchar(1) CHECK (Gender in ('f','m')) NOT NULL,
Birthdate date NOT NULL,
Biography nvarchar(max)
)

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES ('Victoria', NULL, 1.63, 63, 'f', 'June 30, 1990', 'Loves to dance')

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES ('Plamen', NULL, 1.89, 86, 'm', 'August 15, 1886', 'Trains football')

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES ('Petko', NULL, 1.79, 80, 'm', 'September 22, 1963', 'Loves to cook')

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES ('Tanq', NULL, 1.59, 55, 'f', 'May 03, 1996', 'Reads a lot')

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES ('Katq', NULL, 1.70, 65, 'f', 'March 05, 1988', 'Wants to be a model')