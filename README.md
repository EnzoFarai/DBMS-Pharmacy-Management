# Pharmacy Management System

A comprehensive Database Management System for pharmacy operations, developed as part of DBMS Lab academic project.

## 🎯 Project Overview

This system manages pharmacy inventory, sales, customers, suppliers, and prescriptions with automated stock tracking and reporting capabilities.

## 🗃️ Database Schema

### Entities
- **Medicines**: Product inventory with expiry tracking
- **Suppliers**: Medicine suppliers information
- **Customers**: Customer profiles and history
- **Sales**: Transaction records
- **Sale_Details**: Individual sale items
- **Prescriptions**: Customer prescriptions

## 🚀 Quick Start

### Option 1: db-fiddle.com (Recommended for Demo)
1. Visit [db-fiddle.com](https://www.db-fiddle.com)
2. Select MySQL 8.0
3. Run the SQL files in this order:
   - `01_schema.sql`
   - `02_inserts.sql`
   - `03_views.sql`
   - `04_queries.sql`
   - `05_triggers.sql`

### Option 2: Local MySQL Setup
```bash
# Import complete database
mysql -u username -p < database/pharmacy_db_backup.sql
```

## 📊 Key Features

- ✅ Inventory Management with Expiry Tracking
- ✅ Sales and Billing System
- ✅ Customer Relationship Management
- ✅ Supplier Performance Analytics
- ✅ Automated Stock Alerts
- ✅ Prescription Management
- ✅ Comprehensive Reporting

## 🔍 Sample Queries

### Get Expiring Medicines
```sql
SELECT * FROM ExpiringMedicinesView;
```

### Top Selling Products
```sql
SELECT * FROM TopSellingMedicinesView LIMIT 5;
```

### Sales Report
```sql
SELECT * FROM CustomerPurchaseHistory ORDER BY total_spent DESC;
```

## 📁 Project Structure
```
DBMS-Pharmacy-Management/
├── sql/           # All SQL scripts
├── screenshots/   # Query results and schema
├── docs/          # PBL documentation
└── database/      # Complete database backup

## 📄 License
Academic Project - MIT License

## 🎯 db-fiddle.com Instructions

**YES! Keep db-fiddle.com** - it's perfect for academic demonstrations. Here's how to present it:

1. **Create the fiddle**: Go to db-fiddle.com, select MySQL 8.0
2. **Run schema first**: Paste and run `01_schema.sql`
3. **Insert data**: Run `02_inserts.sql` 
4. **Create views**: Run `03_views.sql`
5. **Test queries**: Run individual queries from `04_queries.sql`
6. **Save the fiddle**: Click "Save" to get a permanent link for your lecturer

**Benefits of db-fiddle.com:**
- No installation required
- Instant demonstration capability
- Shareable link for evaluation
- Supports all MySQL features we used
- Perfect for academic presentations

## 📋 Additional Files

### `/docs/Project-Report.docx`
Create a comprehensive PDF report including:
- Problem Statement
- Literature Review
- System Analysis
- ER Diagrams
- Normalization proofs
- Implementation details
- Screenshots and results
- Conclusion and future work

### Screenshots to Include:
1. **Schema Design**: Show tables and relationships
2. **Query Results**: 4-5 different query outputs
3. **Views Demonstration**: Show view creations and results
4. **db-fiddle Interface**: Show the working environment
