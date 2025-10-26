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
