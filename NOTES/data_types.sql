/* -------------------------------------------------------------------------- */
/* STORING TEXT                                                               */
/* -------------------------------------------------------------------------- */

 CHAR -- is faster for fixed lenght text like -> Sex: M/F; Yes/No flags: Y/N etc

/* -------------------------------------------------------------------------- */
/* NUMBERS                                                                    */
/* -------------------------------------------------------------------------- */

INT(5) -- Whole numbers

DECIMAL(5,3) -- Where 5 is total number of digits before and after dec point
-- and 3 is number of digits after dec point -> have fixed-point type


/* FLOAT and DOUBLE -> have floating-point type will store larger number using less spcae */

FLOAT -- 4 bytes -- prssision issues ~7digits

DOUBLE -- 8 bytes -- prssision issues ~15digits


/* -------------------------------------------------------------------------- */
/* DATE, TIME AND DATETIME                                                    */
/* -------------------------------------------------------------------------- */

-- DATE  values with a date but no time 'YYYY-MM-DD' fromat
-- TIME values with a time but no date 'HH:MM:SS' fromat
-- DATETIME both values 'YYYY-MM-DD HH:MM:SS' SUPPORTS DATES FROM YEAR 1000 TO 9999

CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

+-----------+------------+-----------+---------------------+
| name      | birthdate  | birthtime | birthdt             |
+-----------+------------+-----------+---------------------+
| Padma     | 1983-11-11 | 10:07:35  | 1983-11-11 10:07:35 |
| Microwave | 2021-03-18 | 20:31:32  | 2021-03-18 20:31:32 |
+-----------+------------+-----------+---------------------+

CURDATE() -- gives current date
CURTIME() -- gives current time
NOW() -- gives current datetime

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES
('Microwave', CURRENT_DATE, CURRENT_TIME, NOW());

DATE_FORMAT -- look at documentation for ditails

SELECT Name, DATE_FORMAT(birthdt, '%m/%d/%y') FROM people;

+-----------+----------------------------------+
| Name      | DATE_FORMAT(birthdt, '%m/%d/%y') |
+-----------+----------------------------------+
| Padma     | 11/11/83                         |
| Microwave | 03/18/21                         |
+-----------+----------------------------------+

--### DATE MATH

DATEDIFF

DATE_ADD

DATE_SUB

+/-

SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people; -- difference now and date of birth

+-----------+------------+----------------------------+
| name      | birthdate  | DATEDIFF(NOW(), birthdate) |
+-----------+------------+----------------------------+
| Padma     | 1983-11-11 |                      13642 |
| Microwave | 2021-03-18 |                          0 |
+-----------+------------+----------------------------+

SELECT name birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people; -- adding

+-----------+---------------------------------------+
| birthdt   | DATE_ADD(birthdt, INTERVAL 3 QUARTER) |
+-----------+---------------------------------------+
| Padma     | 1984-08-11 10:07:35                   |
| Microwave | 2021-12-18 20:23:33                   |
+-----------+---------------------------------------+
 
SELECT name birthdt, birthdt + INTERVAL 1 MONTH FROM people;

SELECT name birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

--## TIMESTAMP - supports years from 1970 up to 2038

CREATE TABLE comments
(
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW() -- creates timestamp with current date and time 
);

INSERT INTO comments(content)
VALUES
('Hello World');

+-----------------+---------------------+
| content         | created_at          |
+-----------------+---------------------+
| Zdarova banditi | 2021-03-18 20:27:37 |
| Hola Pendejos   | 2021-03-18 20:27:19 |
| Hello World     | 2021-03-18 20:27:02 |
+-----------------+---------------------+

SELECT * FROM comments ORDER BY created_at DESC;
--=====================================================
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP -- can also be NOW()
);
 
INSERT INTO comments2 (content) VALUES('dasdasdasd');
 
INSERT INTO comments2 (content) VALUES('lololololo');
 
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');

+----------------------+---------------------+
| content              | changed_at          |
+----------------------+---------------------+
| dasdasdasd           | 2021-03-18 20:29:12 |
| lololololo           | 2021-03-18 20:29:12 |
| I LIKE CATS AND DOGS | 2021-03-18 20:29:13 |
+----------------------+---------------------+
 
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
 
SELECT * FROM comments2 ORDER BY changed_at DESC;
 
+-----------------------+---------------------+
| content               | changed_at          |
+-----------------------+---------------------+
| THIS IS NOT GIBBERISH | 2021-03-18 20:30:00 |
| I LIKE CATS AND DOGS  | 2021-03-18 20:29:13 |
| lololololo            | 2021-03-18 20:29:12 |
+-----------------------+---------------------+

--###############################################################################

DAY()
DAYNAME()
DAYOFWEEK()
DAYOFYEAR()

SELECT name, birthdt, DAY(birthdt) FROM people;
+-----------+---------------------+--------------+
| name      | birthdt             | DAY(birthdt) |
+-----------+---------------------+--------------+
| Padma     | 1983-11-11 10:07:35 |           11 |
| Microwave | 2021-03-18 20:31:32 |           18 |
+-----------+---------------------+--------------+

SELECT name, birthdt, DAYNAME(birthdt) FROM people;
+-----------+---------------------+------------------+
| name      | birthdt             | DAYNAME(birthdt) |
+-----------+---------------------+------------------+
| Padma     | 1983-11-11 10:07:35 | Friday           |
| Microwave | 2021-03-18 20:31:32 | Thursday         |
+-----------+---------------------+------------------+

SELECT name, birthdt, DAYOFWEEK(birthdt) FROM people;
+-----------+---------------------+--------------------+
| name      | birthdt             | DAYOFWEEK(birthdt) |
+-----------+---------------------+--------------------+
| Padma     | 1983-11-11 10:07:35 |                  6 |
| Microwave | 2021-03-18 20:31:32 |                  5 |
+-----------+---------------------+--------------------+

SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;
+-----------+---------------------+--------------------+
| name      | birthdt             | DAYOFYEAR(birthdt) |
+-----------+---------------------+--------------------+
| Padma     | 1983-11-11 10:07:35 |                315 |
| Microwave | 2021-03-18 20:31:32 |                 77 |
+-----------+---------------------+--------------------+


/* -------------------------------------------------------------------------- */
/* EXERCISES                                                                  */
/* -------------------------------------------------------------------------- */

-- what is a good use case for CHAR?

Values that will not exceed # of characters defined like Yes or No, or something that has fixed value leight
--################################################################

CREATE TABLE inventory
(
    item_name VARCHAR,
    price DECIMAL(8,2) NOT NULL, -- price is always less than 1.000.000 --> 999.999.99
    quantity INT
);

--################################################################

-- what is the difference between DATETIME and TIMESTAMP?

range of years supported -- TIMESTAMP - supports years from 1970 up to 2038

--################################################################

SELECT CURRENT_TIME();

+----------------+
| CURRENT_TIME() |
+----------------+
| 20:49:17       |
+----------------+

--################################################################

SELECT CURRENT_DATE;

+--------------+
| CURRENT_DATE |
+--------------+
| 2021-03-18   |
+--------------+

--################################################################

SELECT DAYOFWEEK(CURRENT_DATE);

+-------------------------+
| DAYOFWEEK(CURRENT_DATE) |
+-------------------------+
|                       5 |
+-------------------------+

--################################################################

SELECT DAYNAME(NOW());

+-----------------------+
| DAYNAME(CURRENT_DATE) |
+-----------------------+
| Thursday              |
+-----------------------+

--################################################################

SELECT DATE_FORMAT(CURRENT_DATE, '%m/%d/%Y');

+---------------------------------------+
| DATE_FORMAT(CURRENT_DATE, '%m/%d/%Y') |
+---------------------------------------+
| 03/18/2021                            |
+---------------------------------------+

--################################################################

SELECT DATE_FORMAT (NOW(), '%M %D at %I:%S');

+---------------------------------------+
| DATE_FORMAT (NOW(), '%M %D at %I:%S') |  
+---------------------------------------+
| March 18th at 09:16                   |
+---------------------------------------+

--################################################################

CREATE TABLE tweets
(
    Tw_cont VARCHAR(150),
    Usr_Nm VARCHAR(50),
    Time_cr TIMESTAMP DEFAULT NOW()
);