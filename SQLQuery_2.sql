USE AdventureWorks2019
GO

--1. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, with no filter. 
SELECT e.ProductID, e.Name, e.Color, e.ListPrice
FROM Production.Product AS e

--2. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, excludes the rows that ListPrice is 0.
SELECT e.ProductID, e.Name, e.Color, e.ListPrice
FROM Production.Product AS e
WHERE e.ListPrice != 0

--3. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are NULL for the Color column.
SELECT e.ProductID, e.Name, e.Color, e.ListPrice
FROM Production.Product AS e
WHERE e.Color IS NULL

--4. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are not NULL for the Color column.
SELECT e.ProductID, e.Name, e.Color, e.ListPrice
FROM Production.Product AS e
WHERE e.Color IS NOT NULL

--5. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are not NULL for the column Color, and the column ListPrice has a value greater than zero.
SELECT e.ProductID, e.Name, e.Color, e.ListPrice
FROM Production.Product AS e
WHERE e.Color IS NOT NULL 
AND e.ListPrice > 0



--6. Write a query that concatenates the columns Name and Color from the Production.Product table by excluding the rows that are null for color.
SELECT e.Name + ' ' + e.Color
FROM Production.Product AS e
WHERE e.Color IS NOT NULL

--7. Write a query that generates the following result set  from Production.Product
--note: Attempted DESC and ASC, but neither produced the exact same result
SELECT 'NAME: ' + e.Name + ' -- COLOR: ' + e.Color
FROM Production.Product AS e
WHERE e.Name LIKE '[a-z][a-z][ ]Crankarm'
OR e.Name LIKE 'Chainring%'
ORDER BY CASE e.Name
           WHEN 'LL Crankarm' THEN 1
           WHEN 'ML Crankarm' THEN 2
           WHEN 'HL Crankarm' THEN 3
           WHEN 'Chainring Bolts' THEN 4
           WHEN 'Chainring Nut' THEN 5
           WHEN 'Chainring' THEN 6
         END;

--8. Write a query to retrieve the to the columns ProductID and Name from the Production.Product table filtered by ProductID from 400 to 500
SELECT e.ProductID, e.Name
FROM Production.Product AS e
WHERE e.ProductID BETWEEN 400 AND 500

--9. Write a query to retrieve the to the columns  ProductID, Name and color from the Production.Product table restricted to the colors black and blue
SELECT e.ProductID, e.Name, e.Color
FROM Production.Product AS e
WHERE e.Color IN ('Black', 'Blue')

--10. Write a query to get a result set on products that begins with the letter S. 
SELECT e.ProductID, e.Name
FROM Production.Product AS e
WHERE e.Name Like 'S%'

--11. Write a query that retrieves the columns Name and ListPrice from the Production.Product table. 
SELECT e.Name, e.ListPrice
FROM Production.Product AS e
WHERE e.Name Like 'S%'
ORDER BY e.Name ASC

--12. 
SELECT e.Name, e.ListPrice
FROM Production.Product AS e
WHERE e.Name Like 'S%'
OR e.Name Like 'A%'
ORDER BY e.Name ASC

--13.
SELECT e.Name, e.ListPrice
FROM Production.Product AS e
WHERE e.Name Like 'SPO[^K]%'
ORDER BY e.Name ASC


--14.
--Assume that NULL cannot count as a unique color
SELECT DISTINCT e.Color
FROM Production.Product AS e
WHERE e.Color IS NOT NULL
ORDER BY e.Color DESC

--15.
--I did not find an example format, so I used a previous format. 
SELECT e.ProductSubcategoryID, e.Color
FROM Production.Product AS e
WHERE e.ProductSubcategoryID IS NOT NULL
AND e.Color IS NOT NULL
GROUP BY e.ProductSubcategoryID, e.Color
ORDER BY e.ProductSubcategoryID, e.Color;


