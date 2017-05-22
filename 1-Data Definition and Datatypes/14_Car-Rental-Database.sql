--CREATE DATABASE CarRental
--USE CarRental

CREATE TABLE Categories
(
Id int NOT NULL PRIMARY KEY IDENTITY,
Category nvarchar(50) NOT NULL,
DailyRate decimal(10, 2),
WeeklyRate decimal(10, 2),
MonthlyRate decimal(10, 2),
WeekendRate decimal(10, 2)
)

CREATE TABLE Cars
(
Id INT NOT NULL PRIMARY KEY IDENTITY,
PlateNumber int NOT NULL,
Make nvarchar(50) NOT NULL,
Model nvarchar(50) NOT NULL,
CarYear varchar(4) NOT NULL,
CategoryId int NOT NULL,
Doors int NOT NULL,
Picture varbinary,
Condition int NOT NULL,
Available varchar(5) CHECK (Available in ('true', 'false')) NOT NULL
)

CREATE TABLE Employees
(
Id int NOT NULL PRIMARY KEY IDENTITY,
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
Title nvarchar(50) NOT NULL,
Notes nvarchar(100)
)

CREATE TABLE Customers
(
Id int NOT NULL PRIMARY KEY IDENTITY,
DriverLicenceNumber varchar(20) NOT NULL,
FullName nvarchar(100) NOT NULL,
Address nvarchar(max) NOT NULL,
City nvarchar(50) NOT NULL,
ZIPCode int,
Notes nvarchar(100)
)

CREATE TABLE RentalOrders
(
Id int NOT NULL PRIMARY KEY IDENTITY,
EmployeeId int NOT NULL FOREIGN KEY REFERENCES Employees(Id),
CustomerId int NOT NULL FOREIGN KEY REFERENCES Customers(Id),
CarId int NOT NULL FOREIGN KEY REFERENCES Cars(Id),
CarCondition int NOT NULL,
TankLevel decimal(10,2) NOT NULL,
KilometrageStart int NOT NULL,
KilometrageEnd int NOT NULL,
TotalKilometrage int NOT NULL,
StartDate date NOT NULL,
EndDate date NOT NULL,
TotalDays int NOT NULL,
RateApplied decimal(10,2) NOT NULL,
TaxRate decimal(10,2) NOT NULL,
OrderStatus varchar(50) NOT NULL,
Notes nvarchar(100)
)

INSERT INTO Categories
VALUES ('Family', 4.1, 1.6, 3.8, 3.25),
('Sport', 3.52, 2.36, 1.56, 2.13),
('Common', 1.13, 2.78, 4.79, 1.34)

INSERT INTO Cars
VALUES (13355, 'Reno', 'Clio', '2003', 3, 3, NULL, 4, 'true'),
(45632, 'Toyota', 'HighLander', '2010', 1, 5, NULL, 5, 'false'),
(32564, 'BMW', 'M3', '2013', 2, 3, NULL, 6, 'true')

ALTER TABLE Cars
ADD FOREIGN KEY (CategoryId)
REFERENCES Categories(Id)

INSERT INTO Employees
VALUES ('Dilqn', 'Peevski', 'worker', 'Bad performance'),
('Kiril', 'Marechkov', 'manager', NULL),
('Stefan', 'Krustev', 'worker', 'Good employee')

INSERT INTO Customers
VALUES ('12365874', 'Ivan Ivanov', 'Mladost-3', 'Sofia', NULL, NULL),
('784551232', 'Petko Petkov', 'Lozenetc', 'Sofia', 1000, NULL),
('96325874', 'Kiril Kirilov', 'Diana-3', 'Yambol', 8600, NULL)

INSERT INTO RentalOrders
VALUES (1, 2, 3, 5, 12.56, 10000, 10265, 265, 'October 03, 2016', 'February 04, 2016', 36, 1.26, 3.86, 'finished', NULL),
(2, 3, 2, 4, 13.04, 9000, 10013, 1013, 'October 05, 2016', 'June 06, 2016', 40, 2.78, 1.45, 'in progress', NULL),
(3, 1, 1, 3, 10.13, 10000, 12265, 2265, 'May 09, 2016', 'September 11, 2016', 61, 5.02, 2.16, 'finished', NULL)