-- Important Views for Pharmacy Management System

-- View 1: Expiring Medicines (within 60 days)
CREATE OR REPLACE VIEW ExpiringMedicinesView AS
SELECT 
    Medicine_ID,
    Medicine_Name,
    Batch_No,
    Expiry_Date,
    Quantity,
    Price_Per_Unit,
    DATEDIFF(Expiry_Date, CURDATE()) AS Days_Until_Expiry
FROM Medicines
WHERE Expiry_Date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 60 DAY)
ORDER BY Expiry_Date ASC;

-- View 2: Low Stock Medicines (less than 20 units)
CREATE OR REPLACE VIEW LowStockMedicinesView AS
SELECT 
    m.Medicine_ID,
    m.Medicine_Name,
    m.Quantity,
    m.Price_Per_Unit,
    s.Supplier_Name,
    s.Contact_Number
FROM Medicines m
JOIN Suppliers s ON m.Supplier_ID = s.Supplier_ID
WHERE m.Quantity < 20
ORDER BY m.Quantity ASC;

-- View 3: Top Selling Medicines
CREATE OR REPLACE VIEW TopSellingMedicinesView AS
SELECT 
    m.Medicine_ID,
    m.Medicine_Name,
    SUM(sd.Quantity_Sold) AS Total_Quantity_Sold,
    SUM(sd.Total_Price) AS Total_Revenue,
    COUNT(DISTINCT sd.Sale_ID) AS Times_Sold
FROM Medicines m
JOIN Sale_Details sd ON m.Medicine_ID = sd.Medicine_ID
GROUP BY m.Medicine_ID, m.Medicine_Name
ORDER BY Total_Quantity_Sold DESC;

-- View 4: Customer Purchase History
CREATE OR REPLACE VIEW CustomerPurchaseHistory AS
SELECT 
    c.Customer_ID,
    c.Customer_Name,
    c.Contact_Number,
    COUNT(s.Sale_ID) AS Total_Purchases,
    SUM(s.Total_Amount) AS Total_Spent,
    MAX(s.Sale_Date) AS Last_Purchase_Date
FROM Customers c
LEFT JOIN Sales s ON c.Customer_ID = s.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name, c.Contact_Number
ORDER BY Total_Spent DESC;

-- View 5: Supplier Performance
CREATE OR REPLACE VIEW SupplierPerformanceView AS
SELECT 
    s.Supplier_ID,
    s.Supplier_Name,
    s.Contact_Number,
    COUNT(m.Medicine_ID) AS Medicines_Supplied,
    SUM(m.Quantity) AS Total_Stock,
    AVG(m.Price_Per_Unit) AS Average_Price
FROM Suppliers s
LEFT JOIN Medicines m ON s.Supplier_ID = m.Supplier_ID
GROUP BY s.Supplier_ID, s.Supplier_Name, s.Contact_Number
ORDER BY Medicines_Supplied DESC;

-- View 6: Daily Sales Summary
CREATE OR REPLACE VIEW DailySalesSummary AS
SELECT 
    DATE(Sale_Date) AS Sale_Day,
    COUNT(Sale_ID) AS Total_Transactions,
    SUM(Total_Amount) AS Daily_Revenue,
    AVG(Total_Amount) AS Average_Transaction_Value
FROM Sales
GROUP BY DATE(Sale_Date)
ORDER BY Sale_Day DESC;
