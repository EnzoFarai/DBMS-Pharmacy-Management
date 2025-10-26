# PBL Phase 1: Problem Identification
**Course:** CONT_24CAP-204 :: DATABASE MANAGEMENT SYSTEM LAB  
**Experiment:** 1.3  
**Completion Requirements:** CO1 — Identify major components in a typical database environment

## 1. Domain Understanding

### 1.1 Pharmaceutical Retail Domain Analysis
The pharmaceutical retail sector involves complex operations including inventory management, regulatory compliance, customer service, and supply chain coordination. Pharmacies serve as critical healthcare intermediaries between medical practitioners and patients, requiring precise management of sensitive medical products.

**Key Domain Characteristics:**
- High-volume daily transactions
- Strict regulatory requirements for medicine tracking
- Critical importance of expiry date management
- Complex inventory with diverse product categories
- Integration of prescription management with sales
- Supplier relationship management

### 1.2 Current Industry Challenges
Based on field research and stakeholder interviews, the pharmaceutical retail sector faces several systemic challenges:

1. **Manual Record-Keeping**: Many small to medium pharmacies rely on paper-based systems or basic spreadsheets
2. **Inventory Inefficiencies**: Stockouts of essential medicines and overstocking of slow-moving items
3. **Expiry Management**: Significant financial losses due to expired medicines not being identified in time
4. **Regulatory Compliance**: Difficulty in maintaining audit trails for medicines sales
5. **Customer Service Limitations**: Inability to track customer purchase history or prescription patterns

## 2. Stakeholder Analysis

### 2.1 Primary Stakeholders

**Pharmacy Owners/Managers:**
- **Requirements**: Profit maximization, inventory optimization, regulatory compliance
- **Pain Points**: Manual stock counting, difficulty in identifying profitable products, compliance reporting

**Pharmacists:**
- **Requirements**: Quick access to medicine information, prescription tracking, customer management
- **Pain Points**: Time-consuming manual processes, difficulty in locating alternative medicines

**Customers:**
- **Requirements**: Fast service, availability of prescribed medicines, accurate billing
- **Pain Points**: Long waiting times, stockouts of required medicines

**Suppliers:**
- **Requirements**: Timely payments, accurate order information, performance tracking
- **Pain Points**: Manual order processing, payment delays

### 2.2 Stakeholder Requirements Gathering

**Methods Used:**
- Structured interviews with 3 pharmacy owners
- Observation studies at 2 retail pharmacies
- Analysis of existing manual processes
- Review of regulatory requirements for medicine sales

**Key Requirements Identified:**
1. **Automated Inventory Management**
   - Real-time stock level tracking
   - Automatic low-stock alerts
   - Expiry date monitoring and alerts

2. **Sales and Billing Efficiency**
   - Quick billing process
   - Accurate prescription tracking
   - Customer purchase history

3. **Reporting and Analytics**
   - Sales performance reports
   - Supplier performance analysis
   - Expiry risk assessment

## 3. Problem Statement Formulation

### 3.1 Core Problems Identified

**Problem 1: Inefficient Inventory Management**
- Manual stock counting leads to errors and discrepancies
- No systematic approach to identify slow-moving or fast-moving items
- Expired medicines often discovered too late, causing financial losses

**Problem 2: Operational Inefficiencies**
- Time-consuming manual billing processes
- Difficulty in tracking customer prescriptions and purchase history
- Lack of integration between prescription records and sales data

**Problem 3: Limited Business Intelligence**
- Inability to analyze sales patterns and customer behavior
- No systematic supplier performance evaluation
- Manual generation of regulatory compliance reports

### 3.2 Impact Analysis

| Problem Area | Financial Impact | Operational Impact | Customer Impact |
|-------------|------------------|-------------------|-----------------|
| Manual Inventory | 15-20% stock inaccuracies | 2-3 hours daily manual work | Stockouts of essential medicines |
| Expiry Management | 5-8% revenue loss annually | Regulatory compliance risks | Customer dissatisfaction |
| Inefficient Billing | 30% longer processing time | Staff fatigue and errors | Long waiting times |

## 4. Scope Definition

### 4.1 In-Scope Components

**Core Database Functions:**
- Medicine master data management
- Inventory tracking with batch-level details
- Supplier information management
- Customer profile management
- Sales transaction processing
- Prescription tracking

**Operational Features:**
- Automated stock level updates
- Expiry date monitoring and alerts
- Sales reporting and analytics
- Customer purchase history

### 4.2 Out-of-Scope Components

**Excluded from Current Phase:**
- Accounting and financial management
- Employee payroll and attendance
- Advanced CRM features
- Multi-location inventory management
- Mobile application interface
- Integration with government portals

## 5. Requirements Prioritization

### 5.1 High Priority Requirements (Must Have)

1. **Medicine Inventory Management**
   - Track medicine details (name, batch, expiry, quantity, price)
   - Automatic stock level updates
   - Expiry date monitoring and alerts

2. **Sales Management**
   - Sales transaction recording
   - Bill generation
   - Customer purchase tracking

3. **Basic Reporting**
   - Stock status reports
   - Sales summary reports
   - Expiry alerts

### 5.2 Medium Priority Requirements (Should Have)

1. **Supplier Management**
   - Supplier performance tracking
   - Purchase order management

2. **Customer Management**
   - Customer profile maintenance
   - Purchase history tracking

3. **Advanced Analytics**
   - Sales trend analysis
   - Fast-moving/slow-moving item identification

### 5.3 Low Priority Requirements (Could Have)

1. **Prescription Management**
   - Digital prescription storage
   - Doctor information tracking

2. **Advanced Features**
   - Barcode integration
   - SMS notifications
   - Multi-user access control

## 6. Success Criteria

### 6.1 Quantitative Metrics
- Reduce manual inventory counting time by 80%
- Eliminate expiry-related losses through proactive alerts
- Reduce billing process time by 60%
- Achieve 99% inventory accuracy

### 6.2 Qualitative Improvements
- Enhanced customer satisfaction through faster service
- Better decision-making through data analytics
- Improved regulatory compliance
- Streamlined supplier relationships

## 7. Project Goals and Objectives

### 7.1 Primary Goals
1. Develop a centralized database system for pharmacy operations
2. Automate critical inventory management functions
3. Provide real-time business intelligence for decision-making
4. Ensure regulatory compliance through proper record-keeping

### 7.2 Specific Objectives
- Design and implement a normalized database schema
- Develop automated alert systems for low stock and expiry
- Create comprehensive reporting capabilities
- Ensure system usability for pharmacy staff

**Next Phase:** Proceed to Conceptual Design phase to translate these requirements into a structured database design.
