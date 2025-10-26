-- Pharmacy Management System Database Schema
-- Created for DBMS Lab Project

CREATE TABLE Suppliers (
    Supplier_ID INT PRIMARY KEY AUTO_INCREMENT,
    Supplier_Name VARCHAR(100) NOT NULL,
    Contact_Number VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT
);

CREATE TABLE Medicines (
    Medicine_ID INT PRIMARY KEY AUTO_INCREMENT,
    Medicine_Name VARCHAR(100) NOT NULL,
    Batch_No VARCHAR(50) NOT NULL,
    Expiry_Date DATE NOT NULL,
    Quantity INT NOT NULL,
    Price_Per_Unit DECIMAL(10,2) NOT NULL,
    Supplier_ID INT,
    Category VARCHAR(50),
    FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID)
);

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(100) NOT NULL,
    Contact_Number VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT
);

CREATE TABLE Sales (
    Sale_ID INT PRIMARY KEY AUTO_INCREMENT,
    Sale_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Customer_ID INT,
    Total_Amount DECIMAL(12,2) NOT NULL,
    Payment_Method VARCHAR(20),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

CREATE TABLE Sale_Details (
    Sale_Detail_ID INT PRIMARY KEY AUTO_INCREMENT,
    Sale_ID INT,
    Medicine_ID INT,
    Quantity_Sold INT NOT NULL,
    Unit_Price DECIMAL(10,2) NOT NULL,
    Total_Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Sale_ID) REFERENCES Sales(Sale_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES Medicines(Medicine_ID)
);
