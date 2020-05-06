insert into orders(orderNumber, customerPhone, orderDate) values
(01, '526-872-7431', '2017-10-30'),
(02, '321-872-9343', '2017-05-15'),
(03, '123-954-9533', '2017-12-18'),
(04, '321-445-5431', '2017-05-20'),
(05, '221-543-4412', '2018-22-05'),
(06, '501-593-9042', '2018-01-17'),
(07, '910-019-0192', '2018-07-09'),
(08, '901-191-1192', '2018-05-08'),
(09, '513-222-6897', '2019-02-25'),
(10, '741-498-3432', '2019-05-08'),
(11, '601-654-9564', '2019-05-08'),
(12, '901-543-1101', '2019-05-08'),
(13, '313-691-9012', '2019-05-08'),
(14, '526-872-7431', '2019-05-08'),
(15,'321-872-9343', '2019-01-18'),
(16, '123-954-9533', '2019-10-16'),
(17, '513-222-6897', '2019-11-05'),
(18, '221-543-4412', '2019-12-28'),
(19, '741-498-3432', '2019-07-05'),
(20, '321-445-5431', '2019-03-03');

--payments
insert into paymentType(paymentType) values
('Cash'),
('Credit'),
('Debit'),
('MiminigsMoney');

insert into payments(payment, paymentType) values
(, 'Cash'),
(, 'Credit'),
(, 'Debit'),
(, 'MimingsMoney');

insert into party (payment,orderNumber) 
	(SELECT 'Mimings Money', orderNumber FROM orders where orders.orderNumber > 13);


insert into party(payment, orderNumber) values
('Cash', 01),
('Cash', 02),
('Cash', 03),
('Credit', 04),
('Credit', 05),
('Credit', 06),
('Cash', 07),
('Cash', 08),
('Credit', 09),
('Credit', 10),
('Cash', 11),
('Cash', 12),
('Credit', 13),
('Mimings Money', 14),
('Mimings Money', 15),
('Mimings Money', 16),
('Mimings Money', 17),
('Mimings Money', 18),
('Mimings Money', 19),
('Mimings Money', 20);


insert into knownOrder(custID, orderNumber)
	(SELECT 1, orderNumber FROM orders WHERE orderNumber > 17);
insert into knownOrder(custID, orderNumber)
	(SELECT 2, orderNumber FROM orders WHERE orderNumber > 13 and orderNumber < 18);
insert into knownOrder(custID, orderNumber)
	(SELECT 3, orderNumber FROM orders WHERE orderNumber > 18 and orderNumber < 21);

insert into knownOrder(custID, orderNumber) values
(001, 01),
(002, 02),
(003, 03),
(004, 04),
(005, 05),
(009, 09),
(010, 10),
(011, 11),
(012, 12),
(013, 13),
(001, 14),
(002, 15),
(003, 16),
(009, 17),
(005, 18),
(010, 19),
(004, 20);

insert into anonymousOrder(orderNumber) values
(06),
(07),
(08);

insert into customer(custID, orderNumber, customerName, amountOfMimingsMoneySpent, privateCustomerName, 
   email, snailMail, corporationCustomerName, corporationName, organizationName, officeAddress)
	(SELECT 1, customerName FROM customer WHERE privateCustomerName is null AND where corporationCustomerName is null);
insert into customer(custID, orderNumber, customerName, amountOfMimingsMoneySpent, privateCustomerName, 
   email, snailMail, corporationCustomerName, corporationName, organizationName, officeAddress)
	(SELECT 2, customerName FROM customer WHERE corporationCustomerName is not null);
insert into customer(custID, orderNumber, customerName, amountOfMimingsMoneySpent, privateCustomerName, 
   email, snailMail, corporationCustomerName, corporationName, organizationName, officeAddress)
	(SELECT 3, customerName FROM customer WHERE privateCustomerName is not null);

insert into customer(custID, orderNumber, customerName, amountOfMimingsMoneySpent, privateCustomerName, 
   email, snailMail, corporationCustomerName, corporationName, organizationName, officeAddress) values
(001, 01, 'Daniel Jiron', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(002, 02, 'Ely David Bajurto', 0, 'Ely David Bajurto', 'elyDB@gmail.com', 'elyDB@snailmail.com', NULL, NULL, NULL, NULL),
(003, 03, 'Benjamin David Bajurto', 0, NULL, NULL, NULL, 'Benjamin David Bajurto', 'Plex-Art Inc', 'Sales', '8210 S Broadway CA'),
(004, 04, 'Jose Ramon Rodriguez', 0, 'Jose Ramon Rodriguez', 'joseRR@gmail.com', 'joseRR@snailmail.com', 'Personio GmbH', 'Engineering', '10221 Altstadtring Munich, Germany'),
(005, 05, 'David Eckerfield', 0, 'David Eckerfield', 'davidE@gmail.com', 'davidE@snailmail.com', 'U.S Marines', 'IT', '8210 Lincoln Road Miami, Florida'),
(009, 09, 'Daniel Stier', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(010, 10, 'Max Del Rio', 0, NULL, NULL, NULL, 'Max Del Rio', 'Plex-Art Inc', 'Fabrication', '8210 S Broadway CA'),
(011, 11, 'Kevin Funez', 0, NULL, NULL, NULL, 'Kevin Funez', 'Dip Shipping', 'Sales', '18210 Studebaker CA'),
(012, 12, 'Johnny David', 0, NULL, NULL, NULL, 'Johnny David', 'Dip Shipping', 'Engineering', '18210 Studebaker CA'),
(013, 13, 'Luiz Rodriguez', 0, 'Luiz Rodriguez', 'luisR@gmail.com', 'luisR@snailmail.com', NULL, NULL, NULL, NULL),
(001, 14, 'Daniel Jiron', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(002, 15, 'Ely David Bajurto', 15, 'Ely David Bajurto', 'elyDB@gmail.com', 'elyDB@snailmail.com', NULL, NULL, NULL, NULL),
(003, 16, 'Benjamin David Bajurto', 13, NULL, NULL, NULL, 'Benjamin David Bajurto', 'Plex-Art Inc', 'Sales', '8210 S Broadway CA'),
(009, 17, 'Daniel Stier', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(005, 18, 'David Eckerfield', 6, 'David Eckerfield', 'davidE@gmail.com', 'davidE@snailmail.com', 'U.S Marines', 'IT', '8210 Lincoln Road Miami, Florida'),
(010, 19, 'Max Del Rio', 5, NULL, NULL, NULL, 'Max Del Rio', 'Plex-Art Inc', 'Fabrication', '8210 S Broadway CA'),
(004, 20, 'Jose Ramon Rodriguez', 8, 'Jose Ramon Rodriguez', 'joseRR@gmail.com', 'joseRR@snailmail.com', 'Personio GmbH', 'Engineering', '10221 Altstadtring Munich, Germany');

insert into insert into advisor(custID, contactType, contactName)
	(SELECT 1, contactType FROM advisor WHERE contactType = 'Phone');
insert into knownOrder(custID, orderNumber)
	(SELECT 2, contactType FROM advisor WHERE contactType = 'Email');;
insert into knownOrder(custID, orderNumber)
	(SELECT 3, contactType FROM advisor WHERE contactType = 'Mail');

insert into advisor(custID, contactType, contactName) values
(003, 'Phone', 'Johnny Bajurto'),
(004, 'Email', 'Brayan Funez'),
(004, 'Mail', 'Carlos Funez'),
(004, 'Phone', 'Johnny Bajurto'),
(005, 'Mail', 'Carlos Funez'),
(005, 'Phone', 'Zemial').
(010, 'Phone', 'Zemial'),
(010, 'Mail', 'Danny'),
(011, 'Email', 'Vincent'),
(012, 'Mail', 'Danny');

insert into phone(custID, phoneNumber, contactType) values
(003, '123-954-9533', 'Phone'),
(011, '601-654-9564', 'Phone'),
(004, '321-445-5431', 'Phone'),
(005, '221-543-4412', 'Phone');

insert into email(custID, email, contactType) values
(004, 'joseRR@gmail.com', 'Email'),
(005, 'davidE@gmail.com', 'Email');

insert into mail(custID, mailingAddress, contactType) values
(005, '8210 Lincoln Road Miami, Florida', 'Mail'),
(010, '8210 S Broadway CA', 'Mail'),
(012, '18210 Studebaker CA', 'Mail'),
(004, '10221 Altstadtring Munich, Germany', 'Mail'),
(003, '8210 S Broadway CA', 'Mail'),
(010, '8210 S Broadway CA', 'Mail');

insert into eatIn(orderNumber, tableNumber, tableSeat) values
(01, , ),
(09, , ),
(13, , ),
(14, , ),
(19, , ),
(20, , );

insert into toGo(orderNumber, orderReceivedTime, orderPickUpTime) values
(02, '2017-05-15 10:00:00', '2017-05-15 10:15:00'),
(03, '2017-12-18 12:45:00', '2017-12-18 13:00:00' ),
(04, '2017-05-20 15:30:00', '2017-05-20 15:45:00'),
(05, '2018-22-05 11:00:00', '2018-22-05 11:15:00'),
(15, '2019-05-08 22:30:00', '2019-05-08 22:45:00' ),
(16, '2019-10-16 16:20:00', '2019-10-16 16:35:00' ),
(17, '2019-11-05 09:30:00', '2019-11-05 09:45:00'),
(18, '2019-12-28 17:00:00', '2019-12-28 17:15:00');


insert into phoneOrder(orderNumber) values
(02)
(04);

insert into webOrder(orderNumber) values
(03)
(05);

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