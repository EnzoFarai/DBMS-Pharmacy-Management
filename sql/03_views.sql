-- View 1: Expiring Medicines (within 30 days)
CREATE VIEW ExpiringMedicinesView AS
SELECT 
    medicine_id,
    medicine_name,
    batch_number,
    expiry_date,
    quantity,
    DATEDIFF(expiry_date, CURDATE()) AS days_until_expiry
FROM Medicines
WHERE expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

-- View 2: Top Selling Medicines
CREATE VIEW TopSellingMedicinesView AS
SELECT 
    m.medicine_name,
    SUM(sd.quantity_sold) AS total_quantity_sold,
    SUM(sd.total_price) AS total_revenue
FROM Medicines m
JOIN Sale_Details sd ON m.medicine_id = sd.medicine_id
GROUP BY m.medicine_id, m.medicine_name
ORDER BY total_quantity_sold DESC;

-- View 3: Supplier Performance
CREATE VIEW SupplierPerformanceView AS
SELECT 
    s.supplier_name,
    COUNT(m.medicine_id) AS medicines_supplied,
    SUM(m.quantity) AS total_stock,
    AVG(m.price_per_unit) AS average_price
FROM Suppliers s
LEFT JOIN Medicines m ON s.supplier_id = m.supplier_id
GROUP BY s.supplier_id, s.supplier_name;

-- View 4: Customer Purchase History
CREATE VIEW CustomerPurchaseHistory AS
SELECT 
    c.customer_name,
    c.contact_number,
    COUNT(s.sale_id) AS total_purchases,
    SUM(s.total_amount) AS total_spent,
    MAX(s.sale_date) AS last_purchase_date
FROM Customers c
LEFT JOIN Sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name, c.contact_number;

-- View 5: Low Stock Alert
CREATE VIEW LowStockAlert AS
SELECT 
    medicine_name,
    quantity,
    CASE 
        WHEN quantity < 20 THEN 'Critical'
        WHEN quantity < 50 THEN 'Low'
        ELSE 'Adequate'
    END AS stock_status
FROM Medicines
WHERE quantity < 50;
