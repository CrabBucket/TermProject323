insert into orders(orderNumber, bill, customerPhone, orderDate) values
(01, 20, '526-872-7431', '2017-10-30'),
(02, 15, '321-872-9343', '2017-05-15'),
(03, 50, '123-954-9533', '2017-12-18'),
(04, 30, '321-445-5431', '2018-05-20'),
(05, 50, '123-954-9533', '2018-22-05'),
(06, 17.25, '123-954-9533', '2018-01-17'),
(07, 20.75, '123-954-9533', '2019-07-09'),
(08, 30.50, '123-954-9533', '2019-05-08'),
(09, 100, '123-954-9533', '2019-02-25');

--payments
insert into () values
()
()
()
()
()
()
()
()
();

insert into party(payment, orderNumber) values
('Cash', 001)
('Cash', 002)
('Cash', 003)
('Credit', 004)
('Credit', 005)
('Credit', 006)
('MimingsMoney', 007)
('MimingsMoney', 008)
('MimingsMoney', 009);

insert into knownOrder(custID, orderNumber, customerName) values
(001, 01, 'Daniel Jiron'),
(002, 02, 'Ely David Bajurto'),
(003, 03, 'Benjamin David Bajurto'),
(004, 04, 'Jose Ramon Rodriguez'),
(005, 05, 'David Eckerfield'),
(009, 09, 'Daniel Stier');

insert into anonymousOrder(orderNumber) values
(06)
(07)
(08);

insert into customer(custID, customerName, amountOfMimingsMoneySpent, privateCustomerName, 
   email, snailMail, corporationCustomerName, corporationName, organizationName, officeAddress) values
(001, 'Daniel Jiron', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(002, 'Ely David Bajurto', 1, 'Ely David Bajurto', 'elyDB@gmail.com', 'elyDB@snailmail.com', NULL, NULL, NULL, NULL),
(003, 'Benjamin David Bajurto', 5, NULL, NULL, NULL, 'Benjamin David Bajurto', 'Plex-Art Inc', 'Sales', '8210 S Broadway CA'),
(004, 'Jose Ramon Rodriguez', 0, 'Jose Ramon Rodriguez', 'joseRR@gmail.com', 'joseRR@snailmail.com', 'Personio GmbH', 'Engineering', '10221 Altstadtring Munich, Germany'),
(005, 'David Eckerfield', 5, 'David Eckerfield', 'davidE@gmail.com', 'davidE@snailmail.com', 'U.S Marines', 'IT', '8210 Lincoln Road Miami, Florida'),
(009, 'Daniel Stier', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

insert into advisor(custID, contactType, contactName) values
(003, 'Phone', 'Johnny Bajurto'),
(004, 'Email', 'Brayan Funez'),
(005, 'Mail', 'Carlos Funez');

insert into phone(custID, phoneNumber, contactType) values
(003, '123-954-9533', 'Phone');

insert into email(custID, email, contactType) values
(004, joseRR@gmail.com, 'Email');

insert into mail(custID, mailingAddress, contactType) values
(005, '8210 Lincoln Road Miami, Florida', 'Mail');

insert into eatIn(orderNumber, tableNumber, tableSeat) values
(01, , ),
(09, , );

CREATE TABLE toGo(
orderNumber int not null,
orderReceivedTime TIMESTAMP(50),
orderPickUpTime TIMESTAMPv(50),
CONSTRAINT toGo_pk PRIMARY KEY (orderNumber), 
CONSTRAINT toGo_fk FOREIGN KEY (orderNumber) REFERENCES ItemsOrdered (orderNumber)
);
insert into toGo(orderNumber, orderReceivedTime, orderPickUpTime) values
(02, '2017-05-15 10:00:00', '2017-05-15 10:15:00'),
(03, '2017-12-18 12:45:00', '2017-12-18 13:00:00' ),
(04, '2018-05-20 15:30:00', '2018-05-20 15:45:00'),
(05, '2018-22-05 20:00:00', '2018-22-05 20:15:00');


insert into phoneOrder(orderNumber) values
(02)
(04);

insert into webOrder(orderNumber) values
(03)
(05);
