--CREATE DATABASE Hotel
--USE Hotel

CREATE TABLE Employees
(
Id int NOT NULL PRIMARY KEY IDENTITY,
FistName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
Title nvarchar(50) NOT NULL,
Notes nvarchar(max)
)

CREATE TABLE Customers
(
AccountNumber int NOT NULL PRIMARY KEY IDENTITY,
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
PhoneNumber nvarchar(20) NOT NULL,
EmergencyName nvarchar(50) NOT NULL,
EmergencyNumber int NOT NULL,
Notes nvarchar(max)
)

CREATE TABLE RoomStatus
(
RoomStatus int NOT NULL PRIMARY KEY IDENTITY,
Notes nvarchar(20) NOT NULL
)

CREATE TABLE RoomTypes
(
RoomType int NOT NULL PRIMARY KEY IDENTITY,
Notes nvarchar(20) NOT NULL
)

CREATE TABLE BedTypes
(
BedType int NOT NULL PRIMARY KEY IDENTITY,
Notes nvarchar(20) NOT NULL
)

CREATE TABLE Rooms
(
RoomNumber int NOT NULL PRIMARY KEY IDENTITY,
RoomType int NOT NULL FOREIGN KEY REFERENCES RoomTypes(RoomType),
BedType int NOT NULL FOREIGN KEY REFERENCES BedTypes(BedType),
Rate decimal(10,2) NOT NULL,
RoomStatus int NOT NULL FOREIGN KEY REFERENCES RoomStatus(RoomStatus),
Notes nvarchar(max)
)

CREATE TABLE Payments
(
Id int NOT NULL PRIMARY KEY IDENTITY,
EmployeeId int NOT NULL FOREIGN KEY REFERENCES Employees(Id),
PaymentDate date NOT NULL,
AccountNumber int NOT NULL FOREIGN KEY REFERENCES Customers(AccountNumber),
FirstDateOccupied date NOT NULL,
LastDateOccupied date NOT NULL,
TotalDays int NOT NULL,
AmountCharged money NOT NULL,
TaxRate decimal(10,2) NOT NULL,
TaxAmount int NOT NULL,
PaymentTotal money NOT NULL,
Notes nvarchar(max)
)

CREATE TABLE Occupancies
(
Id int NOT NULL PRIMARY KEY IDENTITY,
EmployeeId int NOT NULL FOREIGN KEY REFERENCES Employees(Id),
DateOccupied date NOT NULL,
AccountNumber int NOT NULL FOREIGN KEY REFERENCES Customers(AccountNumber),
RoomNumber int NOT NULL FOREIGN KEY REFERENCES Rooms(RoomNumber),
RateApplied decimal(10,2) NOT NULL,
PhoneCharge money NOT NULL,
Notes nvarchar(max)
)

INSERT INTO Employees
VALUES ('Dimana', 'Dimitrova', 'manager', NULL),
('Petko', 'Tanev', 'employee', NULL),
('Kiril', 'Dimitrov', 'accountant', NULL)

INSERT INTO Customers
VALUES ('Pesho', 'Petkov', '0235698744', 'star', 5, NULL),
('Tanio', 'Taniov', '0864759328', 'box', 3, NULL),
('Vasil', 'Vasilev', '0376841935', 'dot', 7, NULL)

INSERT INTO RoomStatus
VALUES ('free'),
('busy'),
('cleaning')

INSERT INTO RoomTypes
VALUES ('small'),
('medium'),
('big')

INSERT INTO BedTypes
VALUES ('Full size'),
('Queen size'),
('Cal-king')

INSERT INTO Rooms
VALUES (1, 3, 1.36, 2, NULL),
(2, 1, 2.45, 3, NULL),
(3, 2, 3.18, 1, NULL)

INSERT INTO Payments
VALUES (1, '22 May, 2016', 3, '15 May, 2016', '22 May, 2016', 13, 1000, 3.45, 3, 2153.25, NULL),
(2, '13 August, 2017', 2, '05 August, 2017', '13 August, 2017', 20, 2563, 1.26, 2, 3145.12, NULL),
(3, '05 July, 2017', 1, '15 June, 2017', '05 July, 2017', 15, 1236.25, 2.78, 1, 1895.12, NULL)

INSERT INTO Occupancies
VALUES (2, '2016-03-26', 1, 3, 3.25, 100, NULL),
(3, '2017-03-15', 2, 2, 1.26, 56.25, NULL),
(1, '2017-07-19', 3, 1, 2.89, 80.56, NULL)
