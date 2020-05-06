CREATE TABLE CookinCapabality (
	FoodItemID MEDIUMINT NOT NULL,
    staffID int(11) NOT NULL,
    
    CONSTRAINT PK_CookinCapabality PRIMARY KEY (FoodItemID,staffID),
    CONSTRAINT FK_CookinCapabalityFrom_FoodItem FOREIGN KEY (FoodItemID) REFERENCES FoodItem(FoodItemID),
    CONSTRAINT FK_CookinCapabalityFrom_SousChef FOREIGN KEY (staffID) REFERENCES SousChef(staffID)
	

);