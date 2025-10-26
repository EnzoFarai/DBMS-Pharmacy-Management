-- Insert sample data for Suppliers
INSERT INTO Suppliers (supplier_name, contact_number, email, address) VALUES
('MediCorp Pharmaceuticals', '+91-9876543210', 'orders@medicorp.com', '123 Pharma Street, Mumbai'),
('HealthPlus Suppliers', '+91-9876543211', 'contact@healthplus.com', '456 Medical Road, Delhi'),
('BioGen Meds', '+91-9876543212', 'sales@biogen.com', '789 Health Avenue, Bangalore');

-- Insert sample data for Medicines
INSERT INTO Medicines (medicine_name, batch_number, expiry_date, quantity, price_per_unit, supplier_id, category) VALUES
('Paracetamol', 'BATCH001', '2025-12-31', 100, 15.50, 1, 'Pain Relief'),
('Amoxicillin', 'BATCH002', '2024-10-15', 50, 45.00, 2, 'Antibiotic'),
('Vitamin C', 'BATCH003', '2026-05-20', 200, 25.75, 1, 'Supplement'),
('Ibuprofen', 'BATCH004', '2025-08-30', 75, 32.00, 3, 'Pain Relief'),
('Cetirizine', 'BATCH005', '2024-12-31', 150, 18.25, 2, 'Allergy');

-- Insert sample data for Customers
INSERT INTO Customers (customer_name, contact_number, email, address, date_of_birth) VALUES
('Rahul Sharma', '+91-9876543201', 'rahul@gmail.com', '101 MG Road, Pune', '1985-03-15'),
('Priya Patel', '+91-9876543202', 'priya@yahoo.com', '202 Lake View, Mumbai', '1990-07-22'),
('Amit Kumar', '+91-9876543203', 'amit@hotmail.com', '303 Hill Road, Delhi', '1978-11-08');

-- Insert sample data for Sales
INSERT INTO Sales (sale_date, customer_id, total_amount, payment_method) VALUES
('2024-01-15', 1, 125.50, 'Cash'),
('2024-01-16', 2, 89.75, 'Card'),
('2024-01-17', 3, 215.25, 'Cash'),
('2024-01-18', 1, 67.00, 'Card');

-- Insert sample data for Sale_Details
INSERT INTO Sale_Details (sale_id, medicine_id, quantity_sold, unit_price, total_price) VALUES
(1, 1, 2, 15.50, 31.00),
(1, 3, 1, 25.75, 25.75),
(1, 5, 3, 18.25, 54.75),
(2, 2, 1, 45.00, 45.00),
(2, 4, 1, 32.00, 32.00),
(3, 1, 5, 15.50, 77.50),
(3, 3, 2, 25.75, 51.50),
(3, 5, 4, 18.25, 73.00),
(4, 1, 1, 15.50, 15.50),
(4, 5, 2, 18.25, 36.50);

-- Insert sample data for Prescriptions
INSERT INTO Prescriptions (customer_id, doctor_name, diagnosis, prescription_date) VALUES
(1, 'Dr. Mehta', 'Fever and headache', '2024-01-14'),
(2, 'Dr. Singh', 'Allergic rhinitis', '2024-01-15'),
(3, 'Dr. Reddy', 'Bacterial infection', '2024-01-16');
