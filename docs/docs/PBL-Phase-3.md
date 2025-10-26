# PBL Phase 3: MidTerm Progress Report

### Implementation Status
✅ **Completed Tasks:**
- Database schema design and implementation
- All tables created with proper constraints
- Sample data inserted for testing
- Basic CRUD operations tested and working
- Initial relationship integrity verified

🔄 **In Progress:**
- Advanced view creation for business reports
- Complex query optimization
- Stored procedure development
- Trigger implementation for automation

### Sample Queries Successfully Executed
```sql
-- Basic inventory check
SELECT Medicine_Name, Quantity, Price_Per_Unit 
FROM Medicines 
WHERE Quantity < 50;

-- Sales report with customer details
SELECT c.Customer_Name, s.Sale_Date, s.Total_Amount
FROM Sales s
JOIN Customers c ON s.Customer_ID = c.Customer_ID;

-- Supplier-wise medicine count
SELECT s.Supplier_Name, COUNT(m.Medicine_ID) as Medicine_Count
FROM Suppliers s
LEFT JOIN Medicines m ON s.Supplier_ID = m.Supplier_ID
GROUP BY s.Supplier_Name;
