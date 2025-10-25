-- Triggers and Stored Procedures for Pharmacy Management

-- Trigger 1: Update stock after sale
DELIMITER //
CREATE TRIGGER UpdateStockAfterSale
AFTER INSERT ON Sale_Details
FOR EACH ROW
BEGIN
    UPDATE Medicines 
    SET Quantity = Quantity - NEW.Quantity_Sold
    WHERE Medicine_ID = NEW.Medicine_ID;
END//
DELIMITER ;

-- Trigger 2: Prevent negative stock
DELIMITER //
CREATE TRIGGER PreventNegativeStock
BEFORE UPDATE ON Medicines
FOR EACH ROW
BEGIN
    IF NEW.Quantity < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot have negative stock quantity';
    END IF;
END//
DELIMITER ;

-- Stored Procedure 1: Make a sale
DELIMITER //
CREATE PROCEDURE MakeSale(
    IN p_customer_id INT,
    IN p_medicine_id INT,
    IN p_quantity INT,
    IN p_payment_method ENUM('Cash', 'Card', 'Digital')
)
BEGIN
    DECLARE v_unit_price DECIMAL(10,2);
    DECLARE v_total_price DECIMAL(10,2);
    DECLARE v_sale_id INT;
    DECLARE v_current_stock INT;
    
    -- Get current stock
    SELECT Quantity INTO v_current_stock FROM Medicines WHERE Medicine_ID = p_medicine_id;
    
    IF v_current_stock < p_quantity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock';
    END IF;
    
    -- Get medicine price
    SELECT Price_Per_Unit INTO v_unit_price FROM Medicines WHERE Medicine_ID = p_medicine_id;
    SET v_total_price = v_unit_price * p_quantity;
    
    -- Insert sale
    INSERT INTO Sales (Customer_ID, Total_Amount, Payment_Method) 
    VALUES (p_customer_id, v_total_price, p_payment_method);
    
    SET v_sale_id = LAST_INSERT_ID();
    
    -- Insert sale details (trigger will update stock)
    INSERT INTO Sale_Details (Sale_ID, Medicine_ID, Quantity_Sold, Unit_Price, Total_Price)
    VALUES (v_sale_id, p_medicine_id, p_quantity, v_unit_price, v_total_price);
    
    SELECT v_sale_id AS New_Sale_ID, v_total_price AS Total_Amount;
END//
DELIMITER ;

-- Stored Procedure 2: Get expiry alerts
DELIMITER //
CREATE PROCEDURE GetExpiryAlerts(IN p_days_threshold INT)
BEGIN
    SELECT 
        Medicine_Name,
        Batch_No,
        Expiry_Date,
        Quantity,
        DATEDIFF(Expiry_Date, CURDATE()) AS Days_Until_Expiry
    FROM Medicines
    WHERE Expiry_Date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL p_days_threshold DAY)
    ORDER BY Expiry_Date ASC;
END//
DELIMITER ;
