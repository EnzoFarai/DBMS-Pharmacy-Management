# PBL Phase 2: Conceptual Design
**Course:** CONT_24CAP-204 :: DATABASE MANAGEMENT SYSTEM LAB  
**Experiment:** 2.3  
**Completion Requirements:** 
- CO2 — Understand DBMS principles and their applications
- CO3 — Utilize SQL to construct and execute queries

## 1. Conceptual Design Overview

### 1.1 Design Objectives

The conceptual design phase focuses on translating business requirements identified in Phase 1 into a structured database design. The primary objectives are:

1. **Data Modeling**: Create an Entity-Relationship (ER) model that accurately represents pharmacy operations
2. **Normalization**: Ensure database design follows normalization principles to eliminate redundancy
3. **Scalability**: Design a schema that can accommodate future growth and additional features
4. **Performance**: Optimize for common query patterns and reporting requirements

### 1.2 Design Methodology

**Approach Used:**
- Top-down design starting from entity identification
- Bottom-up validation through query analysis
- Iterative refinement through stakeholder feedback
- Normalization to Third Normal Form (3NF)

## 2. Entity-Relationship Model

### 2.1 Entity Definitions

#### 2.1.1 Core Business Entities

**Suppliers Entity:**
- **Description**: Companies or distributors that supply medicines to the pharmacy
- **Key Attributes**: supplier_id (PK), supplier_name, contact_details
- **Business Significance**: Critical for supply chain management and purchase ordering

**Medicines Entity:**
- **Description**: Pharmaceutical products managed in inventory
- **Key Attributes**: medicine_id (PK), medicine_name, batch_number, expiry_date, quantity, price
- **Business Significance**: Central entity representing the core products sold

**Customers Entity:**
- **Description**: Individuals purchasing medicines from the pharmacy
- **Key Attributes**: customer_id (PK), customer_name, contact_details, medical_history
- **Business Significance**: Enables customer relationship management and personalized service

#### 2.1.2 Transaction Entities

**Sales Entity:**
- **Description**: Records of completed sales transactions
- **Key Attributes**: sale_id (PK), sale_date, total_amount, payment_method
- **Business Significance**: Primary revenue tracking mechanism

**Sale_Details Entity:**
- **Description**: Line items for each sale, linking medicines to sales
- **Key Attributes**: sale_detail_id (PK), quantity_sold, unit_price, total_price
- **Business Significance**: Enables detailed sales analysis and inventory updates

**Prescriptions Entity:**
- **Description**: Medical prescriptions from healthcare providers
- **Key Attributes**: prescription_id (PK), doctor_details, diagnosis, prescribed_medicines
- **Business Significance**: Regulatory requirement and customer service enhancement

### 2.2 Relationship Analysis

#### 2.2.1 Primary Relationships

**Suppliers → Medicines (1:N)**
- **Cardinality**: One supplier can supply many medicines, but each medicine has one primary supplier
- **Business Rule**: Medicines must be linked to an approved supplier
- **Foreign Key**: supplier_id in Medicines table references Suppliers

**Medicines → Sale_Details (1:N)**
- **Cardinality**: One medicine can appear in many sale details, each sale detail references one medicine
- **Business Rule**: Quantity sold cannot exceed available stock
- **Foreign Key**: medicine_id in Sale_Details references Medicines

**Customers → Sales (1:N)**
- **Cardinality**: One customer can make many purchases, each sale is linked to one customer
- **Business Rule**: Customer information is optional for over-the-counter sales
- **Foreign Key**: customer_id in Sales references Customers

**Sales → Sale_Details (1:N)**
- **Cardinality**: One sale contains multiple line items, each line item belongs to one sale
- **Business Rule**: Sale total must equal sum of sale detail totals
- **Foreign Key**: sale_id in Sale_Details references Sales

**Customers → Prescriptions (1:N)**
- **Cardinality**: One customer can have multiple prescriptions, each prescription belongs to one customer
- **Business Rule**: Prescriptions must be linked to valid customers
- **Foreign Key**: customer_id in Prescriptions references Customers

### 2.3 Entity-Relationship Diagram

```
[Conceptual ER Diagram]

Suppliers (1) —— supplies —— (N) Medicines (1) —— included_in —— (N) Sale_Details (N) —— part_of —— (1) Sales
                                                                        |
                                                                        |
                                                                     (N) belongs_to (1)
                                                                        |
                                                                        |
Customers (1) —— makes —— (N) Sales          Customers (1) —— has —— (N) Prescriptions
```

## 3. Attribute Specification

### 3.1 Detailed Attribute Analysis

#### Medicines Entity Attributes:
- **medicine_id**: SURROGATE KEY, Auto-increment, Primary Identifier
- **medicine_name**: VARCHAR(100), NOT NULL, Searchable field
- **batch_number**: VARCHAR(50), NOT NULL, Critical for expiry tracking
- **expiry_date**: DATE, NOT NULL, Validation required (future date)
- **quantity**: INT, NOT NULL, Must be >= 0
- **price_per_unit**: DECIMAL(10,2), NOT NULL, Must be > 0
- **supplier_id**: INT, FOREIGN KEY, Cascade update considerations
- **category**: VARCHAR(50), Enables product categorization
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP, Audit trail

#### Sales Entity Attributes:
- **sale_id**: SURROGATE KEY, Auto-increment, Primary Identifier
- **sale_date**: DATE, NOT NULL, Default current date
- **customer_id**: INT, FOREIGN KEY, NULL allowed for walk-in customers
- **total_amount**: DECIMAL(10,2), NOT NULL, Calculated field
- **payment_method**: VARCHAR(20), NOT NULL, Check constraint (Cash/Card/UPI)
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP, Audit trail

## 4. Normalization Process

### 4.1 First Normal Form (1NF)

**Initial Unnormalized Structure:**
```
Sales (sale_id, sale_date, customer_id, medicine_list, total_amount)
medicine_list: (medicine_id, medicine_name, quantity, price)
```

**1NF Compliance:**
- Eliminated repeating groups by creating Sale_Details table
- All attributes contain atomic values
- Each table has primary key defined

### 4.2 Second Normal Form (2NF)

**Partial Dependencies Check:**
- All non-key attributes fully functionally dependent on primary keys
- Sale_Details: (sale_id, medicine_id) → (quantity_sold, unit_price, total_price)
- No partial dependencies found

### 4.3 Third Normal Form (3NF)

**Transitive Dependencies Check:**
- Medicines: medicine_name doesn't depend on supplier_id (no transitive dependency)
- Sales: total_amount derived from sale details (acceptable derived attribute)
- All tables compliant with 3NF

## 5. Business Rules and Constraints

### 5.1 Domain Constraints

**Medicine Expiry Validation:**
```sql
CONSTRAINT chk_expiry_date CHECK (expiry_date > CURRENT_DATE)
```

**Stock Level Validation:**
```sql
CONSTRAINT chk_quantity_non_negative CHECK (quantity >= 0)
```

**Price Validation:**
```sql
CONSTRAINT chk_positive_price CHECK (price_per_unit > 0)
```

### 5.2 Referential Integrity Constraints

**Cascade Operations:**
- ON DELETE RESTRICT for Suppliers (prevent deletion if medicines exist)
- ON UPDATE CASCADE for supplier_id changes
- ON DELETE SET NULL for customer_id in Sales (preserve sales history)

## 6. Query Design and Analysis

### 6.1 Critical Business Queries

#### Query 1: Inventory Status Report
```sql
SELECT 
    m.medicine_name,
    m.batch_number,
    m.expiry_date,
    m.quantity,
    CASE 
        WHEN m.quantity < 20 THEN 'LOW STOCK'
        WHEN m.quantity > 100 THEN 'OVERSTOCK'
        ELSE 'NORMAL'
    END as stock_status
FROM Medicines m
WHERE m.expiry_date > CURRENT_DATE
ORDER BY m.quantity ASC, m.expiry_date ASC;
```

**Business Purpose**: Daily inventory assessment and replenishment decisions

#### Query 2: Sales Performance Analysis
```sql
SELECT 
    m.medicine_name,
    SUM(sd.quantity_sold) as total_sold,
    SUM(sd.total_price) as total_revenue,
    s.supplier_name
FROM Medicines m
JOIN Sale_Details sd ON m.medicine_id = sd.medicine_id
JOIN Suppliers s ON m.supplier_id = s.supplier_id
WHERE sd.sale_date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY m.medicine_id, m.medicine_name, s.supplier_name
ORDER BY total_revenue DESC;
```

**Business Purpose**: Monthly sales performance review and supplier evaluation

### 6.2 Complex Query Requirements

#### Subquery Example: Identifying Slow-Moving Items
```sql
SELECT medicine_name, quantity
FROM Medicines
WHERE medicine_id NOT IN (
    SELECT DISTINCT medicine_id 
    FROM Sale_Details sd
    JOIN Sales s ON sd.sale_id = s.sale_id
    WHERE s.sale_date >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY)
) AND quantity > 0;
```

**Business Purpose**: Inventory optimization and promotional planning

#### JOIN Example: Customer Purchase History
```sql
SELECT 
    c.customer_name,
    s.sale_date,
    GROUP_CONCAT(m.medicine_name SEPARATOR ', ') as medicines_purchased,
    s.total_amount
FROM Customers c
JOIN Sales s ON c.customer_id = s.customer_id
JOIN Sale_Details sd ON s.sale_id = sd.sale_id
JOIN Medicines m ON sd.medicine_id = m.medicine_id
GROUP BY c.customer_id, s.sale_id, s.sale_date, s.total_amount
ORDER BY s.sale_date DESC;
```

**Business Purpose**: Customer relationship management and personalized service

## 7. Performance Considerations

### 7.1 Indexing Strategy

**Primary Indexes:**
- All primary keys (clustered indexes)
- Foreign key indexes for join performance

**Secondary Indexes:**
- Medicines(expiry_date) for expiry queries
- Medicines(quantity) for stock level queries
- Sales(sale_date) for temporal queries
- Medicines(supplier_id) for supplier reports

### 7.2 Query Optimization

**Identified Performance-Critical Operations:**
- Daily expiry check queries
- Real-time stock level updates
- Sales reporting and analytics
- Customer purchase history retrieval

## 8. Implementation Roadmap

### 8.1 Phase 1 Implementation
- Core table creation with constraints
- Basic CRUD operations
- Essential business queries

### 8.2 Phase 2 Enhancement
- View creation for common reports
- Trigger implementation for business rules
- Advanced analytics queries

### 8.3 Future Extensions
- Stored procedures for complex operations
- Database functions for calculations
- Backup and recovery procedures

## 9. Design Validation

### 9.1 Compliance Check
- ✅ All functional requirements addressed
- ✅ Normalization standards met (3NF)
- ✅ Performance requirements considered
- ✅ Scalability requirements incorporated
- ✅ Data integrity constraints defined

### 9.2 Risk Assessment
- **Low Risk**: Standard relational design patterns used
- **Medium Risk**: Complex trigger requirements for stock updates
- **Mitigation**: Thorough testing of update operations

**Next Phase**: Proceed to implementation and testing phase with the defined schema design.
