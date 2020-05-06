CREATE TABLE MenuType(
	MenuType VARCHAR(50) NOT NULL,

	CONSTRAINT PK_MenuType PRIMARY KEY (MenuType)

);
CREATE TABLE MenuPrice(
	MenuType VARCHAR(50) NOT NULL,
    MenuRate DECIMAL(1,3) NOT NULL,

	CONSTRAINT PK_MenuPrice PRIMARY KEY (MenuType),
    CONSTRAINT FK_MenuPrice FOREIGN KEY (MenuType) REFERENCES MenuType(MenuType)

);
CREATE TABLE BuffetPrice(
	MenuType VARCHAR(50) NOT NULL,
    Price DECIMAL(3,2) NOT NULL,

	CONSTRAINT PK_BuffetPrice PRIMARY KEY (MenuType),
    CONSTRAINT FK_BuffetPrice FOREIGN KEY (MenuType) REFERENCES MenuType(MenuType)

);

CREATE TABLE Menu(
	MenuID MEDIUMINT NOT NULL Auto_Increment,
    MenuType VARCHAR(50) NOT NULL,

	CONSTRAINT PK_Menu PRIMARY KEY (MenuID),
    CONSTRAINT FK_Menu FOREIGN KEY (MenuType) REFERENCES MenuType(MenuType)

);
CREATE TABLE MenuListing (
	MenuListingID MEDIUMINT NOT NULL Auto_Increment,
    DiscountRate DECIMAL(3,2) NOT NULL,
    DisplayName VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_MenuListing PRIMARY KEY (MenuListingID)



);
CREATE TABLE MenuOfferings(
	MenuID MEDIUMINT NOT NULL,
	MenuListingID MEDIUMINT NOT NULL,
    
    CONSTRAINT PK_MenuOfferings PRIMARY KEY (MenuID,MenuListingID),
    CONSTRAINT FK_From_Menu FOREIGN KEY (MenuID) REFERENCES Menu(MenuID),
    CONSTRAINT FK_From_MenuListing FOREIGN KEY (MenuListingID) REFERENCES MenuListing(MenuListingID)
	

);
CREATE TABLE SpiceLevel(
	SpiceLevel VARCHAR(30) NOT NULL,

	 CONSTRAINT PK_SpiceLevel PRIMARY KEY (SpiceLevel)

);
CREATE TABLE FoodItem (
	FoodItemID MEDIUMINT NOT NULL Auto_Increment,
	MenuRate DECIMAL(3,2) NOT NULL,
    DisplayName VARCHAR(100) NOT NULL,
    SpiceLevel VARCHAR(30) NOT NULL,

	CONSTRAINT PK_FoodItem PRIMARY KEY (FoodItemID)

);