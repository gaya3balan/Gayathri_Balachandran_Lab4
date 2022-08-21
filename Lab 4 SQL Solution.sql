
--  QUESTION1:  You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the E-commerce with the schema definition given below.


Create Database if not exists `order-directory` ;
use `order-directory`;

--                   CREATING 7 TABLES MENTIONED: supplier, customer, category, product, supplier_pricing, `order`, rating

CREATE TABLE IF NOT EXISTS supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer(
CUS_ID INT NOT NULL,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER CHAR,
PRIMARY KEY (CUS_ID));

CREATE TABLE IF NOT EXISTS category (
CAT_ID INT NOT NULL,
CAT_NAME VARCHAR(20) NOT NULL,
PRIMARY KEY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS product (
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT NOT NULL,
PRIMARY KEY (PRO_ID),
FOREIGN KEY (CAT_ID) REFERENCES CATEGORY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS supplier_pricing (
PRICING_ID INT NOT NULL,
PRO_ID INT NOT NULL,
SUPP_ID INT NOT NULL,
SUPP_PRICE INT DEFAULT 0,
PRIMARY KEY (PRICING_ID),
FOREIGN KEY (PRO_ID) REFERENCES PRODUCT (PRO_ID),
FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID)
);

CREATE TABLE IF NOT EXISTS `order` (
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE,
CUS_ID INT NOT NULL,
PRICING_ID INT NOT NULL,
PRIMARY KEY (ORD_ID),
FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID)
);

CREATE TABLE IF NOT EXISTS rating (
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);

use `order-directory`;
show tables;
desc supplier;
desc customer;
desc category;
desc product;
desc supplier_pricing;
desc `order`;
desc rating;

-- ----------------------------------------------------------------------------------------------------------------------------------

-- QUESTION 2: Insert the following data in the table created above

-- INSERTING INTO 7 TABLES MENTIONED: supplier, customer, category, product, supplier_pricing, `order`, rating

INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);
-- -----------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------
-- QUESTION 3: Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

select count(table2.cus_gender) as 'Number of customers', table2.cus_gender from 
(select table1.cus_id, table1.cus_gender, table1.ord_amount, table1.cus_name from 
(select `order`.*, customer.cus_gender, customer.cus_name from `order` inner join 
customer on `order`.cus_id=customer.cus_id having `order`.ord_amount >= 3000)
as table1 group by table1.cus_id) as table2 group by cus_gender order by cus_gender; 

-- other ways to write this:

select  count(*) as 'total number of customers' , CUS_GENDER AS gender from customer
where CUS_ID in (select distinct(CUS_ID) from `order` 
where ORD_AMOUNT >=3000)
group by CUS_GENDER
order by CUS_GENDER;

-- other ways to write this:

select COUNT(*) as 'total number of customers' , CUS_GENDER AS gender
	from (select distinct(CUS_ID) from `order` 
where ORD_AMOUNT >=3000 ) as Table1 
		inner join
		customer
		on customer.CUS_ID= Table1.CUS_ID
	group by customer.cus_gender
    order by CUS_GENDER;
    ;
    
    -- other ways to write this:
    
    SELECT count(DISTINCT customer.CUS_ID) AS 'Number of customers' , customer.CUS_GENDER as 'gender' FROM customer
INNER JOIN 
`order` ON `order`.CUS_ID = customer.CUS_ID
WHERE `order`.ORD_AMOUNT >= 3000
GROUP BY customer.CUS_GENDER;

-- ------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------

-- QUESTION 4:  Display all the orders along with product name ordered by a customer having Customer_Id=2

-- Solution without inner joins

select  ORD.ORD_ID AS ORDER_ID , ORD.ORD_AMOUNT AS ORDER_AMOUNT , ORD.ORD_DATE AS ORDER_DATE , ORD.CUS_ID AS CUSTOMER_ID, ORD.PRICING_ID ,
PR.PRO_NAME AS PRODUCT_NAME
from `order` ORD, SUPPLIER_PRICING SP, product PR
where  ORD.CUS_ID = 2
and ORD.PRICING_ID = SP.PRICING_ID
and SP.PRO_ID = PR.PRO_ID;

-- Solution with inner joins

select  ORD.ORD_ID AS ORDER_ID , ORD.ORD_AMOUNT AS ORDER_AMOUNT , ORD.ORD_DATE AS ORDER_DATE , ORD.PRICING_ID ,
 PR.PRO_NAME AS PRODUCT_NAME, ORD.CUS_ID AS CUSTOMER_ID
from SUPPLIER_PRICING SP INNER JOIN product PR
ON SP.PRO_ID = PR.PRO_ID INNER JOIN 
`order` ORD ON ORD.PRICING_ID = SP.PRICING_ID
where  ORD.CUS_ID = 2;

-- other ways to do this

select `order`.*, product.pro_name
from `order`, supplier_pricing, product
where `order`.cus_id=2
and `order`.PRICING_ID = supplier_pricing.PRICING_ID
and supplier_pricing.PRO_ID = product.pro_id;

-- OTHER WAYS TO DO THIS SELECTING ALL COLUMNS FROM `order` AND PRODUCT NAME FROM product :

SELECT  product.PRO_NAME, `order`.*
   FROM `order`
INNER JOIN 
   supplier_pricing  ON supplier_pricing.PRICING_ID = `order`.PRICING_ID
INNER JOIN
product as product ON product.PRO_ID = supplier_pricing.PRO_ID
WHERE `order`.CUS_ID = 2;

-- ---------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------

-- QUESTION 5: Display the Supplier details who can supply more than one product.

select * from supplier where 
SUPP_ID in (select SUPP_ID from supplier_pricing group by SUPP_ID having count(SUPP_ID) > 1);

-- alternate way to write this: 

SELECT supplier.*
FROM supplier, supplier_pricing 
WHERE supplier.supp_id = supplier_pricing.supp_id 
GROUP BY supplier_pricing.supp_id 
HAVING COUNT(supplier_pricing.supp_id ) > 1;

-- other ways to do this:

SELECT supplier.* FROM supplier_pricing
INNER JOIN 
supplier ON supplier.SUPP_ID = supplier_pricing.SUPP_ID
GROUP BY supplier_pricing.SUPP_ID 
HAVING count(DISTINCT PRO_ID) > 1;

-- -------------------------------------------------------------------------------------------------------------------------

-- QUESTION 6: Find the least expensive product from each category and print the table with category id,
-- name and price of the product
-- NOTE FOR EVALUATOR: AS PER LAB SESSION, SRIDHAR KOKKULA HAS REQUESTED TO REMOVE PRODUCT NAME AS ITS AMBIGUOUS. HENCE REMOVING PRODUCT NAME
-- THIS IS AS PER INSTRUCTIONS, KINDLY DO NOT REDUCE MARKS FOR THE SAME. WE HAVE CORRECTED QUESTION AS ABOVE.  
-- HAVE EXPLICITLY REMOVED PRODUCT NAME AS PER SRIDHAR KOKKULA IN LAB SESSION 4 ON 08/21/22

-- Solution using Inner joins 

 select cat.CAT_ID as 'category Id' , cat.CAT_NAME as 'category name',  LEAST_CATEGORY_PRICE.LEAST_PRICE as ' Least price' from
(select  min(SUPP_PRICE) as LEAST_PRICE , PR.CAT_ID, PR.PRO_ID from supplier_pricing SP INNER JOIN product PR ON
SP.PRO_ID= PR.PRO_ID GROUP BY PR.CAT_ID) as LEAST_CATEGORY_PRICE 
INNER JOIN product PR ON PR.PRO_ID = LEAST_CATEGORY_PRICE.PRO_ID
 INNER JOIN category cat ON 
cat.CAT_ID = PR.CAT_ID;

-- other ways to write query 
select cat.CAT_ID AS 'category Id' , cat.CAT_NAME as 'category name',  LEAST_CATEGORY_PRICE.LEAST_PRICE as 'Least price' from
(select  min(SUPP_PRICE) as LEAST_PRICE , PR.CAT_ID, PR.PRO_ID from supplier_pricing SP INNER JOIN product PR ON
SP.PRO_ID= PR.PRO_ID GROUP BY PR.CAT_ID) as LEAST_CATEGORY_PRICE , product PR , category cat
where PR.PRO_ID = LEAST_CATEGORY_PRICE.PRO_ID
 AND cat.CAT_ID = PR.CAT_ID;
 
 -- More other ways to write query
 select cat.CAT_ID AS 'category Id' , cat.CAT_NAME as ' category name',  MIN(SP.SUPP_PRICE) AS 'Least Price'
	from supplier_pricing SP 
		INNER JOIN  product PR on SP.PRO_ID = PR.PRO_ID
		INNER JOIN category CAT on PR.CAT_ID = CAT.CAT_ID
        GROUP BY  PR.CAT_ID
	    HAVING  MIN(SP.SUPP_PRICE) ORDER BY PR.CAT_ID;
        
-- More other ways to write query
     select category.*, min(supplier_pricing.supp_price) from supplier_pricing 
     join product on product.pro_id = supplier_pricing.pro_id
     join category on category.cat_id=product.cat_id 
     group by product.cat_id order by product.cat_id ;
     
-- -----------------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------------
-- QUESTION 7: Display the Id and Name of the Product ordered after “2021-10-05”.

-- Solution without inner joins

select pr.PRO_ID as 'Id' , pr.PRO_NAME as 'Name of the Product' from product pr , supplier_pricing sp, `order` ord 
where pr.PRO_ID = sp.PRO_ID
and sp.PRICING_ID = ord.PRICING_ID
and ord.ORD_DATE > '2021-10-05';

-- Solution with inner joins
select pr.PRO_ID as 'Id' , pr.PRO_NAME as 'Name of the Product' from product pr  
INNER JOIN  supplier_pricing sp
ON  pr.PRO_ID = sp.PRO_ID
 INNER JOIN `order` ord
ON sp.PRICING_ID = ord.PRICING_ID
and ord.ORD_DATE > '2021-10-05';

-- ------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------
-- QUESTION 8: Display customer name and gender whose names start or end with character 'A'

select CUS_NAME AS 'customer name ', CUS_GENDER as 'gender' from customer where CUS_NAME LIKE ( 'A%' ) OR 
CUS_NAME LIKE ( '%A' );

-- OTHER WAYS TO WRITE THIS 
SELECT CUS_NAME as CustomerName, CUS_GENDER as Gender 
FROM customer
WHERE ( CUS_NAME LIKE '%A' OR CUS_NAME LIKE 'A%') ;

-- --------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------------------
-- QUESTION 9: Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
-- For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”,
--  If rating >2 print “Average Service” else print “Poor Service”.


-- Solution 1: Creating stored procedure without inner joins. Here since each supplier has multiple products and pro_ids, pricing_ids and ord_ids 
-- associated, so taking average to find out the rating. 

USE `order-directory`;
DROP procedure IF EXISTS `supplier_ratings`;

USE `order-directory`;
DROP procedure IF EXISTS `order-directory`.`supplier_ratings`;
;

DELIMITER $$
USE `order-directory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `supplier_ratings`()
BEGIN
select sup.SUPP_ID as 'supplier id' , sup.SUPP_NAME as 'name' , ROUND(avg(rat_ratstars),2) as 'rating',
case 
    when avg(rat_ratstars) = 5 then 'Excellent Service'
	when avg(rat_ratstars) > 4 then 'Good Service'
	when avg(rat_ratstars) > 2 then 'Average Service'
else 'Poor Service'
end as Type_of_Service
from supplier sup, `order` ord, supplier_pricing sp, rating rat
where ord.ORD_ID = rat.ORD_ID and sup.SUPP_ID = sp.SUPP_ID
and sp.PRICING_ID = ord.PRICING_ID
GROUP BY sup.SUPP_ID ORDER BY sup.SUPP_ID;
END$$

DELIMITER ;

call supplier_ratings();

-- OTHER WAYS TO DO THIS, PLEASE CHECL BELOW SOLUTIONS AS WELL : 

DELIMITER //
CREATE PROCEDURE checkSuppRatings()
BEGIN 
	SELECT supplier.SUPP_ID, supplier.SUPP_NAME, avg( RAT_RATSTARS ) as rate, 
CASE 
WHEN avg(rat_ratstars ) = 5 THEN 'Excellent'
when avg(rat_ratstars) > 4 then 'Good Service'
when avg(rat_ratstars) > 2 then 'Average Service'
else 'Poor Service'
END as typeOfService
FROM supplier 
INNER JOIN 
supplier_pricing ON supplier_pricing.SUPP_ID = supplier.SUPP_ID
INNER JOIN 
`order` ON `order`.PRICING_ID = supplier_pricing.PRICING_ID
INNER JOIN 
rating ON rating.ORD_ID = `order`.ORD_ID
 GROUP BY supplier.SUPP_ID
 ORDER BY SUPP_ID;
END //

call checkSuppRatings();
-- -----------------------------------
-- Solution 2: Creating stored procedure with  inner joins . Here since each supplier has multiple products and pro_ids, pricing_ids and ord_ids 
-- associated, so taking average to find out the rating. 

USE `order-directory`;
DROP procedure IF EXISTS `supplier_ratings_display`;

USE `order-directory`;
DROP procedure IF EXISTS `order-directory`.`supplier_ratings_display`;
;

DELIMITER $$
USE `order-directory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `supplier_ratings_display`()
BEGIN
select sup.SUPP_ID as 'supplier id' , sup.SUPP_NAME as 'name' , ROUND(avg(rat_ratstars),2) as 'rating',
case when avg(rat_ratstars) = 5 then 'Excellent Service'
	when avg(rat_ratstars) > 4 then 'Good Service'
	when avg(rat_ratstars) > 2 then 'Average Service'
else 'Poor Service'
end as Type_of_Service
from supplier sup INNER JOIN  supplier_pricing sp
ON sup.SUPP_ID = sp.SUPP_ID INNER JOIN `order` ord
ON sp.PRICING_ID = ord.PRICING_ID INNER JOIN rating rat
ON ord.ORD_ID = rat.ORD_ID
group by sup.SUPP_ID order by sup.SUPP_ID;

END$$

DELIMITER ;
;

call supplier_ratings_display();


