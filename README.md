# 🏥 Pharmacy Management System

A comprehensive **Database Management System** designed for modern pharmacy operations, developed as part of the **DBMS Lab academic curriculum**. This system efficiently manages pharmaceutical inventory, sales, customer relationships, and supplier information with robust data integrity and automated reporting capabilities.

## 📋 Table of Contents
- [Project Overview](#-project-overview)
- [Key Features](#-key-features)
- [Technology Stack](#-technology-stack)
- [Database Schema](#-database-schema)
- [Installation & Setup](#-installation--setup)
- [Usage Examples](#-usage-examples)
- [Sample Queries & Results](#-sample-queries--results)
- [Project Structure](#-project-structure)
- [Academic Compliance](#-academic-compliance)
- [Contributors](#-contributors)
- [License](#-license)

## 🎯 Project Overview

The **Pharmacy Management System** addresses critical challenges faced by pharmaceutical retail operations through an integrated database solution. Traditional pharmacies often struggle with manual record-keeping, inventory tracking, expiry management, and sales reporting. This system provides a centralized platform that automates these processes while ensuring data consistency and business intelligence.

### 🎓 **Academic Context**
- **Name**: Farai Edwin Masawi 
- **Course**: Database Management Systems (DBMS) Lab
- **University**: Chandigarh University 
- **Semester**: 3
- **Instructor**: Simran Pandey

### 🚀 **Business Problem Solved**
- **Manual Inventory Tracking**: Automated stock management with real-time updates
- **Expired Medicine Management**: Proactive expiry date monitoring and alerts
- **Sales Analysis**: Comprehensive reporting on product performance and revenue
- **Customer Relationship Management**: Prescription history and purchase patterns
- **Supplier Management**: Vendor performance and supply chain optimization

## ✨ Key Features

### 📊 **Inventory Management**
- **Real-time Stock Tracking**: Automatic quantity updates after each sale
- **Expiry Date Monitoring**: Alerts for medicines nearing expiration
- **Batch Number Tracking**: Complete traceability for all pharmaceutical products
- **Category-based Organization**: Systematic classification of medicines
- **Low Stock Alerts**: Automated notifications for inventory replenishment

### 💰 **Sales & Billing System**
- **Automated Invoice Generation**: Complete sales transaction processing
- **Multiple Payment Methods**: Support for cash, card, and digital payments
- **Prescription Integration**: Link sales with doctor prescriptions
- **Tax Calculation**: Built-in financial computations
- **Receipt Management**: Complete transaction history

### 👥 **Customer Management**
- **Customer Profiles**: Comprehensive customer information storage
- **Purchase History**: Complete transaction records for each customer
- **Prescription Records**: Digital storage of medical prescriptions
- **Loyalty Tracking**: Customer behavior and spending patterns analysis

### 📈 **Analytics & Reporting**
- **Sales Performance**: Daily, weekly, and monthly revenue reports
- **Product Analytics**: Best-selling and slow-moving medicine identification
- **Supplier Performance**: Vendor contribution and reliability metrics
- **Expiry Forecasting**: Predictive analysis for stock rotation
- **Financial Reports**: Revenue, profit, and inventory valuation

### 🔔 **Automated Alerts**
- **Stock Replenishment**: Notifications for low inventory levels
- **Expiry Warnings**: Early alerts for soon-to-expire medicines
- **Supplier Reorder**: Automated purchase suggestion generation
- **Business Intelligence**: Data-driven decision support

## 🛠 Technology Stack

### **Database Management System**
- **Primary Platform**: MySQL 8.0
- **Demo Environment**: https://www.db-fiddle.com/f/4ZqUVyU8H7h266KzugAdSo/5
- **Backup Solution**: Local MySQL Server
- **Compatibility**: Cross-platform support

### **Development Tools**
- **SQL IDE**: https://www.db-fiddle.com/f/4ZqUVyU8H7h266KzugAdSo/5
- **Version Control**: Git & GitHub
- **Documentation**: Markdown & PDF
- **Diagram Tools**: ERD creation utilities

### **Standards & Compliance**
- **Normalization**: 3rd Normal Form (3NF)
- **ACID Properties**: Full transaction compliance
- **Data Integrity**: Referential integrity constraints
- **Security**: Basic access control and validation

## 🗃 Database Schema

### **Entity Relationship Diagram**
The system implements a robust relational database with 6 main entities:

```
Suppliers (1) ←→ (Many) Medicines (1) ←→ (Many) Sale_Details (Many) ←→ (1) Sales (Many) ←→ (1) Customers
                                                                        ↑
                                                              Prescriptions (Many) ←→ (1) Customers
```

### **Core Tables Description**

#### **1. Suppliers Table**
- Stores pharmaceutical supplier information
- Tracks vendor contact details and performance
- Primary key: `supplier_id`

#### **2. Medicines Table** 
- Comprehensive medicine inventory management
- Batch-level tracking with expiry dates
- Foreign key: `supplier_id` linking to Suppliers

#### **3. Customers Table**
- Customer demographic and contact information
- Supports customer relationship management
- Primary key: `customer_id`

#### **4. Sales Table**
- Main sales transaction records
- Payment method and total amount tracking
- Links customers with their purchases

#### **5. Sale_Details Table**
- Line item details for each sale
- Quantity, pricing, and product information
- Bridges Sales and Medicines tables

#### **6. Prescriptions Table**
- Digital prescription records
- Doctor information and diagnosis details
- Links medical prescriptions with customers

### **Key Relationships**
- **Suppliers → Medicines**: One-to-Many (One supplier provides multiple medicines)
- **Medicines → Sale_Details**: One-to-Many (One medicine appears in multiple sale lines)
- **Customers → Sales**: One-to-Many (One customer makes multiple purchases)
- **Customers → Prescriptions**: One-to-Many (One customer has multiple prescriptions)

## 🚀 Installation & Setup

### **Option 1: db-fiddle.com (Recommended for Evaluation)**

1. **Access the Platform**
   ```bash
   Visit: https://www.db-fiddle.com
   ```

2. **Environment Setup**
   - Select **MySQL 8.0** from database dropdown
   - Paste the complete schema from `/sql/01_schema.sql`
   - Click **"Run"** to initialize database structure

3. **Data Population**
   - Paste sample data from `/sql/02_inserts.sql`
   - Execute to populate tables with test data

4. **View Creation**
   - Implement analytical views from `/sql/03_views.sql`
   - Create automated reporting structures

5. **Query Execution**
   - Run demonstration queries from `/sql/04_queries.sql`
   - Test system functionality

6. **Save Your Work**
   - Click **"Save"** button to generate permanent URL
   - Share link with evaluators: `https://www.db-fiddle.com/f/your-unique-id/1`

### **Option 2: Local MySQL Setup**

```bash
# Clone the repository
git clone https://github.com/your-username/DBMS-Pharmacy-Management.git
cd DBMS-Pharmacy-Management

# Import complete database
mysql -u your_username -p < database/pharmacy_db_backup.sql

# Or execute scripts sequentially
mysql -u your_username -p < sql/01_schema.sql
mysql -u your_username -p < sql/02_inserts.sql
mysql -u your_username -p < sql/03_views.sql
```

### **Option 3: Manual Script Execution**

1. **Start MySQL Service**
   ```bash
   sudo service mysql start
   ```

2. **Access MySQL Monitor**
   ```bash
   mysql -u root -p
   ```

3. **Execute Schema Script**
   ```sql
   source sql/01_schema.sql;
   ```

4. **Populate with Data**
   ```sql
   source sql/02_inserts.sql;
   ```

## 💡 Usage Examples

### **Daily Operations**

#### **1. New Medicine Entry**
```sql
INSERT INTO Medicines (medicine_name, batch_number, expiry_date, quantity, price_per_unit, supplier_id, category) 
VALUES ('Aspirin', 'BATCH006', '2025-06-30', 120, 12.75, 1, 'Pain Relief');
```

#### **2. Process Customer Sale**
```sql
-- Start transaction
START TRANSACTION;

-- Create sale record
INSERT INTO Sales (sale_date, customer_id, total_amount, payment_method) 
VALUES (CURDATE(), 1, 85.25, 'Card');

-- Add sale details
INSERT INTO Sale_Details (sale_id, medicine_id, quantity_sold, unit_price, total_price) 
VALUES (LAST_INSERT_ID(), 1, 2, 15.50, 31.00);

-- Commit transaction
COMMIT;
```

#### **3. Customer Prescription Management**
```sql
-- Record new prescription
INSERT INTO Prescriptions (customer_id, doctor_name, diagnosis, prescription_date) 
VALUES (2, 'Dr. Gupta', 'Hypertension management', '2024-01-20');
```

## 🔍 Sample Queries & Results

### **Query 1: Inventory Health Check**
```sql
SELECT 
    medicine_name AS 'Medicine',
    quantity AS 'Stock',
    expiry_date AS 'Expiry Date',
    CASE 
        WHEN quantity < 20 THEN '🟥 Critical'
        WHEN quantity < 50 THEN '🟨 Low'
        ELSE '🟩 Adequate'
    END AS 'Stock Status',
    CASE 
        WHEN expiry_date < CURDATE() THEN '🟥 Expired'
        WHEN expiry_date <= DATE_ADD(CURDATE(), INTERVAL 30 DAY) THEN '🟨 Expiring Soon'
        ELSE '🟩 Valid'
    END AS 'Expiry Status'
FROM Medicines
ORDER BY quantity ASC, expiry_date ASC;
```

**Expected Output**: Comprehensive stock and expiry status dashboard

### **Query 2: Sales Performance Analysis**
```sql
SELECT 
    m.medicine_name AS 'Product',
    SUM(sd.quantity_sold) AS 'Units Sold',
    SUM(sd.total_price) AS 'Total Revenue',
    ROUND(SUM(sd.total_price) / SUM(sd.quantity_sold), 2) AS 'Average Price',
    RANK() OVER (ORDER BY SUM(sd.total_price) DESC) AS 'Revenue Rank'
FROM Medicines m
JOIN Sale_Details sd ON m.medicine_id = sd.medicine_id
GROUP BY m.medicine_id, m.medicine_name
HAVING SUM(sd.quantity_sold) > 0
ORDER BY SUM(sd.total_price) DESC;
```

**Expected Output**: Product performance ranking with revenue analytics

### **Query 3: Customer Purchase Patterns**
```sql
SELECT 
    c.customer_name AS 'Customer',
    COUNT(s.sale_id) AS 'Total Visits',
    SUM(s.total_amount) AS 'Lifetime Value',
    ROUND(AVG(s.total_amount), 2) AS 'Average Transaction',
    MAX(s.sale_date) AS 'Last Visit'
FROM Customers c
LEFT JOIN Sales s ON c.customer_id = s.customer_id
WHERE s.sale_id IS NOT NULL
GROUP BY c.customer_id, c.customer_name
ORDER BY SUM(s.total_amount) DESC;
```

**Expected Output**: Customer loyalty and spending analysis

### **Query 4: Expiry Risk Management**
```sql
SELECT 
    medicine_name AS 'Medicine',
    batch_number AS 'Batch',
    expiry_date AS 'Expiry Date',
    DATEDIFF(expiry_date, CURDATE()) AS 'Days Until Expiry',
    quantity AS 'Remaining Stock',
    ROUND(quantity * price_per_unit, 2) AS 'Inventory Value'
FROM Medicines
WHERE expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 60 DAY)
ORDER BY expiry_date ASC;
```

**Expected Output**: Risk assessment for soon-to-expire inventory

## 📁 Project Structure

```
DBMS-Pharmacy-Management/
│
├── 📂 sql/                           # Database Implementation
│   ├── 01_schema.sql                 # Complete database structure
│   ├── 02_inserts.sql               # Sample data population
│   ├── 03_views.sql                 # Analytical views creation
│   ├── 04_queries.sql               # Demonstration queries
│   └── 05_triggers.sql              # Automated business rules
│
├── 📂 screenshots/                   # Visual Documentation
│   ├── schema-design.png            # Database schema visualization
│   ├── query-results-1.png          # Sample query output 1
│   ├── query-results-2.png          # Sample query output 2
│   ├── query-results-3.png          # Sample query output 3
│   └── db-fiddle-interface.png      # Online platform demonstration
│
├── 📂 docs/                          # Academic Documentation
│   ├── PBL-Phase-1.md               # Problem identification
│   ├── PBL-Phase-2.md               # Conceptual design
│   ├── PBL-Phase-3.md               # Mid-term progress
│   ├── PBL-Phase-4.md               # Final implementation
│   └── Project-Report.pdf           # Comprehensive project report
│
├── 📂 database/                      # Database Management
│   └── pharmacy_db_backup.sql       # Complete database backup
│
├── 🔧 README.md                      # Project documentation (this file)
└── ⚙️ .gitignore                     # Version control exclusions
```

## 📚 Academic Compliance

### **Course Learning Outcomes Achieved**

- **CO1**: Identify major components in a typical database environment
- **CO2**: Understand DBMS principles and their applications  
- **CO3**: Utilize SQL to construct and execute queries
- **CO4**: Apply relational database theory and relational algebra expressions
- **CO5**: Demonstrate design principles using E-R and normalization

### **PBL Phases Implementation**

1. **Phase 1**: Problem Identification & Requirements Analysis
2. **Phase 2**: Conceptual Design & ER Modeling
3. **Phase 3**: Implementation & SQL Development
4. **Phase 4**: Testing, Views, and Advanced Features

### **Database Normalization**
- **1NF**: Atomic values and unique records
- **2NF**: No partial dependencies
- **3NF**: No transitive dependencies
- **BCNF**: Further elimination of anomalies

### **Academic Guidance**
- **Course Instructor**: [Professor's Name]
- **Institution**: [Your University Name]

### **Acknowledgments**
Special thanks to the Database Management Systems faculty for their guidance and the open-source community for providing valuable tools and resources that made this project possible.

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

### **Academic Usage**
This project is developed for educational purposes as part of the DBMS Lab curriculum. The code, documentation, and database design can be used for academic learning and reference with proper attribution.

### **Commercial Restrictions**
While the educational use is encouraged, commercial utilization requires explicit permission from the authors.


## 🔗 Quick Links

- **[Live Demo on db-fiddle.com](https://www.db-fiddle.com/f/4ZqUVyU8H7h266KzugAdSo/5)**
- **[Full Project Report](docs/Project-Report.pdf)**
- **[Database Schema Diagram](screenshots/schema-design.png)**
- **[SQL Scripts Directory](sql/)**
