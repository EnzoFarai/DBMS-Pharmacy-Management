-- Triggers and Stored Procedures for Pharmacy Management
-- Note: Some advanced features may not work in DB Fiddle

-- Example trigger concept (for documentation)
-- This would update stock automatically after a sale
/*
CREATE TRIGGER UpdateStockAfterSale
AFTER INSERT ON Sale_Details
FOR EACH ROW
BEGIN
    UPDATE Medicines 
    SET Quantity = Quantity - NEW.Quantity_Sold
    WHERE Medicine_ID = NEW.Medicine_ID;
END;
*/

-- Example stored procedure concept
-- This would process a complete sale transaction
/*
CREATE PROCEDURE ProcessSale(
    IN customer_id INT,
    IN medicine_id INT, 
    IN quantity INT,
    IN payment_method VARCHAR(20)
)
BEGIN
    DECLARE unit_price DECIMAL(10,2);
    DECLARE total_price DECIMAL(10,2);
    DECLARE sale_id INT;
    
    -- Get medicine price
    SELECT Price_Per_Unit INTO unit_price FROM Medicines WHERE Medicine_ID = medicine_id;
    SET total_price = unit_price * quantity;
    
    -- Create sale record
    INSERT INTO Sales (Customer_ID, Total_Amount, Payment_Method) 
    VALUES (customer_id, total_price, payment_method);
    
    SET sale_id = LAST_INSERT_ID();
    
    -- Create sale details
    INSERT INTO Sale_Details (Sale_ID, Medicine_ID, Quantity_Sold, Unit_Price, Total_Price)
    VALUES (sale_id, medicine_id, quantity, unit_price, total_price);
    
    -- Update stock (manual since triggers may not work)
    UPDATE Medicines SET Quantity = Quantity - quantity WHERE Medicine_ID = medicine_id;
    
    SELECT sale_id as New_Sale_ID, total_price as Total_Amount;
END;
*/

-- Working example: Manual stock update (for DB Fiddle)
UPDATE Medicines 
SET Quantity = Quantity - 5 
WHERE Medicine_ID = 1;

-- Show the updated stock
SELECT Medicine_Name, Quantity 
FROM Medicines 
WHERE Medicine_ID = 1;
