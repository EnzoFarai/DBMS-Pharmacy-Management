-- Insert Sample Data for Pharmacy Management System

-- Insert Suppliers
INSERT INTO Suppliers (Supplier_Name, Contact_Number, Email, Address) VALUES
('MediLife Pharmaceuticals', '+91-9876543210', 'orders@medilife.com', '123 Pharma Park, Mumbai'),
('HealthCare Distributors', '+91-9876543211', 'sales@healthcare.com', '456 Medical Zone, Delhi'),
('Global Drug Suppliers', '+91-9876543212', 'info@globaldrugs.com', '789 Health Street, Bangalore'),
('Apollo Medicines', '+91-9876543213', 'supply@apollo.com', '321 Hospital Road, Chennai');

-- Insert Medicines
INSERT INTO Medicines (Medicine_Name, Generic_Name, Batch_No, Expiry_Date, Quantity, Price_Per_Unit, Supplier_ID, Category) VALUES
('Paracetamol 500mg', 'Paracetamol', 'BATCH001', '2025-12-31', 100, 5.50, 1, 'Analgesic'),
('Amoxicillin 250mg', 'Amoxicillin', 'BATCH002', '2025-06-30', 50, 8.75, 2, 'Antibiotic'),
('Vitamin C 100mg', 'Ascorbic Acid', 'BATCH003', '2026-03-15', 200, 2.25, 1, 'Vitamin'),
('Insulin Vial', 'Insulin', 'BATCH004', '2025-09-30', 30, 450.00, 3, 'Diabetic'),
('Cetirizine 10mg', 'Cetirizine', 'BATCH005', '2025-11-30', 80, 3.20, 4, 'Antihistamine'),
('Omeprazole 20mg', 'Omeprazole', 'BATCH006', '2025-08-31', 60, 12.50, 2, 'Antacid'),
('Aspirin 75mg', 'Acetylsalicylic Acid', 'BATCH007', '2026-01-31', 150, 4.80, 1, 'Blood Thinner');

-- Insert Customers
INSERT INTO Customers (Customer_Name, Contact_Number, Email, Address) VALUES
('Rajesh Kumar', '+91-9123456780', 'rajesh@email.com', 'Flat 101, Green Park, Mumbai'),
('Priya Singh', '+91-9123456781', 'priya@email.com', 'House 45, MG Road, Delhi'),
('Amit Patel', '+91-9123456782', 'amit@email.com', 'Plot 23, Sector 15, Bangalore'),
('Sneha Sharma', '+91-9123456783', 'sneha@email.com', 'Flat 302, Lake View, Chennai'),
('Vikram Mehta', '+91-9123456784', 'vikram@email.com', 'House 78, Hill Road, Pune');

-- Insert Sales
INSERT INTO Sales (Sale_Date, Customer_ID, Total_Amount, Payment_Method) VALUES
('2024-01-15 10:30:00', 1, 28.50, 'Cash'),
('2024-01-15 14:20:00', 2, 465.00, 'Card'),
('2024-01-16 09:15:00', 3, 15.75, 'Digital'),
('2024-01-16 11:45:00', 1, 8.25, 'Cash'),
('2024-01-17 16:30:00', 4, 450.00, 'Card');

-- Insert Sale Details
INSERT INTO Sale_Details (Sale_ID, Medicine_ID, Quantity_Sold, Unit_Price, Total_Price) VALUES
(1, 1, 3, 5.50, 16.50),  -- Paracetamol
(1, 3, 2, 2.25, 4.50),   -- Vitamin C
(1, 5, 1, 3.20, 3.20),   -- Cetirizine
(2, 4, 1, 450.00, 450.00), -- Insulin
(2, 6, 1, 12.50, 12.50), -- Omeprazole
(3, 1, 2, 5.50, 11.00),  -- Paracetamol
(3, 3, 1, 2.25, 2.25),   -- Vitamin C
(4, 3, 2, 2.25, 4.50),   -- Vitamin C
(4, 5, 1, 3.20, 3.20),   -- Cetirizine
(5, 4, 1, 450.00, 450.00); -- Insulin

-- Insert Purchase Orders
INSERT INTO Purchase_Orders (Supplier_ID, Order_Date, Total_Amount, Status) VALUES
(1, '2024-01-10', 2500.00, 'Completed'),
(2, '2024-01-12', 1800.50, 'Completed'),
(3, '2024-01-14', 5000.00, 'Pending'),
(4, '2024-01-08', 1200.75, 'Completed');
