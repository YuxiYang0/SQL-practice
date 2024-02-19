--1

SELECT DISTINCT c.City
FROM Customers c JOIN Employees e 
ON c.City = e.City

--2a

SELECT DISTINCT c.City
FROM Customers c 
WHERE c.City NOT IN (
    SELECT DISTINCT e.City 
    FROM Employees e
)

--2b
SELECT DISTINCT c.City
FROM Customers c LEFT JOIN Employees e ON c.City = e.City
WHERE e.EmployeeID IS NULL

--3
SELECT d.ProductID, SUM(d.quantity) AS [Total Order Quantity]
FROM Orders o 
JOIN [Order Details] AS d
ON o.OrderID = d.OrderID
GROUP BY d.ProductID

--4
SELECT c.City, SUM(d.Quantity) AS [Total Order Quantity]
FROM Customers c JOIN Orders o 
ON c.CustomerID = o.CustomerID
JOIN [Order Details] AS d 
ON o.OrderID = d.OrderID
GROUP BY c.City
ORDER BY c.City

--5a
SELECT c3.City
FROM(
    SELECT c1.CustomerID, c1.City FROM Customers c1
    UNION
    SELECT c2.CustomerID, c2.City FROM Customers c2
) AS c3
GROUP BY c3.City 
HAVING COUNT(c3.CustomerID) > 1

--5b
SELECT c.City 
FROM Customers c 
GROUP BY c.City 
HAVING COUNT(c.CustomerID) > 1

--6 
SELECT c.City AS [City that has ordered at least two different products]
FROM [Order Details] AS d JOIN Orders o 
ON d.OrderID = o.OrderID 
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.City 
HAVING COUNT(d.ProductID) > 1

--7 
SELECT DISTINCT c.CustomerID, c.ContactName
FROM Customers c JOIN Orders o 
ON c.CustomerID = o.CustomerID 
WHERE c.City <> o.ShipCity

--8 
SELECT TOP 5 d.ProductID, 
(
    SELECT TOP 1 c.City
    FROM [Order Details] d2 
    JOIN Orders o2
    ON d2.OrderID = o2.OrderID
    JOIN Customers c 
    ON o2.CustomerID = c.CustomerID 
    WHERE d2.ProductID = d.ProductID
    GROUP BY c.City 
    ORDER BY (SUM(d.Quantity)) DESC

) AS city,
AVG(d.UnitPrice) AS AveragePrice
FROM Orders o JOIN [Order Details] AS d 
ON o.OrderID = d.OrderID 
GROUP BY d.ProductID
ORDER BY (SUM(d.Quantity))

--9a
SELECT DISTINCT e.City
FROM Employees e 
WHERE e.City NOT IN(
    SELECT DISTINCT c.City
    FROM Customers c
)

--9b
SELECT DISTINCT e.City
FROM Customers c FULL OUTER JOIN Employees e 
ON c.City = e.City 
WHERE c.CustomerID IS NULL
AND e.EmployeeID IS NOT NULL

--10 

SELECT o.City
FROM(
    SELECT TOP 1 c.City
    FROM Orders o JOIN Customers c
    ON o.CustomerID = c.CustomerID 
    GROUP BY c.City 
    ORDER BY COUNT(o.OrderID)) o JOIN 
(
    SELECT TOP 1 c1.City
    FROM Customers c1 JOIN Orders o1 
    ON c1.CustomerID = o1.CustomerID
    JOIN [Order Details] AS d1 
    ON o1.OrderID = d1.OrderID
    GROUP BY c1.City 
    ORDER BY SUM(d1.Quantity)
) q 
ON o.City = q.City

--11: To remove duplicate records from a table in SQL, 
--you can use a combination of a Common Table Expression (CTE) 
--or a temporary table, along with the ROW_NUMBER() function to identify 
--and delete the duplicates.