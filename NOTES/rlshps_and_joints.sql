CREATE TABLE customers
(
    id INT AUTO_INCREMENT PRIMARY KEY, -- primary key
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) 
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id) -- foreigh key 
);



INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);


/* -------------------------------------------------------------------------- */
/* ONE TO MANY                                                                */
/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
/* CROSS JOIN                                                                 */
/* -------------------------------------------------------------------------- */

SELECT * FROM orders WHERE customer_id = (SELECT id from customers WHERE last_name = 'George' ); -- nevermind
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
+----+------------+--------+-------------+

SELECT * FROM customers, orders LIMIT 5; -- takes every customer and conjoins it with orders (usless shit)
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  5 | Bette      | Davis     | bette@aol.com    |  1 | 2016-02-10 |  99.99 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  1 | 2016-02-10 |  99.99 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  1 | 2016-02-10 |  99.99 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
+----+------------+-----------+------------------+----+------------+--------+-------------+


/* -------------------------------------------------------------------------- */
/* INNER JOIN | Selects all records from A and B where the join condition is met */  -- can also type INNER JOIN
/* -------------------------------------------------------------------------- */

-- IMPLICIT INNER JOIN

SELECT * FROM customers, orders WHERE customers.id = orders.customer_id; -- customers.id(refers to customers table(primary)) orders.customer_id(refers to orders(foreigh))
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+

SELECT first_name, last_name, order_date, amount FROM customers, orders WHERE customers.id = orders.customer_id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+

-- EXPLICIT INNER JOIN 

SELECT first_name, last_name, order_date, amount FROM customers JOIN orders ON customers.id = orders.customer_id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+

SELECT first_name, last_name, order_date, amount 
FROM customers 
JOIN orders ON customers.id = orders.customer_id
ORDER BY amount;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| George     | Michael   | 2015-01-03 |  12.50 |
| Boy        | George    | 2017-11-11 |  35.50 |
| Boy        | George    | 2016-02-10 |  99.99 |
| Bette      | Davis     | 1999-04-11 | 450.25 |
| George     | Michael   | 2014-12-12 | 800.67 |
+------------+-----------+------------+--------+

SELECT first_name,
       last_name,
       SUM(amount) AS total_spent
FROM customers 
JOIN orders 
ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC;
+------------+-----------+-------------+
| first_name | last_name | total_spent |
+------------+-----------+-------------+
| George     | Michael   |      813.17 |
| Bette      | Davis     |      450.25 |
| Boy        | George    |      135.49 |
+------------+-----------+-------------+

/* -------------------------------------------------------------------------- */
/* LEFT JOIN | Select everything from A, along with any matching records from B */
/* -------------------------------------------------------------------------- */

SELECT * 
FROM customers 
LEFT JOIN orders 
    ON customers.id = orders.customer_id;
+----+------------+-----------+------------------+------+------------+--------+-------------+
| id | first_name | last_name | email            | id   | order_date | amount | customer_id |
+----+------------+-----------+------------------+------+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |    2 | 2017-11-11 |  35.50 |           1 |
|  1 | Boy        | George    | george@gmail.com |    1 | 2016-02-10 |  99.99 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |    4 | 2015-01-03 |  12.50 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |    3 | 2014-12-12 | 800.67 |           2 |
|  3 | David      | Bowie     | david@gmail.com  | NULL | NULL       |   NULL |        NULL |
|  4 | Blue       | Steele    | blue@gmail.com   | NULL | NULL       |   NULL |        NULL |
|  5 | Bette      | Davis     | bette@aol.com    |    5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+------+------------+--------+-------------+

SELECT first_name,
       last_name,
       SUM(amount) 
FROM customers 
LEFT JOIN orders 
ON customers.id = orders.customer_id
GROUP BY customers.id;
+------------+-----------+-------------+
| first_name | last_name | SUM(amount) |
+------------+-----------+-------------+
| Boy        | George    |      135.49 |
| George     | Michael   |      813.17 |
| David      | Bowie     |        NULL |
| Blue       | Steele    |        NULL |
| Bette      | Davis     |      450.25 |
+------------+-----------+-------------+

SELECT first_name,
       last_name,
       IFNULL(SUM(amount), 0) AS total_spent
FROM customers 
LEFT JOIN orders 
ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;
+------------+-----------+-------------+
| first_name | last_name | total_spent |
+------------+-----------+-------------+
| David      | Bowie     |        0.00 |
| Blue       | Steele    |        0.00 |
| Boy        | George    |      135.49 |
| Bette      | Davis     |      450.25 |
| George     | Michael   |      813.17 |
+------------+-----------+-------------+


/* -------------------------------------------------------------------------- */
/* RIGHT JOIN | Select everything from B, along with any matching records in A */
/* -------------------------------------------------------------------------- */

SELECT * 
FROM customers 
RIGHT JOIN orders 
    ON customers.id = orders.customer_id;
+------+------------+-----------+------------------+----+------------+--------+-------------+
| id   | first_name | last_name | email            | id | order_date | amount | customer_id |
+------+------------+-----------+------------------+----+------------+--------+-------------+
|    1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|    1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|    2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|    2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|    5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+------+------------+-----------+------------------+----+------------+--------+-------------+

SELECT Concat (first_name, ' ', last_name) AS 'Name',
       IFNULL(Sum(amount), '0' )           AS "Total spent"
FROM   customers AS c
       RIGHT JOIN orders AS o
               ON c.id = o.customer_id
GROUP  BY NAME
ORDER  BY amount DESC; 
+----------------+-------------+
| Name           | Total spent |
+----------------+-------------+
| George Michael | 813.17      |
| Bette Davis    | 450.25      |
| Boy George     | 135.49      |
+----------------+-------------+

/* -------------------------------------------------------------------------- */
/* ON DELETE CASCADE                                                          */
/* -------------------------------------------------------------------------- */
-- DELETES ROWS FROM BOTH PARENT AND CHILD TABLES
-- WORKING WITH ON DELETE CASCADE

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
 
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) 
        REFERENCES customers(id)
        ON DELETE CASCADE         -- so we can delete table 'customers'
);
--#####################################################

-- first assignment 
SELECT first_name, title, grade
FROM students 
INNER JOIN papers
ON students.id = papers.student_id
ORDER BY grade DESC;

-- seconf assigment
SELECT first_name, title, grade
FROM students 
LEFT JOIN papers
ON students.id = papers.student_id
ORDER BY grade DESC;

-- third assignment
SELECT first_name, 
       IFNULL(title, 'MISSING'),
       IFNULL(grade, 0) 
FROM students 
LEFT JOIN papers
ON students.id = papers.student_id
ORDER BY grade DESC;

-- 4th assignment
SELECT first_name,
	   IFNULL(AVG(grade), 0) AS 'average'
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;

-- 5th assignment
SELECT
	first_name,
	IFNULL(AVG(grade), 0) AS 'average',
	CASE
		WHEN AVG(grade) >= '75' THEN 'PASSING'
		ELSE 'FAILING'
	END AS 'STATUS'
FROM
	students
LEFT JOIN papers ON
	students.id = papers.student_id
GROUP BY
	first_name
ORDER BY
	average DESC;


/* -------------------------------------------------------------------------- */
/* MANY TO MANY                                                               */
/* -------------------------------------------------------------------------- */






/* -------------------------------------------------------------------------- */
/* challenges                                                                 */
/* -------------------------------------------------------------------------- */


-- challenge 1
SELECT
	title,
	rating
FROM series
JOIN reviews 
	ON series.id = reviews.series_id 
LIMIT 10;


-- challenge 2
SELECT
	title,
	AVG(rating) AS 'avg_rating'
FROM series
JOIN reviews 
	ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating ASC;

title               |avg_rating|
--------------------|----------|
General Hospital    |   5.38000|
Bobs Burgers       |   7.52000|
Seinfeld            |   7.60000|
Bojack Horseman     |   7.94000|
Arrested Development|   8.08000|


-- challenge 3
SELECT first_name,
	   last_name,
	   rating
FROM reviewers  -- since it's inner join these can be changed places
JOIN reviews 
	ON reviewers.id = reviews.reviewer_id
LIMIT 5;

first_name|last_name|rating|
----------|---------|------|
Thomas    |Stoneman |   8.0|
Thomas    |Stoneman |   8.1|
Thomas    |Stoneman |   7.0|
Thomas    |Stoneman |   7.5|
Thomas    |Stoneman |   9.5|

-- challenge 4
SELECT title AS 'UNRATED'
from series
LEFT JOIN reviews
	ON series.id = reviews.series_id
WHERE rating IS NULL;
_____________________________
UNRATED              |
---------------------|
Malcolm In The Middle|
Pushing Daisies      |


-- challenge 5
SELECT genre,
	   ROUND(AVG(rating), 2) AS avg_rating
from series 
INNER JOIN reviews                       -- we do not want to work with not exist rating ;(
	ON series.id = reviews.series_id 
GROUP BY genre;

genre    |avg_rating|
---------|----------|
Animation|      7.86|
Comedy   |      8.16|
Drama    |      8.04|

-- challenge 6
SELECT first_name,
       last_name,
       COUNT(rating) AS 'COUNT',
       IFNULL(MIN(rating), 0) AS 'MIN',
       IFNULL(MAX(rating), 0) AS 'MAX',
       ROUND(IFNULL(AVG(rating), 0), 2) AS 'AVG',
CASE 
	WHEN COUNT(rating) >= 1 THEN 'ACTIVE'
	ELSE 'INACTIVE'							-- can also be done like -> IF(COUNT(rating) >= 1, 'ACTIVE', 'INACTIVE') AS STATUS
END AS 'STATUS'
FROM reviewers
LEFT JOIN reviews 
	ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

first_name|last_name|COUNT|MIN|MAX|AVG |STATUS  |
----------|---------|-----|---|---|----|--------|
Thomas    |Stoneman |    5|7.0|9.5|8.02|ACTIVE  |
Wyatt     |Skaggs   |    9|5.5|9.3|7.80|ACTIVE  |
Kimbra    |Masters  |    9|6.8|9.0|7.99|ACTIVE  |
Domingo   |Cortes   |   10|5.8|9.1|7.83|ACTIVE  |
Colt      |Steele   |   10|4.5|9.9|8.77|ACTIVE  |
Pinkie    |Petit    |    4|4.3|8.8|7.25|ACTIVE  |
Marlon    |Crafford |    0|0.0|0.0|0.00|INACTIVE|

-- challenge 7

SELECT
	title,
	rating,
	CONCAT(first_name, ' ', last_name) AS 'reviewer'
FROM reviewers
INNER JOIN reviews 
	ON reviewers.id = reviews.reviewer_id
INNER JOIN series
	ON series.id = reviews.series_id
ORDER BY title;

title               |rating|reviewer       |
--------------------|------|---------------|
Archer              |   8.0|Thomas Stoneman|
Archer              |   7.7|Domingo Cortes |
Archer              |   8.5|Kimbra Masters |
Archer              |   7.5|Wyatt Skaggs   |
Archer              |   8.9|Colt Steele    |
Arrested Development|   8.1|Thomas Stoneman|
Arrested Development|   6.0|Domingo Cortes |
Arrested Development|   8.0|Kimbra Masters |
Arrested Development|   8.4|Pinkie Petit   |
Arrested Development|   9.9|Colt Steele    |
Bob s Burgers       |   7.5|Pinkie Petit   |
Bob's Burgers       |   8.0|Colt Steele    |
Bob's Burgers       |   7.0|Thomas Stoneman|
Bob's Burgers       |   8.0|Domingo Cortes |
Bob's Burgers       |   7.1|Kimbra Masters |
Bojack Horseman     |   7.5|Thomas Stoneman|
Bojack Horseman     |   8.3|Domingo Cortes |
Bojack Horseman     |   7.8|Kimbra Masters |
Bojack Horseman     |   8.5|Colt Steele    |
Bojack Horseman     |   7.6|Wyatt Skaggs   |
Breaking Bad        |   9.5|Thomas Stoneman|
Breaking Bad        |   9.1|Domingo Cortes |
Breaking Bad        |   9.0|Kimbra Masters |
Breaking Bad        |   9.9|Colt Steele    |
Breaking Bad        |   9.3|Wyatt Skaggs   |
Curb Your Enthusiasm|   6.5|Wyatt Skaggs   |
Curb Your Enthusiasm|   8.4|Wyatt Skaggs   |
Curb Your Enthusiasm|   8.8|Domingo Cortes |
Curb Your Enthusiasm|   7.8|Kimbra Masters |
Curb Your Enthusiasm|   9.1|Colt Steele    |
Fargo               |   9.1|Wyatt Skaggs   |
Fargo               |   9.7|Colt Steele    |
Freaks and Geeks    |   9.3|Colt Steele    |
Freaks and Geeks    |   8.8|Pinkie Petit   |
Freaks and Geeks    |   8.5|Domingo Cortes |
Freaks and Geeks    |   7.8|Wyatt Skaggs   |
General Hospital    |   5.5|Wyatt Skaggs   |
General Hospital    |   4.5|Colt Steele    |
General Hospital    |   4.3|Pinkie Petit   |
General Hospital    |   6.8|Kimbra Masters |
General Hospital    |   5.8|Domingo Cortes |
Halt and Catch Fire |   9.9|Colt Steele    |
Seinfeld            |   7.2|Domingo Cortes |
Seinfeld            |   8.0|Kimbra Masters |
Stranger Things     |   8.9|Kimbra Masters |
Stranger Things     |   8.5|Wyatt Skaggs   |
Stranger Things     |   8.9|Domingo Cortes |










 

















