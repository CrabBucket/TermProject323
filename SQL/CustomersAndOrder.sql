CREATE TABLE orders(
orderNumber int not null,
customerPhone VARCHAR(15),
orderDate VARCHAR(15),
CONSTRAINT order_pk PRIMARY KEY(orderNumber)

);

CREATE TABLE paymentType(
cash double,
credit double,
mimingsMoney int,
payment VARCHAR(10),
CONSTRAINT paymanyType_pk PRIMARY KEY(payment)
);

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


