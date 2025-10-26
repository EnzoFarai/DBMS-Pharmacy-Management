-- Pharmacy Management System - Complete Database Backup
-- Generated on: 2024-01-20
-- Database: MySQL 8.0
-- Purpose: Complete database restoration for Pharmacy Management System

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;

-- --------------------------------------------------------
-- Database: pharmacy_management
-- --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS `pharmacy_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `pharmacy_management`;

-- --------------------------------------------------------
-- Table structure for table `Suppliers`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `Suppliers`;
CREATE TABLE `Suppliers` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
-- Table structure for table `Medicines`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `Medicines`;
CREATE TABLE `Medicines` (
  `medicine_id` int NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(100) NOT NULL,
  `batch_number` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL,
  `quantity` int NOT NULL,
  `price_per_unit` decimal(10,2) NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`medicine_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `idx_medicine_expiry` (`expiry_date`),
  KEY `idx_medicine_supplier` (`supplier_id`),
  CONSTRAINT `Medicines_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `Suppliers` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
-- Table structure for table `Customers`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text,
  `date_of_birth` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
-- Table structure for table `Sales`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `Sales`;
CREATE TABLE `Sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `sale_date` date NOT NULL,
  `customer_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `idx_sale_date` (`sale_date`),
  KEY `idx_sale_customer` (`customer_id`),
  CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
-- Table structure for table `Sale_Details`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `Sale_Details`;
CREATE TABLE `Sale_Details` (
  `sale_detail_id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int DEFAULT NULL,
  `medicine_id` int DEFAULT NULL,
  `quantity_sold` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`sale_detail_id`),
  KEY `sale_id` (`sale_id`),
  KEY `medicine_id` (`medicine_id`),
  CONSTRAINT `Sale_Details_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `Sales` (`sale_id`),
  CONSTRAINT `Sale_Details_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `Medicines` (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
-- Table structure for table `Prescriptions`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `Prescriptions`;
CREATE TABLE `Prescriptions` (
  `prescription_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `doctor_name` varchar(100) DEFAULT NULL,
  `diagnosis` text,
  `prescription_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`prescription_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `Prescriptions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
-- Dumping data for table `Suppliers`
-- --------------------------------------------------------

INSERT INTO `Suppliers` (`supplier_id`, `supplier_name`, `contact_number`, `email`, `address`, `created_at`) VALUES
(1, 'MediCorp Pharmaceuticals', '+91-9876543210', 'orders@medicorp.com', '123 Pharma Street, Mumbai', '2024-01-20 10:00:00'),
(2, 'HealthPlus Suppliers', '+91-9876543211', 'contact@healthplus.com', '456 Medical Road, Delhi', '2024-01-20 10:00:00'),
(3, 'BioGen Meds', '+91-9876543212', 'sales@biogen.com', '789 Health Avenue, Bangalore', '2024-01-20 10:00:00');

-- --------------------------------------------------------
-- Dumping data for table `Medicines`
-- --------------------------------------------------------

INSERT INTO `Medicines` (`medicine_id`, `medicine_name`, `batch_number`, `expiry_date`, `quantity`, `price_per_unit`, `supplier_id`, `category`, `created_at`) VALUES
(1, 'Paracetamol', 'BATCH001', '2025-12-31', 92, 15.50, 1, 'Pain Relief', '2024-01-20 10:00:00'),
(2, 'Amoxicillin', 'BATCH002', '2024-10-15', 49, 45.00, 2, 'Antibiotic', '2024-01-20 10:00:00'),
(3, 'Vitamin C', 'BATCH003', '2026-05-20', 197, 25.75, 1, 'Supplement', '2024-01-20 10:00:00'),
(4, 'Ibuprofen', 'BATCH004', '2025-08-30', 74, 32.00, 3, 'Pain Relief', '2024-01-20 10:00:00'),
(5, 'Cetirizine', 'BATCH005', '2024-12-31', 141, 18.25, 2, 'Allergy', '2024-01-20 10:00:00');

-- --------------------------------------------------------
-- Dumping data for table `Customers`
-- --------------------------------------------------------

INSERT INTO `Customers` (`customer_id`, `customer_name`, `contact_number`, `email`, `address`, `date_of_birth`, `created_at`) VALUES
(1, 'Rahul Sharma', '+91-9876543201', 'rahul@gmail.com', '101 MG Road, Pune', '1985-03-15', '2024-01-20 10:00:00'),
(2, 'Priya Patel', '+91-9876543202', 'priya@yahoo.com', '202 Lake View, Mumbai', '1990-07-22', '2024-01-20 10:00:00'),
(3, 'Amit Kumar', '+91-9876543203', 'amit@hotmail.com', '303 Hill Road, Delhi', '1978-11-08', '2024-01-20 10:00:00');

-- --------------------------------------------------------
-- Dumping data for table `Sales`
-- --------------------------------------------------------

INSERT INTO `Sales` (`sale_id`, `sale_date`, `customer_id`, `total_amount`, `payment_method`, `created_at`) VALUES
(1, '2024-01-15', 1, 125.50, 'Cash', '2024-01-20 10:00:00'),
(2, '2024-01-16', 2, 89.75, 'Card', '2024-01-20 10:00:00'),
(3, '2024-01-17', 3, 215.25, 'Cash', '2024-01-20 10:00:00'),
(4, '2024-01-18', 1, 67.00, 'Card', '2024-01-20 10:00:00');

-- --------------------------------------------------------
-- Dumping data for table `Sale_Details`
-- --------------------------------------------------------

INSERT INTO `Sale_Details` (`sale_detail_id`, `sale_id`, `medicine_id`, `quantity_sold`, `unit_price`, `total_price`) VALUES
(1, 1, 1, 2, 15.50, 31.00),
(2, 1, 3, 1, 25.75, 25.75),
(3, 1, 5, 3, 18.25, 54.75),
(4, 2, 2, 1, 45.00, 45.00),
(5, 2, 4, 1, 32.00, 32.00),
(6, 3, 1, 5, 15.50, 77.50),
(7, 3, 3, 2, 25.75, 51.50),
(8, 3, 5, 4, 18.25, 73.00),
(9, 4, 1, 1, 15.50, 15.50),
(10, 4, 5, 2, 18.25, 36.50);

-- --------------------------------------------------------
-- Dumping data for table `Prescriptions`
-- --------------------------------------------------------

INSERT INTO `Prescriptions` (`prescription_id`, `customer_id`, `doctor_name`, `diagnosis`, `prescription_date`, `created_at`) VALUES
(1, 1, 'Dr. Mehta', 'Fever and headache', '2024-01-14', '2024-01-20 10:00:00'),
(2, 2, 'Dr. Singh', 'Allergic rhinitis', '2024-01-15', '2024-01-20 10:00:00'),
(3, 3, 'Dr. Reddy', 'Bacterial infection', '2024-01-16', '2024-01-20 10:00:00');

-- --------------------------------------------------------
-- Views for analytical reporting
-- --------------------------------------------------------

DROP VIEW IF EXISTS `ExpiringMedicinesView`;
CREATE VIEW `ExpiringMedicinesView` AS
SELECT 
    medicine_id,
    medicine_name,
    batch_number,
    expiry_date,
    quantity,
    DATEDIFF(expiry_date, CURDATE()) AS days_until_expiry
FROM Medicines
WHERE expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

DROP VIEW IF EXISTS `TopSellingMedicinesView`;
CREATE VIEW `TopSellingMedicinesView` AS
SELECT 
    m.medicine_name,
    SUM(sd.quantity_sold) AS total_quantity_sold,
    SUM(sd.total_price) AS total_revenue
FROM Medicines m
JOIN Sale_Details sd ON m.medicine_id = sd.medicine_id
GROUP BY m.medicine_id, m.medicine_name
ORDER BY total_quantity_sold DESC;

DROP VIEW IF EXISTS `SupplierPerformanceView`;
CREATE VIEW `SupplierPerformanceView` AS
SELECT 
    s.supplier_name,
    COUNT(m.medicine_id) AS medicines_supplied,
    SUM(m.quantity) AS total_stock,
    AVG(m.price_per_unit) AS average_price
FROM Suppliers s
LEFT JOIN Medicines m ON s.supplier_id = m.supplier_id
GROUP BY s.supplier_id, s.supplier_name;

DROP VIEW IF EXISTS `CustomerPurchaseHistory`;
CREATE VIEW `CustomerPurchaseHistory` AS
SELECT 
    c.customer_name,
    c.contact_number,
    COUNT(s.sale_id) AS total_purchases,
    SUM(s.total_amount) AS total_spent,
    MAX(s.sale_date) AS last_purchase_date
FROM Customers c
LEFT JOIN Sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name, c.contact_number;

DROP VIEW IF EXISTS `LowStockAlert`;
CREATE VIEW `LowStockAlert` AS
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

-- --------------------------------------------------------
-- Triggers for business logic automation
-- --------------------------------------------------------

DROP TRIGGER IF EXISTS `UpdateStockAfterSale`;
DELIMITER //
CREATE TRIGGER `UpdateStockAfterSale`
AFTER INSERT ON `Sale_Details`
FOR EACH ROW
BEGIN
    UPDATE Medicines 
    SET quantity = quantity - NEW.quantity_sold
    WHERE medicine_id = NEW.medicine_id;
END//
DELIMITER ;

DROP TRIGGER IF EXISTS `PreventExpiredMedicineSale`;
DELIMITER //
CREATE TRIGGER `PreventExpiredMedicineSale`
BEFORE INSERT ON `Sale_Details`
FOR EACH ROW
BEGIN
    DECLARE medicine_expiry DATE;
    DECLARE medicine_quantity INT;
    
    SELECT expiry_date, quantity INTO medicine_expiry, medicine_quantity
    FROM Medicines 
    WHERE medicine_id = NEW.medicine_id;
    
    IF medicine_expiry < CURDATE() THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot sell expired medicine';
    END IF;
    
    IF NEW.quantity_sold > medicine_quantity THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Insufficient stock available';
    END IF;
END//
DELIMITER ;

-- --------------------------------------------------------
-- Sample analytical queries for demonstration
-- --------------------------------------------------------

-- Query: Get all medicines with supplier information
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

-- Query: Sales report with customer details
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

-- Query: Monthly sales summary
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    COUNT(*) AS total_sales,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_sale
FROM Sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year DESC, month DESC;

-- --------------------------------------------------------
-- Database statistics and information
-- --------------------------------------------------------

SELECT 
    TABLE_NAME,
    TABLE_ROWS AS 'Number of Records',
    DATA_LENGTH AS 'Data Size (Bytes)',
    INDEX_LENGTH AS 'Index Size (Bytes)'
FROM information_schema.TABLES 
WHERE TABLE_SCHEMA = 'pharmacy_management';

-- Display table relationships
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'pharmacy_management' 
AND REFERENCED_TABLE_NAME IS NOT NULL;

SET FOREIGN_KEY_CHECKS=1;
COMMIT;

-- --------------------------------------------------------
-- Backup completion message
-- --------------------------------------------------------

SELECT 'Pharmacy Management Database Backup Completed Successfully!' AS Backup_Status;
