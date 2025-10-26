-- Important Views for Pharmacy Management System

-- View 1: Low Stock Medicines
CREATE VIEW LowStockMedicines AS
SELECT 
    Medicine_Name,
    Quantity,
    Price_Per_Unit,
    Category
FROM Medicines
WHERE Quantity < 60
ORDER BY Quantity ASC;

-- View 2: Supplier Summary
CREATE VIEW SupplierSummary AS
SELECT 
    s.Supplier_Name,
    COUNT(m.Medicine_ID) as Medicine_Count,
    SUM(m.Quantity) as Total_Stock
FROM Suppliers s
LEFT JOIN Medicines m ON s.Supplier_ID = m.Supplier_ID
GROUP BY s.Supplier_Name;

-- View 3: Customer Purchase Summary
CREATE VIEW CustomerPurchaseSummary AS
SELECT 
    c.Customer_Name,
    COUNT(s.Sale_ID) as Total_Purchases,
    SUM(s.Total_Amount) as Total_Spent
FROM Customers c
LEFT JOIN Sales s ON c.Customer_ID = s.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name;

-- View 4: Medicine Sales Summary
CREATE VIEW MedicineSalesSummary AS
SELECT 
    m.Medicine_Name,
    SUM(sd.Quantity_Sold) as Total_Sold,
    SUM(sd.Total_Price) as Total_Revenue
FROM Medicines m
JOIN Sale_Details sd ON m.Medicine_ID = sd.Medicine_ID
GROUP BY m.Medicine_ID, m.Medicine_Name;
