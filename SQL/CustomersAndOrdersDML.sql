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
insert into paymentType(payment) values
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
('Credit', 04);
insert into party(payment, orderNumber) values
('Credit', 05),
('Credit', 06),
('Cash', 07),
('Cash', 08),
('Credit', 09),
('Credit', 10);
insert into party(payment, orderNumber) values
('Cash', 11),
('Cash', 12),
('Credit', 13);
insert into party(payment, orderNumber) values
('MiminigsMoney', 14);
insert into party(payment, orderNumber) values
('MiminigsMoney', 15),
('MiminigsMoney', 16),
('MiminigsMoney', 17),
('MiminigsMoney', 18),
('MiminigsMoney', 19),
('MiminigsMoney', 20);


insert into knownOrder(custID, orderNumber)
	(SELECT 1, orderNumber FROM party WHERE orderNumber > 17);
insert into knownOrder(custID, orderNumber)
	(SELECT 2, orderNumber FROM orders WHERE orderNumber > 13 and orderNumber < 18);
insert into knownOrder(custID, orderNumber)
	(SELECT 3, orderNumber FROM orders WHERE orderNumber > 18 and orderNumber < 21);
insert into knownOrder(custID, orderNumber)
	(SELECT 10, orderNumber FROM orders WHERE orderNumber > 8 and orderNumber < 14);

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
(003, 03, 'Benjamin David Bajurto', 0, NULL, NULL, NULL, 'Benjamin David Bajurto', 'Plex-Art Inc', 'Sales', '8210 S Broadway CA');
(004, 04, 'Jose Ramon Rodriguez', 0, 'Jose Ramon Rodriguez', 'joseRR@gmail.com', 'joseRR@snailmail.com', 'Personio GmbH', 'Engineering', '10221 Altstadtring Munich, Germany'),
insert into customer(custID, orderNumber, customerName, amountOfMimingsMoneySpent, privateCustomerName, 
   email, snailMail, corporationCustomerName, corporationName, organizationName, officeAddress) values
(005, 05, 'David Eckerfield', 0, 'David Eckerfield', 'davidE@gmail.com', 'davidE@snailmail.com', 'U.S Marines', 'IT', '8210 Lincoln Road Miami, Florida'),
insert into customer(custID, orderNumber, customerName, amountOfMimingsMoneySpent, privateCustomerName, 
   email, snailMail, corporationCustomerName, corporationName, organizationName, officeAddress) values
(009, 09, 'Daniel Stier', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(010, 10, 'Max Del Rio', 0, NULL, NULL, NULL, 'Max Del Rio', 'Plex-Art Inc', 'Fabrication', '8210 S Broadway CA'),
(011, 11, 'Kevin Funez', 0, NULL, NULL, NULL, 'Kevin Funez', 'Dip Shipping', 'Sales', '18210 Studebaker CA'),
(012, 12, 'Johnny David', 0, NULL, NULL, NULL, 'Johnny David', 'Dip Shipping', 'Engineering', '18210 Studebaker CA'),
(013, 13, 'Luiz Rodriguez', 0, 'Luiz Rodriguez', 'luisR@gmail.com', 'luisR@snailmail.com', NULL, NULL, NULL, NULL),
(014, 14, 'Daniel Jiron', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(015, 15, 'Ely David Bajurto', 15, 'Ely David Bajurto', 'elyDB@gmail.com', 'elyDB@snailmail.com', NULL, NULL, NULL, NULL),
(016, 16, 'Benjamin David Bajurto', 13, NULL, NULL, NULL, 'Benjamin David Bajurto', 'Plex-Art Inc', 'Sales', '8210 S Broadway CA'),
(017, 17, 'Daniel Stier', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
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


INSERT INTO ItemsOrdered (MenuID,MenuListingID,orderNumber)
	(SELECT MenuID, MenuListingID, 1 FROM MenuOfferings WHERE MenuOfferings.MenuID = 3 AND MenuListingID > 15);
    INSERT INTO ItemsOrdered (MenuID,MenuListingID,orderNumber)
	(SELECT MenuID, MenuListingID, 8 FROM MenuOfferings WHERE MenuOfferings.MenuID = 1 AND MenuListingID < 15);
INSERT INTO ItemsOrdered (MenuID,MenuListingID,orderNumber)
	(SELECT MenuID, MenuListingID, 18 FROM MenuOfferings WHERE MenuOfferings.MenuID = 3 AND MenuListingID > 15);
INSERT INTO ItemsOrdered (MenuID,MenuListingID,orderNumber)
	(SELECT MenuID, MenuListingID, 15 FROM MenuOfferings WHERE MenuOfferings.MenuID = 3 AND MenuListingID < 15);
    
INSERT INTO ItemsOrdered (MenuID,MenuListingID,orderNumber)
	(SELECT MenuID, MenuListingID, 10 FROM MenuOfferings WHERE MenuOfferings.MenuID = 1 AND MenuListingID < 15);