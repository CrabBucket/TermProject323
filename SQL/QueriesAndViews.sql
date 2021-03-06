#1 QUERIES
SELECT customerName, corporationCustomerName, privateCustomerName
FROM customers
ORDER BY (Case
	when corporationCustomerName is NULL then customerName
	WHEN privateCustomerName is null then customerName
	
END);
#2
SELECT CustomerName, SUM(ListPrice) as TotalMoneySpentInTheLastTwoYear FROM SuperCustData WHERE datediff(orderDate,NOW()) <= 365*2
Group By CustomerName
ORDER BY TotalMoneySpentInTheLastTwoYear DESC
LIMIT 3;
Daniel Jiron	116.175500
Ely David Bajurto	108.870000
Max Del Rio	99.088000


#5)

SELECT MenuName, COUNT(MenuListingID) as count FROM
(SELECT * FROM ItemsOrdered WHERE MenuID = 1) tmp NATURAL JOIN MenuListing GROUP BY MenuName ORDER BY count DESC
LIMIT 3;
Orange Chicken	2
Spicy Udon	2
Salad	2



#10)
SELECT * FROM Customer_Value_v
LIMIT 3;
Daniel Jiron	116.18
Ely David Bajurto	108.87
Max Del Rio	99.09

#11) Just a note here you say Menu Item in the Query But my menu items are part of the ComboMenu so it's why You will see things that look like food (single FoodItem menu listing and also stuf like Dinner combos)
SELECT MenuName, SUM(ListPrice) as TotalMoneyEarnedInTheLastTwoYear FROM SuperCustData WHERE datediff(orderDate,NOW()) <= 365
Group By MenuName
ORDER BY TotalMoneyEarnedInTheLastTwoYear DESC
LIMIT 5;
Big Jim's Eat Everything Combo	68.425000
Steak	34.182000
Porkchop	28.782000
Porkchop Dinner Combo	23.976000
Orange Chicken Dinner Combo	23.774500


#13)
SELECT DisplayName, COUNT(FoodItemID) as TotalChefsCanCook FROM CookingCapability NATURAL JOIN FoodItem
GROUP BY FoodItemID
ORDER BY TotalChefsCanCook ASC
LIMIT 3;
Steak	1
Pork Ramen	1
Spicy Udon	1




#14)
SELECT customerName, corporationCustomerName
FROM customers
ORDER BY (Case
	when corporationCustomerName is NULL then customerName
	else corporationCustomerName 
END);

#--1 VIEWS

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

Egg Drop	Tangy	10.99	13.19	8.79	N/A
Spicy Udon	Hot	8.99	10.79	7.19	N/A
Pork Ramen	Mild	10.99	13.19	8.79	N/A
Chicken Noodle	Mild	4.99	5.99	3.99	N/A
Wonton Soup	Mild	6.99	8.39	5.59	N/A
Egg Roll	Tangy	3.99	4.79	3.19	N/A
Fried Rice	Hot	4.99	5.99	3.99	N/A
Tempura	Mild	3.99	4.79	3.19	N/A
Salad	Mild	1.99	2.39	1.59	N/A
Spicy Salad	Hot	2.99	3.59	2.39	N/A
Orange Chicken	Tangy	12.99	15.59	10.39	N/A
Porkchop	Hot	15.99	19.19	12.79	N/A
Steak	Mild	18.99	22.79	15.19	N/A
Kung Pao Chicken	Oh My God	14.99	17.99	11.99	N/A
Broccoli Beef	Mild	12.99	15.59	10.39	N/A







#--2
CREATE OR REPLACE VIEW CST_Preprocess AS (
	SELECT customerName, Address, Email,`Miming Money Spent`, CorporationName, OrganizationName FROM (
	SELECT COALESCE(privateCustomerName,corporationCustomerName) as customerName, COALESCE(snailMail,officeAddress) as Address, COALESCE(email,'N/A') as Email, amountOfMimingsMoneySpent as `Miming Money Spent`, COALESCE(corporationName, "N/A") as CorporationName,  COALESCE(organizationName, "N/A") as OrganizationName 
    FROM customer) tmp
);

CREATE OR REPLACE VIEW Customer_Addresses_v AS
	SELECT * FROM CST_Preprocess WHERE customerName IS NOT NULL;

SELECT * FROM Customer_Addresses_v;

Ely David Bajurto	elyDB@snailmail.com	elyDB@gmail.com	0	N/A	N/A
Benjamin David Bajurto	8210 S Broadway CA	N/A	0	Plex-Art Inc	Sales
Max Del Rio	8210 S Broadway CA	N/A	0	Plex-Art Inc	Fabrication
Kevin Funez	18210 Studebaker CA	N/A	0	Dip Shipping	Sales
Johnny David	18210 Studebaker CA	N/A	0	Dip Shipping	Engineering
Luiz Rodriguez	luisR@snailmail.com	luisR@gmail.com	0	N/A	N/A
Ely David Bajurto	elyDB@snailmail.com	elyDB@gmail.com	15	N/A	N/A
Benjamin David Bajurto	8210 S Broadway CA	N/A	13	Plex-Art Inc	Sales





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


#SELECT * FROM AllMenuItemsOnMenus;



CREATE OR REPLACE VIEW SuperCustData as
SELECT orderNumber, custID, customerName, amountOfMimingsMoneySpent, privateCustomerName, email, snailMail, corporationCustomerName, corporationName, organizationName, officeAddress, payment, customerPhone, orderDate, MenuName, ListPrice, MenuType, tmp.MenuListingID, menu.MenuID
	FROM (SELECT * FROM customer NATURAL JOIN knownOrder NATURAL JOIN party NATURAL JOIN orders RIGHT JOIN ItemsOrdered USING (orderNumber)) tmp LEFT JOIN AllMenuItemsOnMenus menu ON tmp.MenuListingID  = menu.MenuListingID AND tmp.MenuID = menu.MenuID;



CREATE OR REPLACE VIEW  Customer_Sales_v as
SELECT CustomerName, SUM(ListPrice), YEAR(orderDate) as Year FROM SuperCustData WHERE CustomerName IS NOT NULL
Group By CustomerName, Year;


SELECT * FROM  Customer_Sales_v;

Daniel Jiron	116.175500	2019
Ely David Bajurto	108.870000	2019
Max Del Rio	99.088000	2019








#--5
CREATE OR REPLACE VIEW  Customer_Value_v as
SELECT CustomerName, ROUND(SUM(ListPrice),2) as TotalMoneySpentInTheLastYear FROM SuperCustData WHERE datediff(orderDate,NOW()) <= 365
Group By CustomerName
ORDER BY TotalMoneySpentInTheLastYear DESC;


SELECT * FROM Customer_Value_v;

Daniel Jiron	116.18
Ely David Bajurto	108.87
Max Del Rio	99.09