CREATE TABLE orders(
bill VARCHAR(50) PRIMARY KEY,
customerPhone VARCHAR(15),
orderNumber VARCHAR(50),
orderDate VARCHAR(50),
CONSTRAINT order_pk PRIMARY KEY(orderNumber),
CONSTRAINT order_fk1 FOREIGN KEY (orderNumber) REFERENCES ItemsOrdered (orderNumber)
);

CREATE TABLE paymentType(
cash VARCHAR(10),
credit VARCHAR(10),
mimingsMoney VARCHAR(10),
payment VARCHAR(10),
CONSTRAINT paymanyType_pk PRIMARY KEY(payment)
);

CREATE TABLE party(
payment VARCHAR(50),
orderNumber VARCHAR(50),
CONSTRAINT party_pk PRIMARY KEY (orderNumber),
CONSTRAINT party_fk1 FOREIGN KEY(payment) REFERENCES paymentType (payment),
CONSTRAINT party_fk1 FOREIGN KEY (orderNumber) REFERENCES ItemsOrdered (orderNumber)
);

CREATE TABLE knownOrder(
custID int not null,
orderNumber VARCHAR(50),
customerName VARCHAR(50),
CONSTRAINT knownOrder_pk PRIMARY KEY(custID),
CONSTRAINT knownOrder_fk FOREIGN KEY (orderNumber) REFERENCES ItemsOrdered (orderNumber)
);

CREATE TABLE anonymousOrder(
orderNumber VARCHAR(50),
CONSTRAINT anonymousOrder_pk PRIMARY KEY(orderNumber),
CONSTRAINT anonymousOrder_fk FOREIGN KEY (orderNumber) REFERENCES ItemsOrdered (orderNumber)
);

CREATE TABLE customer(
custID int not null,
customerName VARCHAR(50),
amountOfMimingsMoneySpent int,
privateCustomerName VARCHAR(50),
email VARCHAR(50),
snailMail VARCHAR(50),
corporationCustomerName VARCHAR(50),
corporationName VARCHAR(50),
organizationName VARCHAR(50),
officeAddress VARCHAR(50),
CONSTRAINT customer_pk PRIMARY KEY(custID),
CONSTRAINT customer_fk FOREIGN KEY (custID) REFERENCES knownOrder (custID)
);

CREATE TABLE advisor(
custID int not null,
contactType VARCHAR(50),
contactName VARCHAR(50),
constraint advisor_pk PRIMARY KEY(custID, contactType),
CONSTRAINT advisor_fk FOREIGN KEY (custID) REFERENCES knownOrder (custID)
);

CREATE TABLE phone(
phoneNumber VARCHAR(50),
custID int not null,
contactType VARCHAR(50),
CONSTRAINT phone_pk PRIMARY KEY(custID, contactType),
constraint phone_fk1 FOREIGN KEY (custID) REFERENCES advisor (custID),
constraint phone_fk2 FOREIGN KEY (contactType) REFERENCES advisor (contactType)
);

CREATE TABLE email(
email VARCHAR(50),
custID int not null,
contactType VARCHAR(50),
CONSTRAINT phone_pk PRIMARY KEY(custID, contactType),
constraint phone_fk1 FOREIGN KEY (custID) REFERENCES knownOrder (custID),
constraint phone_fk2 FOREIGN KEY (contactType) REFERENCES advisor (contactType)
);

CREATE TABLE mail(
mailingAddress VARCHAR(50),
custID int not null,
contactType VARCHAR(50),
CONSTRAINT phone_pk PRIMARY KEY(custID, contactType),
constraint phone_fk1 FOREIGN KEY (custID) REFERENCES knownOrder (custID),
constraint phone_fk2 FOREIGN KEY (contactType) REFERENCES advisor (contactType)
);

CREATE TABLE eatIn(
tableNumber int,
tableSeat int,
orederNumber VARCHAR(50),
CONSTRAINT eatIn_pk PRIMARY KEY (orderNumber), 
CONSTRAINT eatIn-fk FOREIGN KEY (orderNumber) REFERENCES ItemsOrdered (orderNumber)
);

CREATE TABLE toGo(
orderRecievedTime VARCHAR(50),
orderPickUpTime VARCHAR(50),
orederNumber VARCHAR(50),
CONSTRAINT toGo_pk PRIMARY KEY (orderNumber), 
CONSTRAINT toGo_fk FOREIGN KEY (orderNumber) REFERENCES ItemsOrdered (orderNumber)
);

CREATE TABLE phoneOrder(
orderNumber VARCHAR(50),
CONSTRAINT phoneOrder_pk PRIMARY KEY (orderNumber),
CONSTRAINT phoneOrder_fk FOREIGN KEY (orderNumber) REFERENCES ItemsOrdered (orderNumber)
);

CREATE TABLE webOrder(
orderNumber VARCHAR(50),
CONSTRAINT phoneOrder_pk PRIMARY KEY (orderNumber),
CONSTRAINT phoneOrder_fk FOREIGN KEY (orderNumber) REFERENCES ItemsOrdered (orderNumber)
);