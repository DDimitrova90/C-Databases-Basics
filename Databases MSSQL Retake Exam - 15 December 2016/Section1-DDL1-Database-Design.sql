CREATE DATABASE TheNerdHerd     -- in table UsersChats in the Primary key must be first ChatId, then UserId
                                -- All IDs must be IDENTITY
CREATE TABLE Chats
(
Id INT IDENTITY,
CONSTRAINT PK_Chats PRIMARY KEY (Id),
Title VARCHAR(32),
StartDate DATE,
IsActive BIT
)

CREATE TABLE Locations
(
Id INT IDENTITY,
CONSTRAINT PK_Locations PRIMARY KEY (Id),
Latitude FLOAT,
Longitude FLOAT
)

CREATE TABLE Credentials
(
Id INT IDENTITY,
CONSTRAINT PK_Credentials PRIMARY KEY (Id),
Email VARCHAR(30),
Password VARCHAR(20)
)

CREATE TABLE Users
(
Id INT IDENTITY,
CONSTRAINT PK_Users PRIMARY KEY (Id),
Nickname VARCHAR(25),
Gender CHAR(1),
Age INT,
LocationId INT,  
CredentialId INT UNIQUE,
CONSTRAINT FK_Users_Locations
FOREIGN KEY (LocationId)
REFERENCES Locations(Id),
CONSTRAINT FK_Users_Credentials
FOREIGN KEY (CredentialId)
REFERENCES Credentials(Id)
)

CREATE TABLE UsersChats
(
UserId INT,
ChatId INT,
CONSTRAINT PK_UsersChats
PRIMARY KEY (ChatId, UserId),
CONSTRAINT FK_UsersChats_Users
FOREIGN KEY (UserId) REFERENCES Users (Id),
CONSTRAINT FK_UsersChats_Chats 
FOREIGN KEY (ChatId) REFERENCES Chats (Id)
)

CREATE TABLE Messages
(
Id INT IDENTITY,
CONSTRAINT PK_Messages PRIMARY KEY (Id),
Content VARCHAR(200),
SentOn DATE,
ChatId INT,
UserId INT,
CONSTRAINT FK_Messages_Chats
FOREIGN KEY (ChatId)
REFERENCES Chats (Id),
CONSTRAINT FK_Messages_Users
FOREIGN KEY (UserId)
REFERENCES Users (Id)
)

