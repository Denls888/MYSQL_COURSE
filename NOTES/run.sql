/* -------------------------------------------------------------------------- */
/* export PATH=${PATH}:/usr/local/mysql/bin/                                  */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/* Mysql -u root -p                                                           */
/* -------------------------------------------------------------------------- */

--SELECT author_fname, author_lname FROM books;

--SELECT CONCAT('Hellow', 'world');

SELECT REVERSE('Denis Isaev');

SELECT 
   REPLACE(title, ' ', '->') AS 'title' 
FROM books;

SELECT 
   author_fname AS 'forwards',
   REVERSE(author_fname) AS 'backwards'
FROM books;

SELECT
   UPPER(concat(author_fname, ' ', author_lname))
   AS 'full name in caps'
FROM books;

SELECT 
   CONCAT(title, ' was relised in ', released_year)
   AS blurb
FROM books;

SELECT
   title,
   CHAR_LENGTH(title) AS 'char count'
FROM books;

SELECT
   CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
   CONCAT(author_lname, ', ', author_fname) AS 'author',
   CONCAT(stock_quantity, ' in stock') AS 'quantity'
FROM books LIMIT 2;

