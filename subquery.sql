CREATE TABLE paintings
(
id int,
name varchar,
artist_id int,
listed_price int

);

ALTER TABLE paintings ALTER COLUMN name varchar(50); 
-- unable to insert values with normal varchar

select * from paintings;

INSERT INTO paintings VALUES (11,'Miracle',1,300),
(12,'Sunshine',1,700),
(13,'Woman',2,2800),
(14,'Man',2,2300),
(15,'Barbie',3,250),
(16,'Cool Painting',3,5000),
(17,'Black Square',3,50),
(18,'Mountains',4,1300);


CREATE TABLE artists
(
id int,
first_name varchar(100),
last_name varchar(100),
);

INSERT INTO artists VALUES
(1,'Thomas', 'Black'),
(2,'Kate', 'Smith'),
(3,'Natali', 'Wein'),
(4,'Francesco', 'Benelli');

CREATE TABLE collectors
(
id int,
first_name varchar(100),
last_name varchar(100),
);

INSERT INTO collectors VALUES
(101,'Brandon','Cooper'),
(102,'Laura','Fisher'),
(103,'Christina','Buffet'),
(104,'Steve','Stevenson');

CREATE TABLE sales_1
(
id int,
dt date,
painting_id int,
artist_id int,
collector_id int,
sale_price int
);

INSERT INTO sales_1 VALUES
(1001, '2021-11-01',13,2,104,2500),
(1002, '2021-11-10',14,2,105,2300),
(1003, '2021-11-10',11,1,102,300),
(1004, '2021-11-15',16,3,103,4000),
(1005, '2021-11-22',15,3,103,200),
(1006, '2021-11-22',17,3,103,50);


----- list paintings that are priced higher than the average

SELECT avg(listed_price) from paintings 

-- now write the subquery

SELECT name, listed_price
FROM paintings
WHERE listed_price > (
	SELECT AVG(listed_price) FROM paintings
);

--- Our subquery is in the WHERE clause,
--- where it filters the result set based on the listed price.
---- This subquery returns a single value: the average price per painting for our gallery.
---- Each listed price is compated to this value, and the only paintings that are price
--- above average make it to the final output.

----- list all collectors who purchased paintings from our gallery

SELECT collectors.id, collectors.first_name, collectors.last_name 
FROM collectors
WHERE collectors.id IN (
	SELECT collector_id FROM sales_1
);


--- total amount of sales for each artist who has sold at least one painting in our gallery.

SELECT
artists.first_name,
artists.last_name,
artist_sales.sales
FROM artists
JOIN (
	SELECT artist_id, SUM(sale_price) AS sales
	FROM sales_1
	GROUP BY artist_id
) AS artist_sales
ON artists.id = artist_sales.artist_id;

---- the first names and the last names of the artists who had zero sales with our gallery

SELECT first_name, last_name
FROM artists
WHERE NOT EXISTS (
	SELECT * FROM sales_1
	WHERE sales_1.artist_id = artists.id
);

