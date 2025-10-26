-- Advanced SQL Queries for Pharmacy Management System

-- Query 1: Show all medicines with supplier info
SELECT 
    m.Medicine_Name,
    m.Quantity,
    m.Price_Per_Unit,
    m.Category,
    s.Supplier_Name
FROM Medicines m
JOIN Suppliers s ON m.Supplier_ID = s.Supplier_ID;

-- Query 2: Show sales with customer details
SELECT 
    c.Customer_Name,
    s.Sale_Date,
    s.Total_Amount,
    s.Payment_Method
FROM Sales s
JOIN Customers c ON s.Customer_ID = c.Customer_ID
ORDER BY s.Sale_Date DESC;

-- Query 3: Show detailed sales with medicine info
SELECT 
    c.Customer_Name,
    m.Medicine_Name,
    sd.Quantity_Sold,
    sd.Unit_Price,
    sd.Total_Price,
    s.Sale_Date
FROM Sales s
JOIN Customers c ON s.Customer_ID = c.Customer_ID
JOIN Sale_Details sd ON s.Sale_ID = sd.Sale_ID
JOIN Medicines m ON sd.Medicine_ID = m.Medicine_ID;

-- Query 4: Top selling medicines
SELECT 
    m.Medicine_Name,
    SUM(sd.Quantity_Sold) as Total_Sold,
    SUM(sd.Total_Price) as Total_Revenue
FROM Medicines m
JOIN Sale_Details sd ON m.Medicine_ID = sd.Medicine_ID
GROUP BY m.Medicine_ID, m.Medicine_Name
ORDER BY Total_Sold DESC;

-- Query 5: Customer spending analysis
SELECT 
    c.Customer_Name,
    COUNT(s.Sale_ID) as Purchase_Count,
    SUM(s.Total_Amount) as Total_Spent,
    AVG(s.Total_Amount) as Avg_Purchase
FROM Customers c
JOIN Sales s ON c.Customer_ID = s.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Spent DESC;

-- Query 6: Stock value by category
SELECT 
    Category,
    COUNT(Medicine_ID) as Medicine_Count,
    SUM(Quantity) as Total_Stock,
    SUM(Quantity * Price_Per_Unit) as Total_Value
FROM Medicines
GROUP BY Category
ORDER BY Total_Value DESC;

-- Query 7: Expiring medicines (within 6 months)
SELECT 
    Medicine_Name,
    Expiry_Date,
    Quantity,
    Price_Per_Unit
FROM Medicines
WHERE Expiry_Date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 6 MONTH)
ORDER BY Expiry_Date ASC;
