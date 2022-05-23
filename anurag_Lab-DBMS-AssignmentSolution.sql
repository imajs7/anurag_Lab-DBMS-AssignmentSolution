/**
*	Graded Lab 4: DBMS
*/

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

/* CREATE SUPPLIER TABLE */
CREATE TABLE IF NOT EXISTS supplier(
	supp_id INT PRIMARY KEY,
    supp_name VARCHAR(50) NOT NULL,
    supp_city VARCHAR(50) NOT NULL,
    supp_phone VARCHAR(50) NOT NULL
);

/* CREATE CUSTOMER TABLE */
CREATE TABLE IF NOT EXISTS customer(
	cus_id INT PRIMARY KEY,
    cus_name VARCHAR(20) NOT NULL,
    cus_phone VARCHAR(10) NOT NULL,
    cus_city VARCHAR(30) NOT NULL,
    cus_gender CHAR
);

/* CREATE CATEGORY TABLE */
CREATE TABLE IF NOT EXISTS category(
	cat_id INT PRIMARY KEY,
	cat_name VARCHAR(20) NOT NULL
);

/* CREATE PRODUCT TABLE */
CREATE TABLE IF NOT EXISTS product(
	pro_id INT PRIMARY KEY,
	pro_name VARCHAR(20) NOT NULL DEFAULT 'Dummy',
	pro_desc VARCHAR(60),
	cat_id INT,
    FOREIGN KEY (cat_id) REFERENCES category(cat_id)
);

/* CREATE SUPPLIER PRICING TABLE */
CREATE TABLE IF NOT EXISTS supplier_pricing(
	pricing_id INT PRIMARY KEY,
	pro_id INT,
	supp_id INT,
	supp_price INT DEFAULT 0,
	FOREIGN KEY (pro_id) REFERENCES category(cat_id),
    FOREIGN KEY (supp_id) REFERENCES supplier(supp_id)
);

/* CREATE ORDER TABLE */
CREATE TABLE IF NOT EXISTS `order`(
	ord_id INT PRIMARY KEY,
	ord_amount INT NOT NULL,
	ord_date DATE NOT NULL,
	cus_id INT,
	pricing_id INT,
	FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    FOREIGN KEY (pricing_id) REFERENCES supplier_pricing(pricing_id)
);

/* CREATE RATING TABLE */
CREATE TABLE IF NOT EXISTS rating(
	rat_id INT PRIMARY KEY,
	ord_id INT,
	rat_ratstars INT NOT NULL,
	FOREIGN KEY (ord_id) REFERENCES `order`(ord_id)
);

/* INSERT RECORDS INTO SUPPLIER TABLE */
INSERT INTO
	supplier(supp_id, supp_name, supp_city, supp_phone)
VALUES
	(1, 'Rajesh Retails', 'Delhi', 1234567890),
    (2, 'Appario Ltd.', 'Mumbai', 2589631470),
    (3, 'Knome products', 'Bangalore', 9785462315),
    (4, 'Bansal Retails', 'Kochi', 8975463285),
    (5, 'Mittal Ltd.', 'Lucknow', 7898456532);
    
/* INSERT RECORDS INTO CUSTOMER TABLE */
INSERT INTO
	customer(cus_id, cus_name, cus_phone, cus_city, cus_gender)
VALUES
	(1, 'AAKASH', 9999999999, 'DELHI', 'M'),
    (2, 'AMAN', 9785463215, 'NOIDA', 'M'),
	(3, 'NEHA', 9999999999, 'MUMBAI', 'F'),
	(4, 'MEGHA', 9994562399, 'KOLKATA', 'F'),
	(5, 'PULKIT', 7895999999, 'LUCKNOW', 'M');

/* INSERT RECORDS INTO CATEGORY TABLE */
INSERT INTO
	category(cat_id, cat_name)
VALUES
	(1, 'BOOKS'),
	(2, 'GAMES'),
    (3, 'GROCERIES'),
    (4, 'ELECTRONICS'),
    (5, 'CLOTHES');

/* INSERT RECORDS INTO PRODUCT TABLE */
INSERT INTO
	product(pro_id, pro_name, pro_desc, cat_id)
VALUES
	(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
	(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
	(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
    (4, 'OATS', 'Highly Nutritious from Nestle', 3),
    (5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
	(6, 'MILK', '1L Toned MIlk', 3),
    (7, 'Boat Earphones', '1.5 Meter long Dolby Atmos', 4),
    (8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
    (9, 'Project IGI', 'compatible with windows 7 and above', 2),
	(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
    (11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
    (12, 'Train Your Brain', 'By Shireen Stephen', 1);

/* INSERT RECORDS INTO SUPPLIER PRICING TABLE */
INSERT INTO
	supplier_pricing(pricing_id, pro_id, supp_id, supp_price)
VALUES
	(1, 1, 2, 1500),
    (2, 3, 5, 30000),
	(3, 5, 1, 3000),
	(4, 2, 3, 2500),
	(5, 4, 1, 1000);

/* INSERT RECORDS INTO ORDER TABLE */
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO
	`order`(ord_id, ord_amount, ord_date, cus_id, pricing_id)
VALUES
	(101, 1500, '2021-10-06', 2, 1),
    (102, 1000, '2021-10-12', 3, 5),
    (103, 30000, '2021-09-16', 5, 2),
    (104, 1500, '2021-10-05', 1, 1),
    (105, 3000, '2021-08-16', 4, 3),
	(106, 1450, '2021-08-18', 1, 9),
    (107, 789, '2021-09-01', 3, 7),
    (108, 780, '2021-09-07', 5, 6),
    (109, 3000, '2021-00-10', 5, 3),
    (110, 2500, '2021-09-10', 2, 4),
    (111, 1000, '2021-09-15', 4, 5),
    (112, 789, '2021-09-16', 4, 7),
    (113, 31000, '2021-09-16', 1, 8),
    (114, 1000, '2021-09-16', 3, 5),
    (115, 3000, '2021-09-16', 5, 3),
    (116, 99, '2021-09-17', 2, 14);
    
SET FOREIGN_KEY_CHECKS = 1;

/* INSERT RECORDS INTO RATING TABLE */
INSERT INTO
	rating(rat_id, ord_id, rat_ratstars)
VALUES
	(1, 101, 4),
    (2, 102, 3),
	(3, 103, 1),
	(4, 104, 2),
	(5, 105, 4),
	(6, 106, 3),
	(7, 107, 4),
	(8, 108, 4),
	(9, 109, 3),
	(10, 110, 5),
	(11, 111, 3),
	(12, 112, 4),
    (13, 113, 2),
    (14, 114, 1),
    (15, 115, 1),
	(16, 116, 0);

/* 	
	Question 3 : 
	Display the total number of customers based on gender who have placed 
    order of worth at least Rs.3000.
*/

SELECT 
	cus_gender AS Gender, COUNT(*) AS Count
FROM
	(SELECT 
		O.cus_id, sum(O.ord_amount) AS Total, C.cus_gender
	FROM
		`order` O, customer C
	WHERE
		O.cus_id = C.cus_id
	GROUP BY
		cus_id
	HAVING
		Total >= 3000) Q
GROUP BY
	Gender;
    
/* 	
	Question 4 : 
	Display all the order along with product name ordered by a customer 
    having Customer_Id=2
*/

SELECT 
	ord_id AS 'Order ID', pro_name AS 'Product Name', 
    ord_date AS 'Order Date', ord_amount AS 'Order Amount' 
FROM 
	supplier_pricing AS t1
RIGHT JOIN
	(SELECT * FROM `order` WHERE cus_id = 2) AS t2
ON
	t1.pricing_id = t2.pricing_id
LEFT JOIN
	(SELECT pro_id, pro_name FROM product) AS t3
ON
	t3.pro_id = t1.pro_id;
        
/* 	
	Question 5 : 
	Display the Supplier details who can supply more than one product.
*/

SELECT
	S.supp_id AS 'Supplier ID', S.supp_name AS 'Supplier Name', 
    S.supp_city AS City, S.supp_phone AS 'Phone Number'
FROM
	supplier AS S
INNER JOIN
	(
		SELECT supp_id, count(*) AS Count FROM supplier_pricing
		GROUP BY supp_id
		HAVING Count > 1
    ) AS Q
ON
	S.supp_id = Q.supp_id;

    
/* 	
	Question 6 : 
	Find the least expensive product from each category and print the 
    table with category id, name, product name and price of the product
*/

SELECT
	P.pro_id AS 'Product ID', P.pro_name AS 'Product Name', P.cat_id AS 'Cat ID', 
    C.cat_name AS 'Category', CONCAT('₹', min(SP.supp_price)) AS 'Min Price'
FROM
	supplier_pricing SP, product P, category C
WHERE
	SP.pro_id = P.pro_id AND P.cat_id = C.cat_id
GROUP BY
	C.cat_id
ORDER BY
	P.pro_id;

/*
	Question 7 :
    Display the Id and Name of the Product ordered after “2021-10-05”.
*/

SELECT
	pro.pro_id AS 'Product ID', pro.pro_name AS 'Product Name'
FROM
	product pro, supplier_pricing sp
WHERE
	pro.pro_id = sp.pro_id AND
    sp.pricing_id IN ( SELECT pricing_id FROM `order` WHERE ord_date > '2021-10-05' );

/*
	Question 8 :
    Display customer name and gender whose names start or end with character 'A'.
*/

SELECT
	cus_name AS 'Customer Name', cus_gender AS Gender
FROM
	customer
WHERE
	cus_name LIKE 'A%' OR cus_name LIKE '%A';


/*
	Question 9 :
    Create a stored procedure to display supplier id, name, rating and 
    Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,
    If rating >4 print “Good Service”, If rating >2 print “Average Service” else 
    print “Poor Service”.
*/

SELECT
	*,
CASE
    WHEN Rating = 5 THEN 'Excellent Service'
    WHEN Rating >= 4 AND Rating < 5 THEN 'Good Service'
    WHEN Rating >= 2 AND Rating < 4 THEN 'Average Service'
    ELSE 'Poor Service'
END AS 'Type of Service'
FROM
	(SELECT
		SP.supp_id AS 'Supplier ID', S.supp_name AS 'Supplier Name', 
        ROUND(SUM(R.rat_ratstars) / COUNT(*), 2) AS Rating
	FROM
		supplier_pricing AS SP
	INNER JOIN
		( SELECT * FROM supplier ) AS S ON SP.supp_id = S.supp_id
	INNER JOIN
		( SELECT * FROM `order` ) AS O ON SP.pricing_id = O.pricing_id
	INNER JOIN
		( SELECT * FROM rating ) AS R ON O.ord_id = R.ord_id
	GROUP BY
		SP.supp_id) AS final_table;
