# 💊 Pharmacy Management System

A comprehensive **Database Management System (DBMS)** for pharmacy operations, developed as part of the **DBMS Lab Academic Project**.

---

## 🎯 Project Overview

This system manages **pharmacy inventory, sales, customers, suppliers, and prescriptions** with automated stock tracking and reporting capabilities.  
It is designed to streamline pharmacy workflows and maintain efficient database-driven operations.

---

## 🗃️ Database Schema

### Entities

- **Medicines**: Product inventory with expiry tracking  
- **Suppliers**: Medicine suppliers information  
- **Customers**: Customer profiles and purchase history  
- **Sales**: Transaction records  
- **Sale_Details**: Individual sale items  
- **Prescriptions**: Customer prescriptions  

---

## 🧩 Schema Design

Below is the visual representation of the schema used in the project:

[![Database Schema](screenshots/schema-design.png)](screenshots/schema-design.png)

---

## 🧪 Sample Queries & Results

### 🔹 Query 1: Expiring Medicines  
```sql
SELECT * FROM ExpiringMedicinesView;
````

[![Query Result 1](screenshots/query-results-1.png)](screenshots/query-results-1.png)

---

### 🔹 Query 2: Top Selling Products

```sql
SELECT * FROM TopSellingMedicinesView LIMIT 5;
```

[![Query Result 2](screenshots/query-results-2.png)](screenshots/query-results-2.png)

---

## 🌐 DB Fiddle Interface

Run and test this project directly on **db-fiddle.com**
👉 [**View Live Demo**](https://www.db-fiddle.com/f/4ZqUVyU8H7h266KzugAdSo/5)

[![DB Fiddle Interface](screenshots/db-fiddle-interface.png)](screenshots/db-fiddle-interface.png)

---

## 🚀 Quick Start

### Option 1: Using db-fiddle.com (Recommended for Demo)

1. Visit **[db-fiddle.com](https://www.db-fiddle.com/f/4ZqUVyU8H7h266KzugAdSo/5)**
2. Select **MySQL 8.0**
3. Run the SQL files in this order:

   * `01_schema.sql`
   * `02_inserts.sql`
   * `03_views.sql`
   * `04_queries.sql`
   * `05_triggers.sql`

### Option 2: Local MySQL Setup

```bash
# Import complete database
mysql -u username -p < database/pharmacy_db_backup.sql
```

---

## 📊 Key Features

✅ Inventory Management with Expiry Tracking
✅ Sales and Billing System
✅ Customer Relationship Management
✅ Supplier Performance Analytics
✅ Automated Stock Alerts
✅ Prescription Management
✅ Comprehensive Reporting

---

## 📋 Sample Queries

**Get Expiring Medicines**

```sql
SELECT * FROM ExpiringMedicinesView;
```

**Top Selling Products**

```sql
SELECT * FROM TopSellingMedicinesView LIMIT 5;
```

**Sales Report**

```sql
SELECT * FROM CustomerPurchaseHistory ORDER BY total_spent DESC;
```

---

## 📁 Project Structure

```
DBMS-Pharmacy-Management/
├── sql/           # All SQL scripts
├── screenshots/   # Query results and schema
├── docs/          # PBL documentation
└── database/      # Complete database backup
```

---

## 🎯 db-fiddle.com Instructions

**Why use db-fiddle.com?**

* No installation required
* Instant demonstration capability
* Shareable link for evaluation
* Supports all MySQL features used
* Perfect for academic presentations

**How to Present:**

1. Open **db-fiddle.com**
2. Choose **MySQL 8.0**
3. Paste and run each file sequentially (`schema`, `inserts`, `views`, `queries`, `triggers`)
4. Save the fiddle and share the permanent link with your lecturer

---

## 📄 License

**Academic Project — MIT License**

---

## 📚 Additional Files

### `/docs/Project-Report.docx`

Include:

* Problem Statement
* Literature Review
* System Analysis
* ER Diagrams
* Normalization proofs
* Implementation details
* Screenshots and results
* Conclusion and future work

---

## 🖼️ Screenshots Summary

| Screenshot                                        | Description                         |
| ------------------------------------------------- | ----------------------------------- |
| ![Schema](screenshots/schema-design.png)          | Database Schema Design              |
| ![Query 1](screenshots/query-results-1.png)       | Query Result – Expiring Medicines   |
| ![Query 2](screenshots/query-results-2.png)       | Query Result – Top Selling Products |
| ![DB Fiddle](screenshots/db-fiddle-interface.png) | db-fiddle Interface                 |

---

### 🌟 Developed by:

**Farai Edwin Masawi**
*BCA – Chandigarh University*
📘 Academic DBMS Project
