SELECT
*
FROM DimEmployee;

SELECT
*
FROM FactResellerSales;

SELECT
Emp. EmployeeKey, FirstName, MiddleName, LastName, AVG (SalesAmount)
FROM DimEmployee AS Emp
LEFT JOIN FactResellerSales AS Sal
ON Emp.EmployeeKey = Sal.EmployeeKey
GROUP BY Emp.EmployeeKey, FirstName, MiddleName, LastName;

--

SELECT
EnglishCountryRegionName, SUM (OrderQuantity)
FROM DimGeography AS Geo
LEFT JOIN FactResellerSales AS Sal
ON Geo.SalesTerritoryKey = Sal.SalesTerritoryKey
GROUP BY EnglishCountryRegionName
HAVING SUM(OrderQuantity) >=1
ORDER BY SUM(OrderQuantity) ASC;

--

SELECT
*
FROM DimProduct;

SELECT
EnglishProductName, MAX (OrderDate) AS LastDate
FROM DimProduct AS Prod
LEFT JOIN FactResellerSales AS Sal
ON Prod.ProductKey = Sal.ProductKey
GROUP BY EnglishProductName
ORDER BY LastDate DESC;

--

SELECT
MONTH (OrderDate) AS Mon, AVG (OrderQuantity) AS MedQ
FROM FactResellerSales
WHERE YEAR (OrderDate) = (SELECT MAX(YEAR (OrderDate)) FROM FactResellerSales)
GROUP BY MONTH (OrderDate)
ORDER BY MONTH (OrderDate) ASC;

--

SELECT
MONTH (OrderDate) AS Mon,
CASE
WHEN MONTH (OrderDate) = 1 THEN 'Jan'
WHEN MONTH (OrderDate) = 2 THEN 'Feb'
WHEN MONTH (OrderDate) = 3 THEN 'Mar'
WHEN MONTH (OrderDate) = 4 THEN 'Apr'
WHEN MONTH (OrderDate) = 5 THEN 'May'
END AS Mon_DS,
SUM (SalesAmount) AS Tot
FROM FactResellerSales
WHERE YEAR (OrderDate) = (SELECT MAX(YEAR (OrderDate)) FROM FactResellerSales)
GROUP BY MONTH (OrderDate),
CASE
WHEN MONTH (OrderDate) = 1 THEN 'Jan'
WHEN MONTH (OrderDate) = 2 THEN 'Feb'
WHEN MONTH (OrderDate) = 3 THEN 'Mar'
WHEN MONTH (OrderDate) = 4 THEN 'Apr'
WHEN MONTH (OrderDate) = 5 THEN 'May'
END
HAVING SUM (SalesAmount) > 100000
ORDER BY SUM (SalesAmount) ASC;

--

SELECT
YEAR (OrderDate) AS Y,
OrderDate,
Prod.EnglishProductName
FROM FactResellerSales as Sal
LEFT JOIN DimProduct AS Prod
ON Sal.ProductKey = Prod.ProductKey
WHERE 1=1 AND OrderDate IN
  (SELECT
   Ord
   FROM (SELECT
         YEAR (OrderDate) AS YR, MAX (OrderDate) AS Ord
         FROM FactResellerSales
         GROUP BY YEAR (OrderDate))
   AS Ult)
ORDER BY YEAR (OrderDate) DESC;