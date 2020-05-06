
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
SELECT 
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




