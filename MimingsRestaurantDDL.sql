CREATE TABLE orders(
orderNumber int not null,
customerPhone VARCHAR(15),
orderDate VARCHAR(15),
CONSTRAINT order_pk PRIMARY KEY(orderNumber)
);

CREATE TABLE paymentType(
paymentType VARCHAR(10),
CONSTRAINT paymanyType_pk PRIMARY KEY(paymentType)
);

CREATE TABLE payment(
payment VARCHAR(10),
paymentType VARCHAR(10),
constraint payment_pk PRIMARY KEY(payment),
constraint payment_fk FOREIGN KEY(paymentType) REFERENCES (paymentType);

CREATE TABLE party(
payment VARCHAR(15),
orderNumber int not null,
CONSTRAINT party_pk PRIMARY KEY (orderNumber),
CONSTRAINT party_fk1 FOREIGN KEY(payment) REFERENCES paymentType (payment),
CONSTRAINT party_fk2 FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber)
);

CREATE TABLE knownOrder(
custID int not null,
orderNumber int not null,
CONSTRAINT knownOrder_pk PRIMARY KEY(custID),
CONSTRAINT knownOrder_fk_FromCustomer Foreign Key (custID) REFERENCES customer(custId), 
CONSTRAINT knownOrder_fk1 FOREIGN KEY (orderNumber) REFERENCES party (orderNumber)
);

CREATE TABLE anonymousOrder(
orderNumber int not null,
CONSTRAINT anonymousOrder_pk PRIMARY KEY(orderNumber),
CONSTRAINT anonymousOrder_fk FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber)
);

CREATE TABLE customer(
custID int not null,
orderNumber int not null,
customerName VARCHAR(25),
amountOfMimingsMoneySpent int,
privateCustomerName VARCHAR(25),
email VARCHAR(50),
snailMail VARCHAR(50),
corporationCustomerName VARCHAR(25),
corporationName VARCHAR(50),
organizationName VARCHAR(50),
officeAddress VARCHAR(50),
CONSTRAINT customer_pk PRIMARY KEY(custID)
);

CREATE TABLE advisor(
custID int not null,
contactType VARCHAR(10),
contactName VARCHAR(20),
constraint advisor_pk PRIMARY KEY(custID, contactType),
CONSTRAINT advisor_fk FOREIGN KEY (custID) REFERENCES customer (custID)
);

CREATE TABLE phone(
custID int not null,
phoneNumber VARCHAR(15),
contactType VARCHAR(10),
CONSTRAINT phone_pk PRIMARY KEY(custID, contactType),
constraint phone_fk1 FOREIGN KEY (custID, contactType) REFERENCES advisor(custID, contactType)
);

CREATE TABLE email(
custID int not null,
email VARCHAR(25),
contactType VARCHAR(10),
CONSTRAINT email_pk PRIMARY KEY(custID, contactType),
constraint email_fk1 FOREIGN KEY (custID, contactType) REFERENCES advisor(custID, contactType)
);

CREATE TABLE mail(
custID int not null,
mailingAddress VARCHAR(50),
contactType VARCHAR(10),
CONSTRAINT mail_pk PRIMARY KEY(custID, contactType),
constraint mail_fk1 FOREIGN KEY (custID, contactType) REFERENCES advisor(custID, contactType)
);

CREATE TABLE eatIn(
orderNumber int not null,
tableNumber int,
tableSeat int,
CONSTRAINT eatIn_pk PRIMARY KEY (orderNumber), 
CONSTRAINT eatIn_fk1 FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber),
CONSTRAINT eatIn_fk2 FOREIGN KEY (tableNumber) REFERENCES `Table` (tableNumber)
);

CREATE TABLE toGo(
orderNumber int not null,
orderReceivedTime TIMESTAMP,
orderPickUpTime TIMESTAMP,
CONSTRAINT toGo_pk PRIMARY KEY (orderNumber), 
CONSTRAINT toGo_fk FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber)
);

CREATE TABLE phoneOrder(
orderNumber int not null,
CONSTRAINT phoneOrder_pk PRIMARY KEY (orderNumber),
CONSTRAINT phoneOrder_fk FOREIGN KEY (orderNumber) REFERENCES toGo (orderNumber)
);

CREATE TABLE webOrder(
orderNumber int not null,
CONSTRAINT webOrder_pk PRIMARY KEY (orderNumber),
CONSTRAINT webOrder_fk FOREIGN KEY (orderNumber) REFERENCES toGo (orderNumber)
);

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

); -- CREATE DATABASE `cecs323sec07s31` /*!40100 DEFAULT CHARACTER SET latin1 */;


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
#DROP TABLE FoodItem;
CREATE TABLE FoodItem (
	FoodItemID MEDIUMINT NOT NULL Auto_Increment,
	Price DECIMAL(5,2) NOT NULL,
    DisplayName VARCHAR(100) NOT NULL,
    SpiceLevel VARCHAR(30) NOT NULL,

	CONSTRAINT PK_FoodItem PRIMARY KEY (FoodItemID)

);
#DROP TABLE MenuDeals;
CREATE TABLE MenuDeals (
	MenuListingID MEDIUMINT NOT NULL,
    FoodItemID MEDIUMINT NOT NULL,
    
    CONSTRAINT PK_MenuDeals PRIMARY KEY (MenuListingID,FoodItemID),
    CONSTRAINT FK_MenuDealsFrom_MenuListing FOREIGN KEY (MenuListingID) REFERENCES MenuListing(MenuListingID),
    CONSTRAINT FK_MenuDealsFrom_FoodItem FOREIGN KEY (FoodItemID) REFERENCES FoodItem(FoodItemID)
	


);
#DROP TABLE Appetizer;
CREATE TABLE Appetizer (
	FoodItemID MEDIUMINT NOT NULL,
    
	CONSTRAINT PK_Appetizer PRIMARY KEY (FoodItemID),
	CONSTRAINT FK_AppetizerFrom_FoodItem FOREIGN KEY (FoodItemID) REFERENCES FoodItem(FoodItemID)

);
#DROP TABLE Soup;
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





#COMMIT;

#ROLLBACK TO beforeinser;

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

); -- CREATE DATABASE `cecs323sec07s31` /*!40100 DEFAULT CHARACTER SET latin1 */;


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
#DROP TABLE FoodItem;
CREATE TABLE FoodItem (
	FoodItemID MEDIUMINT NOT NULL Auto_Increment,
	Price DECIMAL(5,2) NOT NULL,
    DisplayName VARCHAR(100) NOT NULL,
    SpiceLevel VARCHAR(30) NOT NULL,

	CONSTRAINT PK_FoodItem PRIMARY KEY (FoodItemID)

);
#DROP TABLE MenuDeals;
CREATE TABLE MenuDeals (
	MenuListingID MEDIUMINT NOT NULL,
    FoodItemID MEDIUMINT NOT NULL,
    
    CONSTRAINT PK_MenuDeals PRIMARY KEY (MenuListingID,FoodItemID),
    CONSTRAINT FK_MenuDealsFrom_MenuListing FOREIGN KEY (MenuListingID) REFERENCES MenuListing(MenuListingID),
    CONSTRAINT FK_MenuDealsFrom_FoodItem FOREIGN KEY (FoodItemID) REFERENCES FoodItem(FoodItemID)
	


);
#DROP TABLE Appetizer;
CREATE TABLE Appetizer (
	FoodItemID MEDIUMINT NOT NULL,
    
	CONSTRAINT PK_Appetizer PRIMARY KEY (FoodItemID),
	CONSTRAINT FK_AppetizerFrom_FoodItem FOREIGN KEY (FoodItemID) REFERENCES FoodItem(FoodItemID)

);
#DROP TABLE Soup;
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

-- Use database
use cecs323sec07bg05;

-- create table name staff
create table staff (
	staffID int not null,
    firstname varchar(20) not null,
    lastname varchar(20) not null,
    startDate date not null,
    payperiod varchar(12),
    Primary Key (staffId)
);

create table station (
	StationID int not null,
    StationName VARCHAR(20) not null,
    primary key(stationID,StationName)
);

create table wagestaff (
	staffID int not null,
    hourlyWage double not null,
    primary key (staffID),
    CONSTRAINT wagestaff_foreignkey 
    FOREIGN KEY (staffID)
    REFERENCES staff (staffID)
);

create table MaitreD (
	staffID int not null,
    primary key (staffID),
    CONSTRAINT maitre_d_foreignkey
    foreign key (staffID)
    REFERENCES wagestaff (staffID)
);

create table DishWasher (
	staffID int not null,
    primary key (staffID),
    CONSTRAINT dishwasher_foreignkey
    foreign Key (staffID)
    REFERENCES wagestaff (staffID)
);

create table WaitStaff (
	staffID int not null,
    earnedTip double,
    primary key (staffID),
    CONSTRAINT waitstaff_foreignkey
    foreign Key (staffID)
    REFERENCES wagestaff (staffID)
);

create table `Table` (
	tableNumber int not null,
    primary key (tableNumber,tableName)
);


create table AssignedTable (
	staffID int not null,
    tableNumber int not null,
    primary key (staffID, tableNumber),
    constraint AssignTable_Table_Key 
    foreign key (tableNumber) 
    REFERENCES `Table` (tableNumber),
    constraint AssignTable_WaitStaff_Key
    foreign key (staffID) 
    REFERENCES WaitStaff (staffID)
);

create table salariedStaff (
	staffID int not null,
    salaryAmount double not null,
    primary key (staffID),
    constraint salariedStaff_foreignkey
    foreign key (staffID)
    REFERENCES staff (staffID)
);

create table Manager(
	managerID int not null,
    primary key (managerID),
    constraint manager_foreignkey
    foreign key (managerID)
    REFERENCES salariedStaff (staffID)
);

create table Chef (
	staffID int not null,
    primary key (staffID),
    constraint chef_foreignkey
    foreign key (staffID)
    REFERENCES salariedStaff(staffID)
);

create table HeadChef (
	HeadChefID int not null,
    primary key (HeadChefID),
    constraint HeadChef_ForeignKey
    foreign key (HeadChefID)
    REFERENCES Chef(staffID)
);
    

create table SousChef (
	staffID int not null,
    expertise varChar(20) not null,
    isMentoring int,
    trainedBy int,
    constraint Sous primary key (staffID,expertise),
    constraint SousChef_foreignKey1 foreign key (staffID)
    REFERENCES Chef(staffID),
    constraint SousChef_foreignKey2 foreign key (trainedBy) REFERENCES HeadChef (HeadChefID)
);
    
create table Mentorship (
	staffID int not null,
    trainingStartDate date,
    trainingEndDate date,
    primary key (staffID),
    constraint Mentorship_foreignKey
    foreign key (staffID)
    references SousChef (staffID)
);

create table lineCook (
	staffID int not null,
    primary key (staffID),
    constraint lineCook_ForeignKey
    foreign key (staffID)
    references Chef(staffID)
);

create table shift (
	shiftID int not null,
    managerID int not null,
    headChefID int not null,
    startTime time,
    shiftDate date,
    primary key (shiftID),
    constraint shift_manager_key
    foreign key (managerID)
    references Manager (managerID),
    constraint shift_headchef_key
    foreign key (headChefID)
    REFERENCES HeadChef(HeadChefID)
);

-- Shift Assignment
create table shift_assignment (
	staffID int not null,
    ShiftID int not null,
    primary key (staffID,ShiftID),
    constraint staff_to_shift_assignment_foreignkey
    foreign key (staffID)
    REFERENCES staff (StaffID),
    constraint shift_to_shift_assignment_foreignkey
    foreign key (shiftID)
    REFERENCES shift (shiftID)
);

-- Station-Shift
create table station_shift (
	StationID int not null,
    LineCookID int not null,
    ShiftID int not null,
    StationName VARCHAR(20) not null,
    primary key (StationID,LineCookID,ShiftID,StationName),
	constraint station_shift_station_FK
    foreign key (StationID,StationName)
    references station (StationID,StationName),
    constraint station_shift_lineCook_FK
    foreign key (LineCookID)
    references lineCook(staffID),
    constraint station_shift_assignment_FK
    foreign key (LineCookID , ShiftID)
    references shift_assignment (staffID , ShiftID)
);

-- Cooking Capability
-- create table cookingCapability (
--	staffID int not null,
--    foodItemID int not null,
--    primary key (staffID , foodItemID),
--    constraint staffID_to_cookingCapability_ForeignKey
 --   Foreign Key (staffID)
--    references SousChef (staffID),
    -- Finish this module lock
--    constraint foodItem_to_cookingCapability_ForeignKey
--    Foreign Key (foodItemID)
--    references 
    -- Finish this module lock
-- );

-- recipes
-- create table Recipes (
-- MenuListingID int not null,
--    staffID int not null,
--    RecipeName varchar(20),
--    primary key (MenuListingID, staffID),
--    constraint headChef_to_Recipes_ForeignKey
--    Foreign Key (staffID)
--    references HeadChef (HeadChefID),
    -- Finish this module lock
--    constraint MenuListing_to_Recipes_ForeignKey
--    Foreign Key (MenuListingID)
--    references 
    -- Finish this module lock
-- );

