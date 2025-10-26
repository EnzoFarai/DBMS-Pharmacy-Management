# PBL Phase 2: Conceptual Design
## Database Schema Design

### Entities Identified
1. **Suppliers** - Medicine providers and vendors
2. **Medicines** - Core product inventory with expiry tracking
3. **Customers** - Pharmacy customers with contact details
4. **Sales** - Sales transaction records
5. **Sale_Details** - Individual medicine sales within transactions
6. **Purchase_Orders** - Supplier order management (future expansion)

### Entity Relationships
Suppliers (1) -----< Medicines (Many)
Customers (1) -----< Sales (Many)
Sales (1) -----< Sale_Details (Many)
Medicines (1) -----< Sale_Details (Many)

### Key Constraints Implemented
- **Primary Keys:** Auto-increment IDs for all main entities
- **Foreign Keys:** 
  - Supplier_ID in Medicines table
  - Customer_ID in Sales table
  - Medicine_ID and Sale_ID in Sale_Details table
- **Data Validation:**
  - Quantity cannot be negative
  - Prices must be positive values
  - Required fields enforced with NOT NULL

### Normalization Applied
All tables normalized to **3rd Normal Form (3NF)**:
- **1NF:** All tables have primary keys, no repeating groups
- **2NF:** All non-key attributes fully dependent on primary keys
- **3NF:** No transitive dependencies, all attributes dependent only on primary key

### Business Rules
1. One supplier can supply multiple medicines
2. One customer can have multiple sales transactions
3. One sale can contain multiple medicine items
4. Medicine stock automatically updates after sales
5. Expiry dates are mandatory for all medicines

### Data Types Selection
- **INT** for IDs and quantities
- **VARCHAR** for names and descriptions
- **DECIMAL** for monetary values
- **DATE/DATETIME** for temporal data
- **TEXT** for longer descriptions
