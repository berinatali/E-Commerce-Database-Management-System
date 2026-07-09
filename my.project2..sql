-- Create Database
--CREATE DATABASE ECommerceDB;
--GO

--USE ECommerceDB;
----GO
--CREATE TABLE Customers
--(
--    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
--    FirstName VARCHAR(50) NOT NULL,
--    LastName VARCHAR(50) NOT NULL,
--    Email VARCHAR(100) UNIQUE NOT NULL,
--    Phone VARCHAR(20),
--    Address VARCHAR(255),
--    City VARCHAR(50),
--    Country VARCHAR(50),
--    CreatedAt DATETIME DEFAULT GETDATE()
--);
--CREATE TABLE Categories
--(
--    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
--    CategoryName VARCHAR(100) NOT NULL,
--    Description VARCHAR(255)
--);
--CREATE TABLE Suppliers
--(
--    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
--    CompanyName VARCHAR(100) NOT NULL,
--    ContactName VARCHAR(100),
--    Email VARCHAR(100),
--    Phone VARCHAR(20),
--    Country VARCHAR(50)
--);
--CREATE TABLE Products
--(
--    ProductID INT IDENTITY(1,1) PRIMARY KEY,
--    ProductName VARCHAR(100) NOT NULL,
--    CategoryID INT NOT NULL,
--    SupplierID INT NOT NULL,
--    Price DECIMAL(10,2) NOT NULL,
--    StockQuantity INT NOT NULL,
--    Description VARCHAR(255),
--    CreatedAt DATETIME DEFAULT GETDATE(),

--    FOREIGN KEY (CategoryID)
--        REFERENCES Categories(CategoryID),

--    FOREIGN KEY (SupplierID)
--        REFERENCES Suppliers(SupplierID)
--);
--CREATE TABLE Employees
--(
--    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
--    FirstName VARCHAR(50),
--    LastName VARCHAR(50),
--    Position VARCHAR(50),
--    HireDate DATE,
--    Salary DECIMAL(10,2)
--);
--CREATE TABLE Shippers
--(
--    ShipperID INT IDENTITY(1,1) PRIMARY KEY,
--    CompanyName VARCHAR(100),
--    Phone VARCHAR(20)
--);
--CREATE TABLE Orders
--(
--    OrderID INT IDENTITY(1,1) PRIMARY KEY,
--    CustomerID INT NOT NULL,
--    EmployeeID INT,
--    ShipperID INT,
--    OrderDate DATETIME DEFAULT GETDATE(),
--    OrderStatus VARCHAR(30),
--    TotalAmount DECIMAL(10,2),

--    FOREIGN KEY (CustomerID)
--        REFERENCES Customers(CustomerID),

--    FOREIGN KEY (EmployeeID)
--        REFERENCES Employees(EmployeeID),

--    FOREIGN KEY (ShipperID)
--        REFERENCES Shippers(ShipperID)
--);
--CREATE TABLE OrderDetails
--(
--    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
--    OrderID INT NOT NULL,
--    ProductID INT NOT NULL,
--    Quantity INT NOT NULL,
--    UnitPrice DECIMAL(10,2) NOT NULL,

--    FOREIGN KEY (OrderID)
--        REFERENCES Orders(OrderID),

--    FOREIGN KEY (ProductID)
--        REFERENCES Products(ProductID)
--);
--CREATE TABLE Payments
--(
--    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
--    OrderID INT NOT NULL,
--    PaymentMethod VARCHAR(30),
--    PaymentDate DATETIME DEFAULT GETDATE(),
--    Amount DECIMAL(10,2),

--    FOREIGN KEY (OrderID)
--        REFERENCES Orders(OrderID)
--);
--CREATE TABLE Reviews
--(
--    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
--    ProductID INT NOT NULL,
--    CustomerID INT NOT NULL,
--    Rating INT CHECK (Rating BETWEEN 1 AND 5),
--    Comment VARCHAR(255),
--    ReviewDate DATETIME DEFAULT GETDATE(),

--    FOREIGN KEY (ProductID)
--        REFERENCES Products(ProductID),
--    FOREIGN KEY (CustomerID)
--        REFERENCES Customers(CustomerID)
--);
--IF OBJECT_ID('dbo.Reviews', 'U') IS NOT NULL TRUNCATE TABLE Reviews;
--IF OBJECT_ID('dbo.OrderDetails', 'U') IS NOT NULL TRUNCATE TABLE OrderDetails;
--IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL BEGIN DELETE FROM Orders; DBCC CHECKIDENT ('Orders', RESEED, 0); END
--IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL BEGIN DELETE FROM Products; DBCC CHECKIDENT ('Products', RESEED, 0); END
--IF OBJECT_ID('dbo.Categories', 'U') IS NOT NULL BEGIN DELETE FROM Categories; DBCC CHECKIDENT ('Categories', RESEED, 0); END
--IF OBJECT_ID('dbo.Suppliers', 'U') IS NOT NULL BEGIN DELETE FROM Suppliers; DBCC CHECKIDENT ('Suppliers', RESEED, 0); END
--IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL BEGIN DELETE FROM Customers; DBCC CHECKIDENT ('Customers', RESEED, 0); END
--IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL BEGIN DELETE FROM Employees; DBCC CHECKIDENT ('Employees', RESEED, 0); END
--IF OBJECT_ID('dbo.Shippers', 'U') IS NOT NULL BEGIN DELETE FROM Shippers; DBCC CHECKIDENT ('Shippers', RESEED, 0); END
--GO
--INSERT INTO Categories (CategoryName, Description) VALUES 
--('Electronics', 'Gadgets and devices'),
--('Clothing', 'Apparel and accessories'),
--('Home & Kitchen', 'Appliances and decor');
--GO
--INSERT INTO Suppliers (CompanyName, ContactName, Email, Phone, Country) VALUES 
--('Tech Corp', 'John Doe', 'tech@email.com', '12345', 'USA'),
--('Fashion Inc', 'Jane Smith', 'fashion@email.com', '67890', 'UK'),
--('HomeGoods', 'Bob Johnson', 'home@email.com', '54321', 'Canada');
--GO
--INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, Country) VALUES
--('Ahmet', 'Yılmaz', 'ahmet@email.com', '5551111111', 'Ataturk Street', 'Istanbul', 'Turkey'),
--('Ayşe', 'Demir', 'ayse@email.com', '5552222222', 'Cumhuriyet Street', 'Ankara', 'Turkey'),
--('Mehmet', 'Kaya', 'mehmet@email.com', '5553333333', 'Freedom Avenue', 'Izmir', 'Turkey'),
--('Zeynep', 'Çelik', 'zeynep@email.com', '5554444444', 'Green Street', 'Bursa', 'Turkey'),
--('Ali', 'Aydın', 'ali@email.com', '5555555555', 'Blue Street', 'Antalya', 'Turkey');
--GO
--INSERT INTO Employees (FirstName, LastName, Position, HireDate, Salary) VALUES
--('James', 'Anderson', 'Sales Manager', '2022-01-15', 5500),
--('Sophia', 'Taylor', 'Sales Representative', '2023-03-20', 4200);
--GO
--INSERT INTO Shippers (CompanyName, Phone) VALUES
--('DHL Express', '+49-111-2222'),
--('FedEx', '+1-111-3333');
--GO
--INSERT INTO Products (ProductName, CategoryID, SupplierID, Price, StockQuantity, Description) VALUES 
--('iPhone 15', 1, 1, 1999.99, 40, 'Apple smartphone'),
--('Samsung Galaxy S24', 1, 1, 1899.99, 35, 'Samsung smartphone'),
--('Gaming Keyboard', 1, 1, 89.99, 120, 'Mechanical RGB keyboard'),
--('Men T-Shirt', 2, 2, 24.99, 200, 'Cotton T-shirt'),
--('Running Shoes', 2, 2, 119.99, 80, 'Professional running shoes'),
--('Coffee Machine', 3, 3, 249.99, 25, 'Automatic coffee machine'),
--('SQL Fundamentals', 1, 1, 39.99, 100, 'Database learning book');
--GO
--INSERT INTO Orders (CustomerID, EmployeeID, ShipperID, OrderStatus, TotalAmount) VALUES 
--(1, 1, 1, 'Delivered', 1089.98);
--GO
--INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES 
--(1, 1, 1, 999.99),
--(1, 3, 1, 89.99);
--GO
--INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES 
--(1, 5, 5, 'Excellent phone!'),
--(3, 5, 4, 'Very comfortable keyboard.'),
--(6, 2, 5, 'Makes great coffee.'),
--(5, 4, 4, 'Good quality shoes.'),
--(7, 4, 5, 'Perfect SQL book.');
--GO
--SELECT *
--FROM Customers;
--SELECT ProductName, Price
--FROM Products
--ORDER BY Price DESC;

--SELECT ProductName, StockQuantity
--FROM Products
--WHERE StockQuantity < 50;
--SELECT FirstName, LastName, City
--FROM Customers
--WHERE Country = 'Turkey';

--SELECT FirstName, LastName, City
--FROM Customers
--WHERE Country = 'Turkey';

--SELECT *
--FROM Orders
--WHERE OrderStatus = 'Delivered';

--SELECT ProductName
--FROM Products
--WHERE ProductName LIKE '%Phone%';

--SELECT AVG(Price) AS AveragePrice
--FROM Products;

--SELECT TOP 1 *
--FROM Products
--ORDER BY Price;

--SELECT TOP 1 *
--FROM Products
--ORDER BY Price DESC;

--SELECT *
--FROM Products
--WHERE Price BETWEEN 50 AND 300;

--SELECT
--    c.CustomerID,
--    c.FirstName,
--    c.LastName,
--    o.OrderID,
--    o.OrderDate,
--    o.TotalAmount
--FROM Customers c
--INNER JOIN Orders o
--ON c.CustomerID = o.CustomerID;

--SELECT
--    od.OrderID,
--    p.ProductName,
--    od.Quantity,
--    od.UnitPrice
--FROM OrderDetails od
--INNER JOIN Products p
--ON od.ProductID = p.ProductID;

--SELECT
--    p.ProductName,
--    c.CategoryName,
--    p.Price
--FROM Products p
--INNER JOIN Categories c
--ON p.CategoryID = c.CategoryID;

--SELECT
--    p.ProductName,
--    s.CompanyName,
--    p.Price
--FROM Products p
--INNER JOIN Suppliers s
--ON p.SupplierID = s.SupplierID;

--SELECT
--    c.FirstName,
--    c.LastName,
--    o.OrderID,
--    s.CompanyName AS Shipper
--FROM Customers c
--INNER JOIN Orders o
--ON c.CustomerID = o.CustomerID
--INNER JOIN Shippers s
--ON o.ShipperID = s.ShipperID;

--SELECT
--    p.ProductName,
--    c.FirstName,
--    c.LastName,
--    r.Rating,
--    r.Comment
--FROM Reviews r
--INNER JOIN Products p
--ON r.ProductID = p.ProductID
--INNER JOIN Customers c
--ON r.CustomerID = c.CustomerID;

--SELECT
--    e.FirstName,
--    e.LastName,
--    o.OrderID,
--    o.TotalAmount
--FROM Employees e
--INNER JOIN Orders o
--ON e.EmployeeID = o.EmployeeID;

--SELECT
--    c.CategoryName,
--    COUNT(p.ProductID) AS ProductCount
--FROM Categories c
--INNER JOIN Products p
--ON c.CategoryID = p.CategoryID
--GROUP BY c.CategoryName;

--SELECT
--    p.ProductName,
--    SUM(od.Quantity) AS TotalSold
--FROM Products p
--INNER JOIN OrderDetails od
--ON p.ProductID = od.ProductID
--GROUP BY p.ProductName
--ORDER BY TotalSold DESC;

--SELECT
--    p.ProductName,
--    AVG(r.Rating) AS AverageRating
--FROM Products p
--INNER JOIN Reviews r
--ON p.ProductID = r.ProductID
--GROUP BY p.ProductName;

--SELECT
--    c.CustomerID,
--    c.FirstName,
--    c.LastName
--FROM Customers c
--LEFT JOIN Orders o
--ON c.CustomerID = o.CustomerID
--WHERE o.OrderID IS NULL;

--SELECT ProductName, Price
--FROM Products
--WHERE Price < (
--    SELECT MAX(Price)
--    FROM Products
--);

--SELECT ProductName, Price
--FROM Products
--WHERE Price > (
--    SELECT AVG(Price)
--    FROM Products
--);

--SELECT
--    ProductName,
--    Price,
--    CASE
--        WHEN Price >= 500 THEN 'Expensive'
--        WHEN Price >= 100 THEN 'Medium'
--        ELSE 'Affordable'
--    END AS PriceCategory
--FROM Products;

--SELECT
--    c.FirstName,
--    c.LastName,
--    COUNT(o.OrderID) AS TotalOrders
--FROM Customers c
--LEFT JOIN Orders o
--ON c.CustomerID = o.CustomerID
--GROUP BY c.FirstName, c.LastName;

--SELECT TOP 3
--    c.FirstName,
--    c.LastName,
--    COUNT(o.OrderID) AS OrderCount
--FROM Customers c
--INNER JOIN Orders o
--ON c.CustomerID = o.CustomerID
--GROUP BY c.FirstName, c.LastName
--ORDER BY OrderCount DESC;

--SELECT
--    c.CategoryName,
--    AVG(p.Price) AS AveragePrice
--FROM Categories c
--INNER JOIN Products p
--ON c.CategoryID = p.CategoryID
--GROUP BY c.CategoryName;

--SELECT
--    ProductName,
--    Price,
--    ROW_NUMBER() OVER (ORDER BY Price DESC) AS RowNumber
--FROM Products;

--SELECT
--    ProductName,
--    Price,
--    RANK() OVER (ORDER BY Price DESC) AS PriceRank
--FROM Products;

--WITH ProductSales AS
--(
--    SELECT
--        ProductID,
--        SUM(Quantity) AS TotalSold
--    FROM OrderDetails
--    GROUP BY ProductID
--)

--SELECT
--    p.ProductName,
--    ps.TotalSold
--FROM ProductSales ps
--INNER JOIN Products p
--ON ps.ProductID = p.ProductID
--ORDER BY ps.TotalSold DESC;

--SELECT TOP 1
--    p.ProductName,
--    SUM(od.Quantity * od.UnitPrice) AS Revenue
--FROM Products p
--INNER JOIN OrderDetails od
--ON p.ProductID = od.ProductID
--GROUP BY p.ProductName
--ORDER BY Revenue DESC;

--SELECT
--    YEAR(OrderDate) AS SalesYear,
--    MONTH(OrderDate) AS SalesMonth,
--    SUM(TotalAmount) AS TotalSales
--FROM Orders
--GROUP BY
--    YEAR(OrderDate),
--    MONTH(OrderDate)
--ORDER BY
--    SalesYear,
--    SalesMonth;

--    CREATE VIEW vw_CustomerOrders AS
--SELECT
--    c.CustomerID,
--    c.FirstName,
--    c.LastName,
--    o.OrderID,
--    o.OrderDate,
--    o.OrderStatus,
--    o.TotalAmount
--FROM Customers c
--INNER JOIN Orders o
--CREATE VIEW vw_ProductDetails AS
--SELECT
--    p.ProductID,
--    p.ProductName,
--    c.CategoryName,
--    s.CompanyName AS Supplier,
--    p.Price,
--    p.StockQuantity
--FROM Products p
--INNER JOIN Categories c
--ON p.CategoryID = c.CategoryID
--INNER JOIN Suppliers s
--ON p.SupplierID = s.SupplierID
--go
--CREATE VIEW vw_SalesSummary AS
--SELECT
--    OrderID,
--    OrderDate,
--    TotalAmount
--FROM Orders;
--CREATE VIEW vw_ProductReviews AS
--SELECT
--    p.ProductName,
--    c.FirstName,
--    c.LastName,
--    r.Rating,
--    r.Comment
--FROM Reviews r
--INNER JOIN Products p
--ON r.ProductID = p.ProductID
--INNER JOIN Customers c
--ON r.CustomerID = c.CustomerID;
--CREATE VIEW vw_TopSellingProducts AS
--SELECT
--    p.ProductName,
--    SUM(od.Quantity) AS TotalSold
--FROM Products p
--INNER JOIN OrderDetails od
--ON p.ProductID = od.ProductID
--GROUP BY p.ProductName;
--CREATE PROCEDURE sp_GetProductsByCategory
--    @CategoryID INT
--AS
--BEGIN
--    SELECT *
--    FROM Products
--    WHERE CategoryID = @CategoryID;
--END;
--EXEC sp_GetProductsByCategory 1;
--CREATE PROCEDURE sp_GetCustomerOrders
--    @CustomerID INT
--AS
--BEGIN
--    SELECT *
--    FROM Orders
--    WHERE CustomerID = @CustomerID;
--END;
--CREATE PROCEDURE sp_UpdateStock
--    @ProductID INT,
--    @Quantity INT
--AS
--BEGIN
--    UPDATE Products
--    SET StockQuantity = StockQuantity - @Quantity
--    WHERE ProductID = @ProductID;
--END;
--CREATE FUNCTION fn_TotalCustomerSales
--(
--    @CustomerID INT
--)
--RETURNS DECIMAL(10,2)
--AS
--BEGIN

--    DECLARE @Total DECIMAL(10,2);

--    SELECT
--        @Total = SUM(TotalAmount)
--    FROM Orders
--    WHERE CustomerID = @CustomerID;

--    RETURN ISNULL(@Total,0);
--CREATE TRIGGER trg_UpdateStock
--ON OrderDetails
--AFTER INSERT
--AS
--BEGIN

--UPDATE p
--SET StockQuantity = p.StockQuantity - i.Quantity
--FROM Products p
--INNER JOIN inserted i
--ON p.ProductID = i.ProductID;

--END;
--CREATE INDEX IX_ProductName
--ON Products(ProductName);
--CREATE INDEX IX_OrderDate
--ON Orders(OrderDate);
--CREATE TRIGGER trg_SetOrderDate
--ON Orders
--AFTER INSERT
--AS
--BEGIN
--    UPDATE o
--    SET OrderDate = GETDATE()
--    FROM Orders o
--    INNER JOIN inserted i
--        ON o.OrderID = i.OrderID
--    WHERE i.OrderDate IS NULL;
--END;
--CREATE TRIGGER trg_PreventProductDelete
--ON Products
--INSTEAD OF DELETE
--AS
--BEGIN
--    PRINT 'Products cannot be deleted. Set them as inactive instead.';
--END;
--CREATE TRIGGER trg_CheckStock
--ON OrderDetails
--INSTEAD OF INSERT
--AS
--BEGIN
--    IF EXISTS (
--        SELECT 1
--        FROM inserted i
--        INNER JOIN Products p
--            ON i.ProductID = p.ProductID
--        WHERE p.StockQuantity < i.Quantity
--    )
--    BEGIN
--        RAISERROR ('Insufficient stock quantity.',16,1);
--        ROLLBACK TRANSACTION;
--        RETURN;
--    END

--    INSERT INTO OrderDetails(OrderID,ProductID,Quantity,UnitPrice)
--    SELECT OrderID,ProductID,Quantity,UnitPrice
--    FROM inserted;
--END;
--CREATE TRIGGER trg_UpdateOrderStatus
--ON Payments
--AFTER INSERT
--AS
--BEGIN
--    UPDATE o
--    SET OrderStatus = 'Paid'
--    FROM Orders o
--    INNER JOIN inserted i
--        ON o.OrderID = i.OrderID;
--END;
--BEGIN TRY
--    BEGIN TRANSACTION;

--    INSERT INTO Orders
--    (
--        CustomerID,
--        EmployeeID,
--        ShipperID,
--        OrderStatus,
--        TotalAmount
--    )
--    VALUES
--    (
--        1,
--        1,
--        1,
--        'Pending',
--        999.99
--    );

--    DECLARE @OrderID INT = SCOPE_IDENTITY();

--    INSERT INTO OrderDetails
--    (
--        OrderID,
--        ProductID,
--        Quantity,
--        UnitPrice
--    )
--    VALUES
--    (
--        @OrderID,
--        1,
--        1,
--        999.99
--    );

--    UPDATE Products
--    SET StockQuantity = StockQuantity - 1
--    WHERE ProductID = 1;

--    COMMIT TRANSACTION;

--END TRY

--BEGIN CATCH

--    ROLLBACK TRANSACTION;

--    PRINT ERROR_MESSAGE();

--END CATCH;
--BEGIN TRY

--    BEGIN TRANSACTION;

--    INSERT INTO Payments
--    (
--        OrderID,
--        PaymentMethod,
--        Amount
--    )
--    VALUES
--    (
--        1,
--        'Credit Card',
--        999.99
--    );

--    UPDATE Orders
--    SET OrderStatus = 'Paid'
--    WHERE OrderID = 1;

--    COMMIT TRANSACTION;

--END TRY

--BEGIN CATCH

--    ROLLBACK TRANSACTION;

--    PRINT ERROR_MESSAGE();

--END CATCH;
--BEGIN TRY

--    BEGIN TRANSACTION;

--    UPDATE Products
--    SET Price = Price * 1.10
--    WHERE CategoryID = 1;

--    COMMIT TRANSACTION;

--END TRY

--BEGIN CATCH

--    ROLLBACK TRANSACTION;

--    PRINT ERROR_MESSAGE();

--END CATCH;
--BEGIN TRY

--    BEGIN TRANSACTION;

--    INSERT INTO Orders
--    (
--        CustomerID,
--        EmployeeID,
--        ShipperID,
--        OrderStatus,
--        TotalAmount
--    )
--    VALUES
--    (
--        2,
--        1,
--        2,
--        'Pending',
--        1149.98
--    );

--    DECLARE @NewOrderID INT = SCOPE_IDENTITY();

--    INSERT INTO OrderDetails
--    (
--        OrderID,
--        ProductID,
--        Quantity,
--        UnitPrice
--    )
--    VALUES
--    (@NewOrderID,1,1,999.99),
--    (@NewOrderID,3,1,89.99),
--    (@NewOrderID,7,1,59.99);

--    UPDATE Products
--    SET StockQuantity = StockQuantity - 1
--    WHERE ProductID IN (1,3,7);

--    COMMIT TRANSACTION;

--END TRY

--BEGIN CATCH

--    ROLLBACK TRANSACTION;

--    PRINT ERROR_MESSAGE();

--END CATCH;
--raports.sql
SELECT
    c.CategoryName,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Categories c
INNER JOIN Products p
    ON c.CategoryID = p.CategoryID
INNER JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY c.CategoryName
ORDER BY TotalRevenue DESC; 

SELECT TOP 10
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

SELECT
    s.CompanyName,
    SUM(od.Quantity) AS TotalProductsSold
FROM Suppliers s
INNER JOIN Products p
    ON s.SupplierID = p.SupplierID
INNER JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY s.CompanyName
ORDER BY TotalProductsSold DESC;

SELECT
    YEAR(OrderDate) AS SalesYear,
    MONTH(OrderDate) AS SalesMonth,
    COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY SalesYear, SalesMonth;

SELECT
    p.ProductName,
    AVG(r.Rating) AS AverageRating
FROM Products p
INNER JOIN Reviews r
    ON p.ProductID = r.ProductID
GROUP BY p.ProductName
HAVING AVG(r.Rating) >= 4
ORDER BY AverageRating DESC;

SELECT
    ProductName,
    StockQuantity
FROM Products
WHERE StockQuantity < 20
ORDER BY StockQuantity ASC;


