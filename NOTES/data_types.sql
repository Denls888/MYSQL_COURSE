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
/* DATE TIME AND DATETIME                                                     */
/* -------------------------------------------------------------------------- */

-- DATE  values with a date but no time 'YYYY-MM-DD' fromat
-- TIME values with a time but no date 'HH:MM:SS' fromat
-- DATETIME both values 'YYYY-MM-DD HH:MM:SS' SUPPORTS DATES FROM YEAR 1000 TO 9999

CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

CURDATE() -- gives current date
CURTIME() -- gives current time
NOW() -- gives current datetime

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES
('Microwave', CURRENT_DATE, CURRENT_TIME, NOW());

DATE_FORMAT -- look at documentation for ditails

SELECT Name, DATE_FORMAT(birthdt, '%m/%d/%y') FROM people;

--### DATE MATH

DATEDIFF

DATE_ADD

DATE_SUB

+/-

SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;
 
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;

SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

--## TIMESTAMP - supports years from 1970 up to 2038

CREATE TABLE comments
(
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO comments(content)
VALUES
('Hello World');

SELECT * FROM comments ORDER BY created_at DESC;
--=====================================================
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP -- can also be NOW()
);
 
INSERT INTO comments2 (content) VALUES('dasdasdasd');
 
INSERT INTO comments2 (content) VALUES('lololololo');
 
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
 
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
 
SELECT * FROM comments2 ORDER BY changed_at;
 
--###############################################################################

DAY()
DAYNAME()
DAYOFWEEK()
DAYOFYEAR()

SELECT name, birthdt, DAY(birthdt) FROM people;

SELECT name, birthdt, DAYNAME(birthdt) FROM people;

SELECT name, birthdt, DAYOFWEEK(birthdt) FROM people;

SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;








