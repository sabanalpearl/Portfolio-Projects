SELECT *
FROM Sales_Transaction

-- MOST PURCHASED PRODUCTS PER PRODUCT CODE

SELECT ProductNo, ProductName,
COUNT (*) AS Total_Purchased_per_Product
FROM Sales_Transaction
GROUP BY ProductNo, ProductName
ORDER BY Total_Purchased_per_Product DESC

-- MOST PURCHASED PRODUCTS
SELECT ProductName, Country,
COUNT (*) AS Total_Purchased_per_ProductName
FROM Sales_Transaction
GROUP BY ProductName, Country
ORDER BY Total_Purchased_per_ProductName DESC

-- NUMBER OF PURCHASE PER COUNTRY
SELECT Country, 
COUNT (*) AS Total_Purchased_per_Country
FROM Sales_Transaction
GROUP BY Country
ORDER BY Total_Purchased_per_Country DESC

-- Number of transactions per customer (removing the cancelled transactions)

SELECT CustomerNo, TransactionNo, COUNT(*) AS num_of_transactions
FROM Sales_Transaction
WHERE TransactionNo NOT LIKE 'C%'
GROUP BY CustomerNo, TransactionNo 
order by num_of_transactions DESC

-- Largest and Smallest Price
SELECT 
 MAX(Price) as Largest_Price,
 MIN(Price) as Smallest_Price
 FROM Sales_Transaction

  
-- total sales per item
SELECT Date, Price, Quantity, ProductNo, ProductName, Country,
(CAST(Price as float)* CAST(Quantity as float)) as total_sales
FROM Sales_Transaction
 
 -- Looking for Sales Trend
 --TempTable

 CREATE TABLE #Sales_Trend
 (
 Date date,
 Price float,
 Quantity float,
 ProductNo nvarchar(255),
 ProductName nvarchar(255),
 Country nvarchar(255),
 Total_Sales int
 )
 INSERT INTO #Sales_Trend
 SELECT Date, Price, Quantity, ProductNo, ProductName, Country,
 (CAST(Price as float)* CAST(Quantity as float)) as total_sales
FROM Sales_Transaction

SELECT Year(Date) AS Year, Month(Date) as Month, 
SUM(Total_Sales) as Monthly_Sales
FROM #Sales_Trend
GROUP BY Year(Date), Month(Date)
ORDER BY Year(Date), Month(Date)







 


 
  



 









