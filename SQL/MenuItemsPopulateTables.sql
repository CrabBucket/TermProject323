#SET autocommit = OFF;
#START TRANSACTION;
SAVEPOINT beforeinsert;
INSERT INTO FoodItem (DisplayName,Price,SpiceLevel) VALUES ('Egg Drop',10.99,'Tangy'),('Spicy Udon',8.99,'Hot'),('Pork Ramen',10.99,'Mild'),('Chicken Noodle',4.99,'Mild'),('Wonton Soup',6.99,'Mild');
INSERT INTO Soup (FoodItemID) 
(SELECT FoodItemID FROM FoodItem);

INSERT INTO FoodItem (DisplayName,Price,SpiceLevel) VALUES ('Egg Roll',3.99,'Tangy'),('Fried Rice',4.99,'Hot'),('Tempura',3.99,'Mild'),('Salad',1.99,'Mild'),('Spicy Salad',2.99,'Hot');
INSERT INTO Appetizer (FoodItemID)
SELECT FoodItemID FROM FoodItem WHERE FoodItem.FoodItemID NOT IN (Select FoodItemID FROM Soup);

INSERT INTO FoodItem (DisplayName,Price,SpiceLevel) VALUES ('Orange Chicken',12.99,'Tangy'),('Porkchop',15.99,'Hot'),('Steak',18.99,'Mild'),('Kung Pao Chicken',14.99,'Oh My God'),('Broccoli Beef',12.99,'Mild');
#CREATE VIEW soupapp AS  SELECT FoodItemID FROM (SELECT * FROM Soup ) tmp UNION (Select FoodItemID FROM Appetizer tmp2);
INSERT INTO MeatEntree (FoodItemID,MeatName)
SELECT FoodItemID,'Chicken' FROM FoodItem WHERE FoodItemID NOT IN (SELECT FoodItemID FROM soupapp);


INSERT INTO MenuListing (DisplayName, DiscountRate)
	(SELECT DisplayName, 0 FROM FoodItem);
    
INSERT INTO MenuDeals (MenuListingID, FoodItemID) 
	(SELECT MenuListingID, MenuListingID as FoodItemID FROM MenuListing);

INSERT INTO MenuListing (DisplayName,DiscountRate) VALUES ('Orange Chicken Dinner Combo', 0.15),('Porkchop Dinner Combo', 0.20),('Big Jim''s Eat Everything Combo', 0.50);
INSERT INTO MenuDeals (MenuListingID, FoodItemID) VALUES (16,11),(16,6),(16,1),(17,12),(17,7),(17,2);

INSERT INTO MenuDeals (MenuListingID, FoodItemID)
	(SELECT 18, FoodItemID FROM FoodItem);
INSERT INTO Menu (MenuType) SELECT MenuType FROM MenuType;
INSERT INTO MenuOfferings (MenuID,MenuListingID) 
	SELECT 1,MenuListingID FROM MenuListing;
INSERT INTO MenuOfferings (MenuID,MenuListingID) 
	SELECT 2,MenuListingID FROM MenuListing;
INSERT INTO MenuOfferings (MenuID,MenuListingID) 
	SELECT 3,MenuListingID FROM MenuListing;
#INSERT INTO MenuOfferings (MenuID,MenuListingID) 
#	SELECT 3,MenuListingID FROM MenuListing;

INSERT INTO MenuPrice (MenuType,MenuRate) VALUES ('Lunch',1),('Evening',1.2),('Childrens',0.8);
INSERT INTO BuffetPrice (MenuType,Price) VALUEs ('Sunday Brunch Buffet',25.50);



#COMMIT;

#ROLLBACK TO beforeinser;