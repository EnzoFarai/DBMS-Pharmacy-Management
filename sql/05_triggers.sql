-- Trigger to update medicine quantity after sale
DELIMITER //
CREATE TRIGGER UpdateStockAfterSale
AFTER INSERT ON Sale_Details
FOR EACH ROW
BEGIN
    UPDATE Medicines 
    SET quantity = quantity - NEW.quantity_sold
    WHERE medicine_id = NEW.medicine_id;
END//
DELIMITER ;

-- Trigger to prevent expired medicines from being sold
DELIMITER //
CREATE TRIGGER PreventExpiredMedicineSale
BEFORE INSERT ON Sale_Details
FOR EACH ROW
BEGIN
    DECLARE medicine_expiry DATE;
    DECLARE medicine_quantity INT;
    
    SELECT expiry_date, quantity INTO medicine_expiry, medicine_quantity
    FROM Medicines 
    WHERE medicine_id = NEW.medicine_id;
    
    IF medicine_expiry < CURDATE() THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot sell expired medicine';
    END IF;
    
    IF NEW.quantity_sold > medicine_quantity THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Insufficient stock available';
    END IF;
END//
DELIMITER ;
