-- Use database
use cecs323sec07s19;

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
    primary key(stationID)
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
    primary key (tableNumber)
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
    trainingStartDate date,
    trainingEndDate date,
    trainedBy int not null,
    primary key (staffID),
    constraint SousChef_foreignKey1
    foreign key (staffID)
    REFERENCES Chef(staffID),
    constraint SousChef_foreignKey2
    foreign key (trainedBy)
    REFERENCES HeadChef (HeadChefID)
);

create table Mentorship (
	staffID int not null,
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
    primary key (StationID,LineCookID,ShiftID),
	constraint station_shift_station_FK
    foreign key (StationID)
    references station (StationID),
    constraint station_shift_lineCook_FK
    foreign key (LineCookID)
    references lineCook(staffID),
    constraint station_shift_assignment_FK
    foreign key (LineCookID , ShiftID)
    references shift_assignment (staffID , ShiftID)
);

-- Cooking Capability
create table cookingCapability (
	staffID int not null,
    foodItemID int not null,
    primary key (staffID , foodItemID),
    constraint staffID_to_cookingCapability_ForeignKey
    Foreign Key (staffID)
    references SousChef (staffID),
    -- Finish this module lock
    constraint foodItem_to_cookingCapability_ForeignKey
    Foreign Key (foodItemID)
    references 
    -- Finish this module lock
);

-- recipes
create table Recipes (
	MenuListingID int not null,
    staffID int not null,
    RecipeName varchar(20),
    primary key (MenuListingID, staffID),
    constraint headChef_to_Recipes_ForeignKey
    Foreign Key (staffID)
    references HeadChef (HeadChefID),
    -- Finish this module lock
    constraint MenuListing_to_Recipes_ForeignKey
    Foreign Key (MenuListingID)
    references 
    -- Finish this module lock
);