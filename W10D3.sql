SELECT
*
FROM DimProduct;

SELECT
*
FROM DimProductCategory;

SELECT
EnglishProductName, ListPrice
FROM DimProduct
INNER JOIN DimProductCategory
ON ProductCategoryKey = ProductSubcategoryKey
AND ProductSubcategoryKey = 1;

--

SELECT
*
FROM DimEmployee;

SELECT
*
FROM FactResellerSales;

SELECT
FirstName, MiddleName, LastName, SUM (OrderQuantity)
FROM DimEmployee as DM
LEFT JOIN FactResellerSales AS FRS
ON DM.EmployeeKey = FRS.EmployeeKey
GROUP BY FirstName, MiddleName, LastName
HAVING SUM (OrderQuantity) > 0;

--

SELECT
*
FROM DimSalesTerritory;

SELECT
*
FROM FactResellerSales;


SELECT
SalesTerritoryRegion, SUM (SalesAmount)
FROM DimSalesTerritory AS DST
LEFT JOIN FactResellerSales AS FRS
ON DST.SalesTerritoryKey = FRS.SalesTerritoryKey
GROUP BY SalesTerritoryRegion
HAVING SUM (SalesAmount) > 50000;

--

SELECT
*
FROM DimProduct;

SELECT
*
FROM FactResellerSales;

SELECT
EnglishProductName, SUM (SalesAmount)
FROM DimProduct AS DM
LEFT JOIN FactResellerSales AS FRS
ON DM.ProductKey = FRS.ProductKey
GROUP BY EnglishProductName;
