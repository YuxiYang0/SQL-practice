
--1.
SELECT COUNT(*) AS TotalProducts
FROM Production.Product;

--2.
SELECT COUNT(*) AS ProductsInSubcategories
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL;

--3.
SELECT ProductSubcategoryID, COUNT(*) AS CountedProducts
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID;

--4.
SELECT COUNT(*) AS ProductsWithoutSubcategory
FROM Production.Product
WHERE ProductSubcategoryID IS NULL;

--5.
SELECT SUM(Quantity) AS TotalQuantity
FROM Production.ProductInventory;

--6.
SELECT ProductID, SUM(Quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING SUM(Quantity) < 100;

--7
SELECT Shelf, ProductID, SUM(Quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY Shelf, ProductID
HAVING SUM(Quantity) < 100;

--8
SELECT AVG(Quantity) AS AvgQuantity
FROM Production.ProductInventory
WHERE LocationID = 10;

--9
SELECT ProductID, Shelf, AVG(Quantity) AS TheAvg
FROM Production.ProductInventory
GROUP BY ProductID, Shelf;

--10
SELECT ProductID, Shelf, AVG(Quantity) AS TheAvg
FROM Production.ProductInventory
WHERE Shelf <> 'N/A'
GROUP BY ProductID, Shelf;

--11
SELECT Color, Class, COUNT(*) AS TheCount, AVG(ListPrice) AS AvgPrice
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class;

--12
SELECT c.Name AS Country, sp.Name AS Province
FROM Person.CountryRegion c
JOIN Person.StateProvince sp ON c.CountryRegionCode = sp.CountryRegionCode;

--13
SELECT c.Name AS Country, sp.Name AS Province
FROM Person.CountryRegion c
JOIN Person.StateProvince sp ON c.CountryRegionCode = sp.CountryRegionCode;

USE Northwind
GO

--14
SELECT DISTINCT p.ProductName
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE DATEDIFF(year, o.OrderDate, GETDATE()) <= 26;

--15
SELECT TOP 5 ShipPostalCode, COUNT(*) AS TotalOrders
FROM Orders
WHERE ShipPostalCode IS NOT NULL
GROUP BY ShipPostalCode
ORDER BY TotalOrders DESC;


--16
SELECT TOP 5 ShipPostalCode, COUNT(*) AS TotalOrders
FROM Orders
WHERE DATEDIFF(year, OrderDate, GETDATE()) <= 26
GROUP BY ShipPostalCode
ORDER BY TotalOrders DESC;

--17
SELECT City, COUNT(*) AS NumberOfCustomers
FROM Customers
GROUP BY City;

--18
SELECT City, COUNT(*) AS NumberOfCustomers
FROM Customers
GROUP BY City
HAVING COUNT(*) > 2;

--19
SELECT c.CompanyName, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID

--20
SELECT c.CompanyName, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate > '1998-01-01';

--21
SELECT c.CompanyName, MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName;

--21
SELECT c.CompanyName, COUNT(od.ProductID) AS ProductsBought
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CompanyName;

--22
SELECT c.CustomerID, COUNT(od.ProductID) AS ProductsBought
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
HAVING COUNT(od.ProductID) > 100;

--23
SELECT s.CompanyName AS SupplierCompanyName, sh.CompanyName AS ShippingCompanyName
FROM Suppliers s
JOIN Shipper sh ON s.ShipVia = sh.ShipperID;

--24
SELECT o.OrderDate, p.ProductName
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
ORDER BY o.OrderDate;

--25
SELECT e1.FirstName + ' ' + e1.LastName AS Employee1, e2.FirstName + ' ' + e2.LastName AS Employee2
FROM Employees e1
JOIN Employees e2 ON e1.Title = e2.Title AND e1.EmployeeID < e2.EmployeeID;

--26
SELECT m.FirstName + ' ' + m.LastName AS ManagerName, COUNT(e.EmployeeID) AS NumberOfEmployees
FROM Employees m
JOIN Employees e ON m.EmployeeID = e.ReportsTo
GROUP BY m.FirstName, m.LastName
HAVING COUNT(e.EmployeeID) > 2;

--27
SELECT City, CompanyName, ContactName, 'Customer' AS Type
FROM Customers
UNION ALL
SELECT City, CompanyName, ContactName, 'Supplier' AS Type
FROM Suppliers;
