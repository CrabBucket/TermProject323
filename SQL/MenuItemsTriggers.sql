DELIMITER $$

CREATE TRIGGER `SpiceLevel_BEFORE_DELETE` BEFORE DELETE ON `SpiceLevel` FOR EACH ROW
BEGIN

	SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
     
      SET MESSAGE_TEXT = 'Cannot edit enumration table';
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `SpiceLevel_Before_Insert` BEFORE INSERT ON `SpiceLevel` FOR EACH ROW
BEGIN

	SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
     
      SET MESSAGE_TEXT = 'Cannot edit enumration table';
END$$
DELIMITER ;

DELIMITER $$

CREATE TRIGGER `MeatType_BEFORE_DELETE` BEFORE DELETE ON `MeatType` FOR EACH ROW
BEGIN

	SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
     
      SET MESSAGE_TEXT = 'Cannot edit enumration table';
END$$
DELIMITER ;




DELIMITER $$
CREATE TRIGGER `MeatType_Before_Insert` BEFORE INSERT ON `MeatType` FOR EACH ROW
BEGIN

	SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
     
      SET MESSAGE_TEXT = 'Cannot edit enumration table';
END$$
DELIMITER ;


DELIMITER $$

CREATE TRIGGER `MenuType_BEFORE_DELETE` BEFORE DELETE ON `MenuType` FOR EACH ROW
BEGIN

	SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
     
      SET MESSAGE_TEXT = 'Cannot edit enumration table';
END$$
DELIMITER ;




DELIMITER $$
CREATE TRIGGER `MenuType_Before_Insert` BEFORE INSERT ON `MenuType` FOR EACH ROW
BEGIN

	SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
     
      SET MESSAGE_TEXT = 'Cannot edit enumration table';
END$$
DELIMITER ;






DELIMITER $$
#DROP TRIGGER `Soup_Before_Insert`;
CREATE TRIGGER `Soup_Before_Insert` BEFORE INSERT ON `Soup` FOR EACH ROW

BEGIN
	
    
	IF EXISTS(SELECT 1 FROM 
		(SELECT * FROM 
			((SELECT FoodItemID FROM Appetizer) tmp1) 
            UNION 
            (SELECT FoodItemID FROM MeatEntree)) sub 
            WHERE NEW.FoodItemID = sub.FoodItemID) 
            THEN
				SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
     
					SET MESSAGE_TEXT = 'Broke Sub-Class integrity Constraint';
	END IF;
	
END$$
DELIMITER ;

DELIMITER $$
#DROP TRIGGER `Appetizer_Before_Insert`;
CREATE TRIGGER `Appetizer_Before_Insert` BEFORE INSERT ON `Appetizer` FOR EACH ROW

BEGIN
	
    
	IF EXISTS(SELECT 1 FROM 
		(SELECT * FROM 
			((SELECT FoodItemID FROM Soup) tmp1) 
            UNION 
            (SELECT FoodItemID FROM MeatEntree)) sub 
            WHERE NEW.FoodItemID = sub.FoodItemID) 
            THEN
				SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
     
					SET MESSAGE_TEXT = 'Broke Sub-Class integrity Constraint';
	END IF;
	
END$$
DELIMITER ;

DELIMITER $$
#DROP TRIGGER `MeatEntree_Before_Insert`;
CREATE TRIGGER `MeatEntree_Before_Insert` BEFORE INSERT ON `MeatEntree` FOR EACH ROW

BEGIN
	
    
	IF EXISTS(SELECT 1 FROM 
		(SELECT * FROM 
			((SELECT FoodItemID FROM Soup) tmp1) 
            UNION 
            (SELECT FoodItemID FROM Appetizer)) sub 
            WHERE NEW.FoodItemID = sub.FoodItemID) 
            THEN
				SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
     
					SET MESSAGE_TEXT = 'Broke Sub-Class integrity Constraint';
	END IF;
	
END$$
DELIMITER ;

DELIMITER $$
#DROP TRIGGER `BuffetPrice_Before_Insert`;
CREATE TRIGGER `BuffetPrice_Before_Insert` BEFORE INSERT ON `BuffetPrice` FOR EACH ROW

BEGIN
	
    
	IF EXISTS(SELECT 1 FROM 
		BuffetPrice
            WHERE NEW.MenuType = MenuPrice.MenuType)
            THEN
				SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
     
					SET MESSAGE_TEXT = 'Broke Sub-Class integrity Constraint';
	END IF;
	
END$$
DELIMITER ;

DELIMITER $$
#DROP TRIGGER `MenuPrice_Before_Insert`;
CREATE TRIGGER `MenuPrice_Before_Insert` BEFORE INSERT ON `MenuPrice` FOR EACH ROW

BEGIN
	
    
	IF EXISTS(SELECT 1 FROM 
		MenuPrice
            WHERE NEW.MenuType = BuffetPrice.MenuType)
            THEN
				SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
     
					SET MESSAGE_TEXT = 'Broke Sub-Class integrity Constraint';
	END IF;
	
END$$
DELIMITER ;






