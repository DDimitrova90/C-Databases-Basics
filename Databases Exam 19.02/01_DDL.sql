CREATE TABLE Countries
(
Id INT IDENTITY,
Name NVARCHAR(50) UNIQUE,
CONSTRAINT PK_Countries PRIMARY KEY (Id)
)

CREATE TABLE Customers
(
Id INT IDENTITY,
FirstName NVARCHAR(25),
LastName NVARCHAR(25),
Gender CHAR(1),
Age INT,
PhoneNumber VARCHAR(10),
CountryId INT,
CONSTRAINT PK_Customers PRIMARY KEY (Id),
CONSTRAINT CH_Gender CHECK (Gender IN ('M', 'F')),
CONSTRAINT CH_PhoneNumber CHECK (LEN(PhoneNumber) = 10),
CONSTRAINT FK_Customers_Countries
FOREIGN KEY (CountryId)
REFERENCES Countries(Id)
)

CREATE TABLE Products
(
Id INT IDENTITY,
Name NVARCHAR(25) UNIQUE,
Description NVARCHAR(250),
Recipe NVARCHAR(MAX),
Price MONEY,
CONSTRAINT PK_Products PRIMARY KEY (Id),
CONSTRAINT CH_Price CHECK (Price > 0)
)

CREATE TABLE Feedbacks
(
Id INT IDENTITY,
Description NVARCHAR(255),
Rate DECIMAL(10,2),
ProductId INT,
CustomerId INT,
CONSTRAINT PK_Feedbacks PRIMARY KEY (Id),
CONSTRAINT CH_Rate CHECK (Rate BETWEEN 0 AND 10),
CONSTRAINT FK_Feedbacks_Products
FOREIGN KEY (ProductId)
REFERENCES Products (Id),
CONSTRAINT FK_Feedbacks_Customers
FOREIGN KEY (CustomerId)
REFERENCES Customers (Id)
)

CREATE TABLE Distributors
(
Id INT IDENTITY,
Name NVARCHAR(25) UNIQUE,
Summary NVARCHAR(200),
AddressText NVARCHAR(30),
CountryId INT,
CONSTRAINT PK_Distributors PRIMARY KEY (Id),
CONSTRAINT FK_Distributors_Countries
FOREIGN KEY (CountryId)
REFERENCES Countries (Id)
)

CREATE TABLE Ingredients
(
Id INT IDENTITY,
Name NVARCHAR(30),
Description NVARCHAR(200),
OriginCountryId INT,
DistributorId INT,
CONSTRAINT PK_Ingredients PRIMARY KEY (Id),
CONSTRAINT FK_Ingredients_Countries
FOREIGN KEY (OriginCountryId)
REFERENCES Countries (Id),
CONSTRAINT FK_Ingredients_Distributors
FOREIGN KEY (DistributorId) 
REFERENCES Distributors (Id)
)

CREATE TABLE ProductsIngredients
(
ProductId INT,
IngredientId INT,
CONSTRAINT PK_ProductsIngredients PRIMARY KEY (ProductId, IngredientId),
CONSTRAINT FK_ProductsIngredients_Products
FOREIGN KEY (ProductId)
REFERENCES Products (Id),
CONSTRAINT FK_ProductsIngredients_Ingredients
FOREIGN KEY (IngredientId)
REFERENCES Ingredients (Id),
)