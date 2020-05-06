1)
SELECT customerName, corporationCustomerName, privateCustomerName
FROM customers
ORDER BY (Case
	when corporationCustomerName is NULL then customerName
	WHEN privateCustomerName is null then customerName
	
END);
--2)
SELECT customerName, sum(bill) as spending
FROM customers c
INNER JOIN knownOrder ko
on c.custID = ko.custID
INNER JOIN party p
ON ko.orderNumber = p.orderNumber
INNER JOIN order o
ON p.orderNumber = o.orderNumber

--7)
SELECT customerName, sum(bill) 
FROM customer c
INNER JOIN knownOrder ko
ON c.custID = ko.custID
INNER JOIN part p
ON ko.orderNumber = p.orderNumber
INNER JOIN order o
on ko.orderNumber = o.orderNumber
GROUP BY customerName
HAVING sum(bill) / 10
SELECT * FROM Customer_Value_v
8)
SELECT customerName, sum(bill) as total
FROM customers c
INNER JOIN knownOrder ko
ON c.custID = ko.custID
INNER JOIN part p
ON ko.orderNumber = p.orderNumber
INNER JOIN order o
on ko.orderNumber = o.orderNumber
GROUP BY customerName
ORDER BY total DESC

10)
SELECT customerName, sum(bill) as total
FROM customers c
INNER JOIN knownOrder ko
ON c.custID = ko.custID
INNER JOIN part p
ON ko.orderNumber = p.orderNumber
INNER JOIN order o
on ko.orderNumber = o.orderNumber
GROUP BY customerName
ORDER BY total 
LIMI 3

14)
SELECT customerName, corporationCustomerName
FROM customers
ORDER BY (Case
	when corporationCustomerName is NULL then customerName
	else corporationCustomerName 
END);


view)
--2
CREATE VIEW Customer_Addresses_v AS
(
SELECT customerName, Adress, Email,`Miming Money Spent`, CorporationName, OrganizationName FROM (
	SELECT COALESCE(privateCustomerName,corporationCustomerName) as customerName, COALESCE(snailMail,officeAddress) as Adress, COALESCE(email,'N/A') as Email, amountOfMimingsMoneySpent as `Miming Money Spent`, COALESCE(corporationName, "N/A") as CorporationName,  COALESCE(organizationName, "N/A") as OrganizationName 
    FROM customer) tmp
);
--4
CREATE VIEW Customer_Sales_v AS
(
SELECT customerName, sum(bill) 
FROM customers c
INNER JOIN knownOrder ko
ON c.custID = ko.custID
INNER JOIN part p
ON ko.orderNumber = p.orderNumber
INNER JOIN order o
on ko.orderNumber = o.orderNumber
GROUP BY customerName
SELECT * FROM Customer_Sales_v
);

--5
CREATE VIEW Customer_Value_v AS
(
SELECT customerName, sum(bill) 
FROM customer c
INNER JOIN knownOrder ko
ON c.custID = ko.custID
INNER JOIN part p
ON ko.orderNumber = p.orderNumber
INNER JOIN order o
on ko.orderNumber = o.orderNumber
GROUP BY customerName
SELECT * FROM Customer_Value_v
);