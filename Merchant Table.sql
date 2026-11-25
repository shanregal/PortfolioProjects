CREATE DATABASE BankingDB;
GO

USE BankingDB;
-- table Customers 
CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(50)
);

-- table Creditcards

CREATE TABLE CreditCards
(
    CardID INT PRIMARY KEY,
    CustomerID INT,
    CardNumber VARCHAR(20),
    CardType VARCHAR(20),
    CreditLimit DECIMAL(10,2),
    AvailableLimit DECIMAL(10,2),

    FOREIGN KEY(CustomerID)
    REFERENCES Customers(CustomerID)
);
 -- table Transactions 

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CardID INT,
    MerchantID INT,
    Amount DECIMAL(10, 2),
    TransactionDate DATETIME,
    FOREIGN KEY (CardID) REFERENCES CreditCards(CardID),
    FOREIGN KEY (MerchantID) REFERENCES Merchants(MerchantID)
);

-- table Merchants 

CREATE TABLE Merchants (
    MerchantID INT PRIMARY KEY,
    MerchantName VARCHAR(100),
    Category VARCHAR(50)
);

-- table statements 
CREATE TABLE CardStatements (
    StatementID INT PRIMARY KEY,
    CardID INT,
    StatementMonth VARCHAR(20),
    TotalDue DECIMAL(10, 2),
    FOREIGN KEY (CardID) REFERENCES CreditCards(CardID)
);

-- insert into Merchants table 

DECLARE @Counter INT = 1;
DECLARE @Category VARCHAR(50);

WHILE @Counter <= 100
BEGIN
    -- Logic to create repeating categories (to allow for data analysis/grouping)
    SET @Category = CASE (@Counter % 5)
        WHEN 0 THEN 'Retail'
        WHEN 1 THEN 'Dining'
        WHEN 2 THEN 'Travel'
        WHEN 3 THEN 'Grocery'
        ELSE 'Electronics'
    END;
        INSERT INTO Merchants (MerchantID, MerchantName, Category)
    VALUES (
        @Counter,
        'Merchant_' + CAST(@Counter AS VARCHAR),
        @Category
    );

    SET @Counter = @Counter + 1;
END; 

-- select 
select * from Merchants; 





