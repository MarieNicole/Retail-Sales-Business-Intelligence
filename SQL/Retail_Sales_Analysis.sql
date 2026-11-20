USE RetailSalesDB;

-- Verify the total number of records
SELECT COUNT(*) AS TotalRecords
FROM dbo.RetailSales;
-- Overall Business Performance
SELECT
    ROUND(SUM(Sales), 2) AS TotalRevenue,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    COUNT(DISTINCT Order_ID) AS TotalOrders,
    SUM(Quantity) AS TotalQuantity,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)
        AS ProfitMargin
FROM dbo.RetailSales;
-- Sales and Profit by Category
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS TotalRevenue,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    SUM(Quantity) AS TotalQuantity,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)
        AS ProfitMargin
FROM dbo.RetailSales
GROUP BY Category
ORDER BY TotalRevenue DESC;
-- Sales and Profit by Region
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS TotalRevenue,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    COUNT(DISTINCT Order_ID) AS TotalOrders,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)
        AS ProfitMargin
FROM dbo.RetailSales
GROUP BY Region
ORDER BY TotalRevenue DESC;

-- Monthly Sales Trends
SELECT
    YEAR(Order_Date) AS SalesYear,
    MONTH(Order_Date) AS SalesMonth,
    ROUND(SUM(Sales), 2) AS TotalRevenue,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    COUNT(DISTINCT Order_ID) AS TotalOrders
FROM dbo.RetailSales
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY SalesYear, SalesMonth;

-- Top 10 Products by Revenue
SELECT TOP 10
    Product_Name,
    ROUND(SUM(Sales), 2) AS TotalRevenue,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    SUM(Quantity) AS TotalQuantity
FROM dbo.RetailSales
GROUP BY Product_Name
ORDER BY TotalRevenue DESC;