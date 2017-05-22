--CREATE DATABASE Movies

--USE Movies

CREATE TABLE Directors
(
Id int NOT NULL PRIMARY KEY IDENTITY,
DirectorName nvarchar(50) NOT NULL,
Notes nvarchar(max)
)

CREATE TABLE Genres
(
Id int NOT NULL PRIMARY KEY IDENTITY,
GenreName nvarchar(50) NOT NULL,
Notes nvarchar(max)
)

CREATE TABLE Categories
(
Id int NOT NULL PRIMARY KEY IDENTITY,
CategoryName nvarchar(50) NOT NULL,
Notes nvarchar(max)
)

CREATE TABLE Movies
(
Id int NOT NULL PRIMARY KEY IDENTITY,
Title nvarchar(50) NOT NULL,
DirectorId int NOT NULL FOREIGN KEY REFERENCES Directors(Id),
CopyrightYear varchar(8) NOT NULL,
Length varchar(50) NOT NULL,
GenreId int NOT NULL FOREIGN KEY REFERENCES Genres(Id),
CategoryId int NOT NULL FOREIGN KEY REFERENCES Categories(Id),
Rating decimal(10,2),
Notes nvarchar(max)
)

INSERT INTO Directors (DirectorName, Notes)
VALUES ('Petko', 'Have to finish something')

INSERT INTO Directors (DirectorName, Notes)
VALUES ('Mitko', NULL)

INSERT INTO Directors (DirectorName, Notes)
VALUES ('Vesko', 'I am stupid')

INSERT INTO Directors (DirectorName, Notes)
VALUES ('Avgust', NULL)

INSERT INTO Directors (DirectorName, Notes)
VALUES ('Krum', 'I love to work')

INSERT INTO Genres (GenreName, Notes)
VALUES ('Drama', 'Tudududuuum')

INSERT INTO Genres (GenreName, Notes)
VALUES ('Comedy', 'HAhahah')

INSERT INTO Genres (GenreName, Notes)
VALUES ('Horror', 'buuuu')

INSERT INTO Genres (GenreName, Notes)
VALUES ('Romance', NULL)

INSERT INTO Genres (GenreName, Notes)
VALUES ('Musical', 'Tanci-manci')

INSERT INTO Categories (CategoryName, Notes)
VALUES ('Family', 'For whole family')

INSERT INTO Categories (CategoryName, Notes)
VALUES ('Biography', NULL)

INSERT INTO Categories (CategoryName, Notes)
VALUES ('Military', NULL)

INSERT INTO Categories (CategoryName, Notes)
VALUES ('Documentary', 'Discovery...')

INSERT INTO Categories (CategoryName, Notes)
VALUES ('Sport', NULL)

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES ('Brave heart', 1, '1996', '2:00', 1, 3, 5, 'Very good')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES ('Avengers', 2, '2016', '1:56', 2, 1, 4, 'Good!')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES ('Sherlock Homes', 3, '2015', '1:45', 3, 2, 3, 'Riddle')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES ('Leonardo Code', 4, '2014', '1:52', 4, 1, 2, NULL)

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES ('Inferno', 5, '2017', '2:05', 5, 5, 1, NULL)