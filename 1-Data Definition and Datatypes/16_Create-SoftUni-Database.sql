CREATE DATABASE SoftUni
USE SoftUni

CREATE TABLE Towns
(
Id int NOT NULL PRIMARY KEY IDENTITY,
Name nvarchar(50) NOT NULL
)

CREATE TABLE Addresses
( 
Id int NOT NULL PRIMARY KEY IDENTITY,
AddressText nvarchar(200) NOT NULL,
TownId int NOT NULL FOREIGN KEY REFERENCES Towns(Id)
)

CREATE TABLE Departments
(
Id int NOT NULL PRIMARY KEY IDENTITY,
Name nvarchar(50) NOT NULL
)

CREATE TABLE Employees
( 
Id int NOT NULL PRIMARY KEY IDENTITY,
FirstName nvarchar(50) NOT NULL,
MiddleName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
JobTitle nvarchar(200) NOT NULL,
DepartmentId int NOT NULL FOREIGN KEY REFERENCES Departments(Id),
HireDate date NOT NULL,
Salary money NOT NULL,
AddressId int NOT NULL FOREIGN KEY REFERENCES Addresses(Id)
)