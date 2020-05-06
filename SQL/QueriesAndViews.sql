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

#--1







CREATE OR REPLACE VIEW AllFoodItemsOnMenus AS
    SELECT 
        *
    FROM
        Menu
            NATURAL JOIN
        MenuType
            NATURAL JOIN
        MenuPrice
            NATURAL JOIN
        MenuOfferings
            NATURAL JOIN
        MenuListing
            NATURAL JOIN
        MenuDeals
            NATURAL JOIN
        FoodItem;

CREATE OR REPLACE VIEW MenuPrices AS
    SELECT 
        DisplayName,
        SpiceLevel,
        MenuType,
        ROUND(MenuRate * Price, 2) AS Price,
        FoodItemID
    FROM
        AllFoodItemsOnMenus;
        
CREATE OR REPLACE VIEW LunchPrice AS
    SELECT 
        MenuPrices.FoodItemID, Price AS LunchPrice
    FROM
        MenuPrices
    WHERE
        MenuType = 'Lunch';
        
CREATE OR REPLACE VIEW EveningPrice AS
    SELECT 
        MenuPrices.FoodItemID, Price AS EveningPrice
    FROM
        MenuPrices
    WHERE
        MenuType = 'Evening';

CREATE OR REPLACE VIEW ChildrenPrice AS
    SELECT 
        MenuPrices.FoodItemID, Price AS ChildrenPrice
    FROM
        MenuPrices
    WHERE
        MenuType = 'Childrens';
CREATE OR REPLACE VIEW TheBuffetPrice AS
    SELECT 
        MenuPrices.FoodItemID, 0 AS BuffetPrice
    FROM
        MenuPrices
    WHERE
        MenuType = 'Sunday Brunch Buffet';


CREATE OR REPLACE VIEW MenuItem_v  as
SELECT DISTINCT
    DisplayName,
    SpiceLevel,
    COALESCE(LunchPrice, 'N/A') AS LunchPrice,
    COALESCE(EveningPrice, 'N/A') AS EveningPrice,
    COALESCE(ChildrenPrice, 'N/A') AS ChildrensPrice,
    COALESCE(BuffetPrice, 'N/A') AS BuffetPrice
FROM
    (FoodItem
    LEFT JOIN LunchPrice USING (FoodItemID)
    LEFT JOIN EveningPrice USING (FoodItemID)
    LEFT JOIN ChildrenPrice USING (FoodItemID)
    LEFT JOIN TheBuffetPrice USING (FoodItemID));
    
SELECT * FROM MenuItem_v;








#--2
CREATE OR REPLACE VIEW CST_Preprocess AS (
	SELECT customerName, Address, Email,`Miming Money Spent`, CorporationName, OrganizationName FROM (
	SELECT COALESCE(privateCustomerName,corporationCustomerName) as customerName, COALESCE(snailMail,officeAddress) as Address, COALESCE(email,'N/A') as Email, amountOfMimingsMoneySpent as `Miming Money Spent`, COALESCE(corporationName, "N/A") as CorporationName,  COALESCE(organizationName, "N/A") as OrganizationName 
    FROM customer) tmp
);

CREATE OR REPLACE VIEW Customer_Addresses_v AS
	SELECT * FROM CST_Preprocess WHERE customerName IS NOT NULL;

SELECT * FROM Customer_Addresses_v;



#--4
CREATE OR REPLACE VIEW AllMenuItemsOnMenus AS
    SELECT 
        MenuName, SUM(Price)*MenuRate*(1-DiscountRate) as ListPrice, MenuType,MenuListingID, MenuID
    FROM
        Menu
            NATURAL JOIN
        MenuType
            NATURAL JOIN
        MenuPrice
            NATURAL JOIN
        MenuOfferings
            NATURAL JOIN
        MenuListing
            NATURAL JOIN
        MenuDeals
            NATURAL JOIN
        FoodItem
        GROUP BY MenuName,MenuType;


SELECT * FROM AllMenuItemsOnMenus;



CREATE OR REPLACE VIEW SuperCustData as
SELECT orderNumber, custID, customerName, amountOfMimingsMoneySpent, privateCustomerName, email, snailMail, corporationCustomerName, corporationName, organizationName, officeAddress, payment, customerPhone, orderDate, MenuName, ListPrice, MenuType, tmp.MenuListingID, menu.MenuID
	FROM (SELECT * FROM customer NATURAL JOIN knownOrder NATURAL JOIN party NATURAL JOIN orders RIGHT JOIN ItemsOrdered USING (orderNumber)) tmp LEFT JOIN AllMenuItemsOnMenus menu ON tmp.MenuListingID  = menu.MenuListingID AND tmp.MenuID = menu.MenuID;













#--5
CREATE OR REPLACE VIEW  Customer_Value_v as
SELECT CustomerName, SUM(ListPrice) as TotalMoneySpentInTheLastYear FROM SuperCustData WHERE datediff(orderDate,NOW()) <= 365
Group By CustomerName
ORDER BY TotalMoneySpentInTheLastYear DESC;


SELECT * FROM Customer_Value_v;