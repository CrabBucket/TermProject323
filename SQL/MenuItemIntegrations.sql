CREATE TABLE CookinCapabality (
	FoodItemID MEDIUMINT NOT NULL,
    staffID int(11) NOT NULL,
    
    CONSTRAINT PK_CookinCapabality PRIMARY KEY (FoodItemID,staffID),
    CONSTRAINT FK_CookinCapabalityFrom_FoodItem FOREIGN KEY (FoodItemID) REFERENCES FoodItem(FoodItemID),
    CONSTRAINT FK_CookinCapabalityFrom_SousChef FOREIGN KEY (staffID) REFERENCES SousChef(staffID)
	

);

CREATE TABLE ItemsOrdered (
	MenuID MEDIUMINT NOT NULL,
    MenuListingID MEDIUMINT NOT NULL,
    orderNumber int NOT NULL,
    
    CONSTRAINT PK_ItemsOrdered PRIMARY KEY (MenuID,MenuListingID),
    CONSTRAINT FK_ItemsOrderedFrom_MenuOfferings FOREIGN KEY (MenuId,MenuListingID) REFERENCES MenuOfferings(MenuID,MenuListingID),
    CONSTRAINT FK_ItemsOrderedFrom_orders FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber)
	

);