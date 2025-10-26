-- Query 1: Get all medicines with supplier information
SELECT 
    m.medicine_name,
    m.batch_number,
    m.expiry_date,
    m.quantity,
    m.price_per_unit,
    s.supplier_name,
    s.contact_number
FROM Medicines m
JOIN Suppliers s ON m.supplier_id = s.supplier_id
ORDER BY m.medicine_name;

-- Query 2: Sales report with customer details
SELECT 
    s.sale_id,
    s.sale_date,
    c.customer_name,
    s.total_amount,
    s.payment_method,
    GROUP_CONCAT(m.medicine_name SEPARATOR ', ') AS medicines_purchased
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
JOIN Sale_Details sd ON s.sale_id = sd.sale_id
JOIN Medicines m ON sd.medicine_id = m.medicine_id
GROUP BY s.sale_id, s.sale_date, c.customer_name, s.total_amount, s.payment_method;

-- Query 3: Medicines expiring in next 30 days
SELECT * FROM ExpiringMedicinesView
WHERE days_until_expiry > 0
ORDER BY days_until_expiry ASC;

-- Query 4: Top 5 best-selling medicines
SELECT * FROM TopSellingMedicinesView
LIMIT 5;

-- Query 5: Monthly sales summary
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    COUNT(*) AS total_sales,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_sale
FROM Sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year DESC, month DESC;

-- Query 6: Customer loyalty analysis
SELECT 
    customer_name,
    total_purchases,
    total_spent,
    last_purchase_date
FROM CustomerPurchaseHistory
WHERE total_purchases > 0
ORDER BY total_spent DESC;

-- Query 7: Low stock alerts
SELECT * FROM LowStockAlert
WHERE stock_status IN ('Critical', 'Low')
ORDER BY stock_status, quantity ASC;

-- Query 8: Supplier performance report
SELECT * FROM SupplierPerformanceView
ORDER BY medicines_supplied DESC;
