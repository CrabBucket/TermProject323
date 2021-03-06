insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(1,'Jordan','Mendez','2020-01-13','Bi-Weekly');

insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(2,'Kevin','Do','2020-01-13','Bi-Weekly');

insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(3,'Max', 'Del Rio','2020-01-13','Bi-Weekly');

insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(4,'Thomas','McSwain','2020-01-13','Bi-Weekly');

insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(5,'David','Brown','2020-01-13','Bi-Weekly');

insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(6,'Miming','Nguyen','2020-01-13','Bi-Weekly');

insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(7,'John','Albery','2020-01-13','Yearly');

insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(8,'John','Doe','2020-01-13','Yearly');

insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(9,'Alan','Cooper','2020-01-13','Yearly');

insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(10,'Adam','Smith','2020-01-13','Yearly');

insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(11,'Mary','Nguyen','2020-01-13','Yearly');


insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(12,'Zhao','Zhong','2020-01-13','Yearly');

insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(13,'Bruce','Lee','2020-01-13','Yearly');

insert into staff 
(staffID,firstname,lastname,startDate,payperiod) 
Values
(14,'Gary','Lee','2020-01-13','Yearly');

-- Making SousChefs for testing
INSERT INTO staff (staffID,firstname,lastname,startDate,payperiod)  VALUES
(15,'Gary','Lee','2020-01-13','Yearly'),
(16,'Gary','Lee','2020-01-13','Yearly'),
(17,'Bary','Ree','2019-01-13','Yearly'),
(18,'Bam','Margera','2020-11-13','Yearly'),
(19,'Flavor','Flav','2017-03-03','Yearly');

INSERT INTO staff 
(staffID,firstname,lastname,startDate,payperiod)
VALUES
(20,'Tommy','Lee','2020-01-13','Yearly'),
(21,'Sarah','Manzela','2020-01-13','Yearly'),
(22,'Kevin','Karagen','2020-01-13','Yearly'),
(23,'Bolton','Bushard','2020-01-13','Yearly'),
(24,'Tommy','Lee','2020-01-13','Yearly'),
(25,'Sarah','Manzela','2020-01-13','Yearly');


insert into salariedStaff (staffID,salaryAmount) 
	(SELECT staffID, 80000.0 FROM staff WHERE staffID > 14);

-- Wage Staff

insert into wagestaff 
(staffID,hourlyWage)
values
(1,12.00);

insert into wagestaff 
(staffID,hourlyWage)
values
(2,12.00);

insert into wagestaff 
(staffID,hourlyWage)
values
(3,12.00);

insert into wagestaff 
(staffID,hourlyWage)
values
(4,12.00);

insert into wagestaff 
(staffID,hourlyWage)
values
(5,12.00);

insert into wagestaff 
(staffID,hourlyWage)
values
(6,12.00);

-- Dishwasher

insert into DishWasher
(staffID)
values
(1);

-- Wait Staff

insert into WaitStaff
(staffID,earnedTip)
values
(2,200.34);

-- Tables
insert into `Table`
(tableNumber)
values
(1);

insert into `Table`
(tableNumber)
values
(2);

insert into `Table`
(tableNumber)
values
(3);

insert into `Table`
(tableNumber)
values
(4);

insert into `Table`
(tableNumber)
values
(5);

insert into `Table`
(tableNumber)
values
(6);

insert into `Table`
(tableNumber)
values
(7);

insert into `Table`
(tableNumber)
values
(8);

-- Assign Table

insert into AssignedTable
(staffID,tableNumber)
values
(2,1);

insert into AssignedTable
(staffID,tableNumber)
values
(2,2);

insert into AssignedTable
(staffID,tableNumber)
values
(2,3);

insert into AssignedTable
(staffID,tableNumber)
values
(2,4);

insert into AssignedTable
(staffID,tableNumber)
values
(2,5);

insert into AssignedTable
(staffID,tableNumber)
values
(2,6);

insert into AssignedTable
(staffID,tableNumber)
values
(2,7);

insert into AssignedTable
(staffID,tableNumber)
values
(2,8);

-- Maitre D'

insert into MaitreD
(staffID)
values
(3);

insert into MaitreD
(staffID)
values
(4);

insert into MaitreD
(staffID)
values
(5);

insert into MaitreD
(staffID)
values
(6);

-- Salaried Staff

insert into salariedStaff
(staffID,salaryAmount)
values
(7,40000); 

insert into salariedStaff
(staffID,salaryAmount)
values
(8,40000);

insert into salariedStaff
(staffID,salaryAmount)
values
(9,23000);

insert into salariedStaff
(staffID,salaryAmount)
values
(10,23000);

insert into salariedStaff
(staffID,salaryAmount)
values
(11,25000);

insert into salariedStaff
(staffID,salaryAmount)
values
(12,25000);

insert into salariedStaff
(staffID,salaryAmount)
values
(13,30000);

insert into salariedStaff
(staffID,salaryAmount)
values
(14,30000);

INSERT INTO salariedStaff
(staffID,salaryAmount)
VALUES
(20,25000),
(21,25000),
(22,25000),
(23,25000),
(24,25000),
(25,25000);

-- Manager

insert into Manager
(managerID)
values
(7);

insert into Manager
(managerID)
values
(8);

-- Chef
insert into Chef
(staffID)
values
(9);

insert into Chef
(staffID)
values
(10);

insert into Chef
(staffID)
values
(11);

insert into Chef
(staffID)
values
(12);

insert into Chef
(staffID)
values
(13);

insert into Chef
(staffID)
values
(14);

INSERT INTO Chef
(staffID)
VALUES
(20),
(21),
(22),
(23),
(24),
(25);
-- Line Cook

insert into lineCook
(staffID)
values
(9);

insert into lineCook
(staffID)
values
(10);

-- Sous Chef



insert into SousChef
(staffID,expertise,isMentoring)
values
(11,'Meat Entrees',12);

insert into SousChef
(staffID,expertise)
values
(12,'Soup');

INSERT INTO SousChef
(staffID,expertise)
VALUES
(20,'appetizer' ),
(21,'Meat Entrees'),
(22,'Meat Entrees'),
(23,'Meat Entrees'),
(24,'Soup'),
(25,'Soup');
-- MentorShip
insert into Mentorship
(staffID,trainingStartDate)
values
(12,'2020-5-5');

insert into Mentorship
(staffID,trainingStartDate,TrainedBy)
values
(20,'2020-5-5',23),
(21,'2020-5-5',23),
(22,'2020-5-5',23);

update SousChef
set isMentoring = 23
where staffID = 20 OR staffID = 21 OR staffID = 22
;
-- Head Chef

insert into HeadChef
(HeadChefID)
values
(13);

insert into HeadChef
(HeadChefID)
values
(14);

-- Station

insert into station
(StationID,StationName)
values
(1,'Butcher');

insert into station
(StationID,StationName)
values
(2,'Fryer');

insert into station
(StationID,StationName)
values
(3,'Grill');

insert into station
(StationID,StationName)
values
(4,'Pantry');

insert into station
(StationID,StationName)
values
(5,'Pastry');

insert into station
(StationID,StationName)
values
(6,'Roaster');

insert into station
(StationID,StationName)
values
(7,'Saute');

insert into station
(StationID,StationName)
values
(8,'Vegetable');

-- Shift 
insert into shift
(ShiftID,ManagerID,HeadChefID,startTime,shiftDate)
values
(1,7,13,'08:00:00','2020-5-5');

insert into shift
(ShiftID,ManagerID,HeadChefID,startTime,shiftDate)
values
(2,7,14,'16:00:00','2020-5-5');

insert into shift
(ShiftID,ManagerID,HeadChefID,startTime,shiftDate)
values
(3,8,13,'08:00:00','2020-5-4');

insert into shift
(ShiftID,ManagerID,HeadChefID,startTime,shiftDate)
values
(4,8,14,'16:00:00','2020-5-4');

-- Shift Assignment 

insert into shift_assignment
(staffID,shiftID)
values
(1,1);

insert into shift_assignment
(staffID,shiftID)
values
(2,1);

insert into shift_assignment
(staffID,shiftID)
values
(7,1);

insert into shift_assignment
(staffID,shiftID)
values
(13,1);

insert into shift_assignment
(staffID,shiftID)
values
(1,2);

insert into shift_assignment
(staffID,shiftID)
values
(2,2);

insert into shift_assignment
(staffID,shiftID)
values
(7,2);

insert into shift_assignment
(staffID,shiftID)
values
(13,2);

-- station-shift

-- Cooking Capabality
insert into CookinCapabality
(FoodItemID,staffID)
values
(5,11);

insert into CookinCapabality
(FoodItemID,staffID)
values
(2,11);

insert into CookinCapabality
(FoodItemID,staffID)
values
(3,11);

insert into CookinCapabality
(FoodItemID,staffID)
values
(13,11);

insert into CookinCapabality
(FoodItemID,staffID)
values
(5,12);
