CREATE TABLE CustomerReviews
(
ReviewID INT,
ReviewContent VARCHAR(255) NOT NULL,
ReviewGrade INT,
AirlineID INT,
CustomerID INT,
CONSTRAINT PK_CustomerReviews PRIMARY KEY (ReviewID),
CONSTRAINT CH_ReviewGrade CHECK (ReviewGrade BETWEEN 0 AND 10),
CONSTRAINT FK_CustomerReviews_Airlines
FOREIGN KEY (AirlineID) REFERENCES Airlines (AirlineID),
CONSTRAINT FK_CustomerReviews_Customers
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
)

CREATE TABLE CustomerBankAccounts
(
AccountID INT,
AccountNumber VARCHAR(10) NOT NULL UNIQUE,
Balance DECIMAL(10, 2) NOT NULL,
CustomerID INT,
CONSTRAINT PK_CustomerBankAccounts PRIMARY KEY (AccountID),
CONSTRAINT FK_CustomerBankAccounts_Customers
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
) 