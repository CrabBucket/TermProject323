CREATE TABLE MenuType(
	MenuType VARCHAR(50) NOT NULL,

	CONSTRAINT PK_MenuType PRIMARY KEY (MenuType)

);
CREATE TABLE MenuPrice(
	MenuType VARCHAR(50) NOT NULL,
    MenuRate DECIMAL(2,2) NOT NULL,

	CONSTRAINT PK_MenuPrice PRIMARY KEY (MenuType),
    CONSTRAINT FK_MenuPrice FOREIGN KEY (MenuType) REFERENCES MenuType(MenuType)

);
CREATE TABLE BuffetPrice(
	MenuType VARCHAR(50) NOT NULL,
    Price DECIMAL(5,2) NOT NULL,

	CONSTRAINT PK_BuffetPrice PRIMARY KEY (MenuType),
    CONSTRAINT FK_BuffetPrice FOREIGN KEY (MenuType) REFERENCES MenuType(MenuType)

);CREATE DATABASE `cecs323sec07s31` /*!40100 DEFAULT CHARACTER SET latin1 */;


CREATE TABLE Menu(
	MenuID MEDIUMINT NOT NULL Auto_Increment,
    MenuType VARCHAR(50) NOT NULL,

	CONSTRAINT PK_Menu PRIMARY KEY (MenuID),
    CONSTRAINT FK_Menu FOREIGN KEY (MenuType) REFERENCES MenuType(MenuType)

);
CREATE TABLE MenuListing (
	MenuListingID MEDIUMINT NOT NULL Auto_Increment,
    DiscountRate DECIMAL(5,2) NOT NULL,
    DisplayName VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_MenuListing PRIMARY KEY (MenuListingID)



);
CREATE TABLE MenuOfferings(
	MenuID MEDIUMINT NOT NULL,
	MenuListingID MEDIUMINT NOT NULL,
    
    CONSTRAINT PK_MenuOfferings PRIMARY KEY (MenuID,MenuListingID),
    CONSTRAINT FK_MenuOfferingsFrom_Menu FOREIGN KEY (MenuID) REFERENCES Menu(MenuID),
    CONSTRAINT FK_MenuOfferingsFrom_MenuListing FOREIGN KEY (MenuListingID) REFERENCES MenuListing(MenuListingID)
	

);
CREATE TABLE SpiceLevel(
	SpiceLevel VARCHAR(30) NOT NULL,

	 CONSTRAINT PK_SpiceLevel PRIMARY KEY (SpiceLevel)

);
CREATE TABLE FoodItem (
	FoodItemID MEDIUMINT NOT NULL Auto_Increment,
	Price DECIMAL(5,2) NOT NULL,
    DisplayName VARCHAR(100) NOT NULL,
    SpiceLevel VARCHAR(30) NOT NULL,

	CONSTRAINT PK_FoodItem PRIMARY KEY (FoodItemID)

);
CREATE TABLE MenuDeals (
	MenuListingID MEDIUMINT NOT NULL,
    FoodItemID MEDIUMINT NOT NULL,
    
    CONSTRAINT PK_MenuDeals PRIMARY KEY (MenuListingID,FoodItemID),
    CONSTRAINT FK_MenuDealsFrom_MenuListing FOREIGN KEY (MenuListingID) REFERENCES MenuListing(MenuListingID),
    CONSTRAINT FK_MenuDealsFrom_FoodItem FOREIGN KEY (FoodItemID) REFERENCES FoodItem(FoodItemID)
	


);

CREATE TABLE Appetizer (
	FoodItemID MEDIUMINT NOT NULL,
    
	CONSTRAINT PK_Appetizer PRIMARY KEY (FoodItemID),
	CONSTRAINT FK_AppetizerFrom_FoodItem FOREIGN KEY (FoodItemID) REFERENCES FoodItem(FoodItemID)

);

CREATE TABLE Soup (
	FoodItemID MEDIUMINT NOT NULL,
	
    CONSTRAINT PK_Soup PRIMARY KEY (FoodItemID),
	CONSTRAINT FK_SoupFrom_FoodItem FOREIGN KEY (FoodItemID) REFERENCES FoodItem(FoodItemID)

);
CREATE TABLE MeatType(
	MeatName VARCHAR(30) NOT NULL,

	 CONSTRAINT PK_MeatType PRIMARY KEY (MeatName)

);


CREATE TABLE MeatEntree(
	FoodItemID MEDIUMINT NOT NULL,
    MeatName VARCHAR(30) NOT NULL,
    
	
    CONSTRAINT PK_MeatEntree PRIMARY KEY (FoodItemID),
    CONSTRAINT FK_MeatEntreeFrom_FoodItem FOREIGN KEY (MeatName) REFERENCES MeatType(MeatName),
	CONSTRAINT FK_MeatEntreeFrom_MeatEnum FOREIGN KEY (MeatName) REFERENCES MeatType(MeatName)

);

