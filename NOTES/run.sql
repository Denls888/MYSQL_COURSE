/* -------------------------------------------------------------------------- */
/* export PATH=${PATH}:/usr/local/mysql/bin/                                  */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/* Mysql -u root -p                                                           */
/* -------------------------------------------------------------------------- */

--SELECT author_fname, author_lname FROM books;

--SELECT CONCAT('Hellow', 'world');

SELECT
   CONCAT(author_fname, ' ', author_lname)
FROM books;

SELECT author_fname AS first, author_lname AS last,
CONCAT (author_fname, ' ', author_lname) AS full
FROM books;


