-- Advanced SQL Queries for Pharmacy Management System

-- Query 1: Complex JOIN - Sales with Customer and Medicine Details
SELECT 
    c.Customer_Name,
    s.Sale_Date,
    m.Medicine_Name,
    sd.Quantity_Sold,
    sd.Unit_Price,
    sd.Total_Price,
    s.Total_Amount AS Sale_Total
FROM Sales s
JOIN Customers c ON s.Customer_ID = c.Customer_ID
JOIN Sale_Details sd ON s.Sale_ID = sd.Sale_ID
JOIN Medicines m ON sd.Medicine_ID = m.Medicine_ID
ORDER BY s.Sale_Date DESC;

-- Query 2: Subquery - Medicines that sold above average quantity
SELECT 
    Medicine_Name,
    Generic_Name,
    Price_Per_Unit,
    (SELECT AVG(Quantity_Sold) FROM Sale_Details) AS Avg_Sold_Quantity
FROM Medicines
WHERE Medicine_ID IN (
    SELECT Medicine_ID 
    FROM Sale_Details 
    GROUP BY Medicine_ID 
    HAVING AVG(Quantity_Sold) > (
        SELECT AVG(Quantity_Sold) FROM Sale_Details
    )
);

-- Query 3: Monthly Sales Report
SELECT 
    YEAR(Sale_Date) AS Year,
    MONTH(Sale_Date) AS Month,
    COUNT(Sale_ID) AS Total_Sales,
    SUM(Total_Amount) AS Monthly_Revenue,
    AVG(Total_Amount) AS Avg_Sale_Value
FROM Sales
GROUP BY YEAR(Sale_Date), MONTH(Sale_Date)
ORDER BY Year DESC, Month DESC;

-- Query 4: Customer Loyalty Analysis (Customers with multiple purchases)
SELECT 
    c.Customer_Name,
    COUNT(s.Sale_ID) AS Purchase_Count,
    SUM(s.Total_Amount) AS Total_Spent,
    AVG(s.Total_Amount) AS Avg_Purchase_Value
FROM Customers c
JOIN Sales s ON c.Customer_ID = s.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
HAVING COUNT(s.Sale_ID) > 1
ORDER BY Total_Spent DESC;

-- Query 5: Stock Value Analysis
SELECT 
    Category,
    COUNT(Medicine_ID) AS Medicine_Count,
    SUM(Quantity) AS Total_Stock,
    SUM(Quantity * Price_Per_Unit) AS Total_Stock_Value,
    AVG(Price_Per_Unit) AS Avg_Price
FROM Medicines
GROUP BY Category
ORDER BY Total_Stock_Value DESC;

-- Query 6: Expiry Analysis by Month
SELECT 
    YEAR(Expiry_Date) AS Year,
    MONTH(Expiry_Date) AS Month,
    COUNT(Medicine_ID) AS Medicines_Expiring,
    SUM(Quantity) AS Total_Quantity,
    SUM(Quantity * Price_Per_Unit) AS Total_Value
FROM Medicines
WHERE Expiry_Date > CURDATE()
GROUP BY YEAR(Expiry_Date), MONTH(Expiry_Date)
ORDER BY Year, Month;

-- Query 7: Supplier-wise Medicine Analysis
SELECT 
    s.Supplier_Name,
    m.Category,
    COUNT(m.Medicine_ID) AS Medicine_Count,
    SUM(m.Quantity) AS Total_Stock,
    ROUND(AVG(m.Price_Per_Unit), 2) AS Average_Price
FROM Suppliers s
JOIN Medicines m ON s.Supplier_ID = m.Supplier_ID
GROUP BY s.Supplier_Name, m.Category
ORDER BY s.Supplier_Name, Total_Stock DESC;
