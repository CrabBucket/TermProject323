use cecs323sec07s19;

create table staff (
	staffID int not null,
    firstname varchar(20) not null,
    lastname varchar(20) not null,
    startDate date not null,
    payperiod varchar(12),
    Primary Key (staffId)
);

create table wagestaff (
	staffID int not null,
    hourlyWage double not null,
    primary key (staffID),
    CONSTRAINT `wagestaff_foreignkey` 
    FOREIGN KEY (staffID)
    REFERENCES staff (staffID)
);

create table `Maitre D'` (
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

create table `Wait Staff` (
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
    constraint AssignTableFromTable_ForeignKey
    foreign key (tableNumber)
    REFERENCES `Table` (tableNumber),
    constraint AssignTableFromWaitStaff_ForeignKey
    foreign key (staffID)
    REFERENCES `Wait Staff` (staffID)
);

drop table AssignedTable;
    

create table salariedStaff (
	staffID int not null,
    salaryAmount double not null,
    primary key (staffID),
    constraint `salariedStaff_foreignkey`
    foreign key (staffID)
    REFERENCES staff (staffID)
);

create table Manager(
	managerID int not null,
    primary key (managerID),
    constraint `manager_foreignkey`
    foreign key (managerID)
    REFERENCES salariedStaff (staffID)
);





