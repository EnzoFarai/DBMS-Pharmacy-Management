-- Pharmacy Management System Database Schema
-- Created for DBMS Lab Project

CREATE DATABASE IF NOT EXISTS PharmacyManagement;
USE PharmacyManagement;

-- Suppliers Table
CREATE TABLE Suppliers (
    Supplier_ID INT PRIMARY KEY AUTO_INCREMENT,
    Supplier_Name VARCHAR(100) NOT NULL,
    Contact_Number VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT,
    Registration_Date DATE DEFAULT CURRENT_DATE
);

-- Medicines Table
CREATE TABLE Medicines (
    Medicine_ID INT PRIMARY KEY AUTO_INCREMENT,
    Medicine_Name VARCHAR(100) NOT NULL,
    Generic_Name VARCHAR(100),
    Batch_No VARCHAR(50) NOT NULL,
    Expiry_Date DATE NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    Price_Per_Unit DECIMAL(10,2) NOT NULL CHECK (Price_Per_Unit > 0),
    Supplier_ID INT,
    Category VARCHAR(50),
    CONSTRAINT fk_medicine_supplier FOREIGN KEY (Supplier_ID) 
    REFERENCES Suppliers(Supplier_ID) ON DELETE SET NULL
);

-- Customers Table
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(100) NOT NULL,
    Contact_Number VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT,
    Registration_Date DATE DEFAULT CURRENT_DATE
);

-- Sales Table
CREATE TABLE Sales (
    Sale_ID INT PRIMARY KEY AUTO_INCREMENT,
    Sale_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Customer_ID INT,
    Total_Amount DECIMAL(12,2) NOT NULL,
    Payment_Method ENUM('Cash', 'Card', 'Digital'),
    CONSTRAINT fk_sale_customer FOREIGN KEY (Customer_ID) 
    REFERENCES Customers(Customer_ID) ON DELETE SET NULL
);

-- Sale Details Table
CREATE TABLE Sale_Details (
    Sale_Detail_ID INT PRIMARY KEY AUTO_INCREMENT,
    Sale_ID INT,
    Medicine_ID INT,
    Quantity_Sold INT NOT NULL CHECK (Quantity_Sold > 0),
    Unit_Price DECIMAL(10,2) NOT NULL,
    Total_Price DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_saledetail_sale FOREIGN KEY (Sale_ID) 
    REFERENCES Sales(Sale_ID) ON DELETE CASCADE,
    CONSTRAINT fk_saledetail_medicine FOREIGN KEY (Medicine_ID) 
    REFERENCES Medicines(Medicine_ID) ON DELETE CASCADE
);

-- Purchase Orders Table
CREATE TABLE Purchase_Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Supplier_ID INT,
    Order_Date DATE DEFAULT CURRENT_DATE,
    Total_Amount DECIMAL(12,2),
    Status ENUM('Pending', 'Completed', 'Cancelled') DEFAULT 'Pending',
    CONSTRAINT fk_order_supplier FOREIGN KEY (Supplier_ID) 
    REFERENCES Suppliers(Supplier_ID)
);

-- Create indexes for better performance
CREATE INDEX idx_medicine_expiry ON Medicines(Expiry_Date);
CREATE INDEX idx_medicine_supplier ON Medicines(Supplier_ID);
CREATE INDEX idx_sale_date ON Sales(Sale_Date);
CREATE INDEX idx_sale_customer ON Sales(Customer_ID);
