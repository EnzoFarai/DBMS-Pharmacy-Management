-- Insert Sample Data for Pharmacy Management System

-- Insert Suppliers
INSERT INTO Suppliers (Supplier_Name, Contact_Number, Email, Address) VALUES
('MediLife Pharmaceuticals', '+91-9876543210', 'orders@medilife.com', '123 Pharma Park, Mumbai'),
('HealthCare Distributors', '+91-9876543211', 'sales@healthcare.com', '456 Medical Zone, Delhi'),
('Global Drug Suppliers', '+91-9876543212', 'info@globaldrugs.com', '789 Health Street, Bangalore');

-- Insert Medicines
INSERT INTO Medicines (Medicine_Name, Batch_No, Expiry_Date, Quantity, Price_Per_Unit, Supplier_ID, Category) VALUES
('Paracetamol 500mg', 'BATCH001', '2025-12-31', 100, 5.50, 1, 'Analgesic'),
('Amoxicillin 250mg', 'BATCH002', '2025-06-30', 50, 8.75, 2, 'Antibiotic'),
('Vitamin C 100mg', 'BATCH003', '2026-03-15', 200, 2.25, 1, 'Vitamin'),
('Insulin Vial', 'BATCH004', '2025-09-30', 30, 450.00, 3, 'Diabetic'),
('Cetirizine 10mg', 'BATCH005', '2025-11-30', 80, 3.20, 2, 'Antihistamine');

-- Insert Customers
INSERT INTO Customers (Customer_Name, Contact_Number, Email, Address) VALUES
('Rajesh Kumar', '+91-9123456780', 'rajesh@email.com', 'Flat 101, Green Park, Mumbai'),
('Priya Singh', '+91-9123456781', 'priya@email.com', 'House 45, MG Road, Delhi'),
('Amit Patel', '+91-9123456782', 'amit@email.com', 'Plot 23, Sector 15, Bangalore');

-- Insert Sales
INSERT INTO Sales (Customer_ID, Total_Amount, Payment_Method) VALUES
(1, 28.50, 'Cash'),
(2, 465.00, 'Card'),
(3, 15.75, 'Digital'),
(1, 8.25, 'Cash');

-- Insert Sale Details
INSERT INTO Sale_Details (Sale_ID, Medicine_ID, Quantity_Sold, Unit_Price, Total_Price) VALUES
(1, 1, 3, 5.50, 16.50),
(1, 3, 2, 2.25, 4.50),
(1, 5, 1, 3.20, 3.20),
(2, 4, 1, 450.00, 450.00),
(3, 1, 2, 5.50, 11.00),
(3, 3, 1, 2.25, 2.25),
(4, 3, 2, 2.25, 4.50),
(4, 5, 1, 3.20, 3.20);
