

/* -------------------------------------------------------------------------- */
/* COUNT func                                                                 */
/* -------------------------------------------------------------------------- */


SELECT COUNT(*) FROM books;

+----------+
| COUNT(*) |
+----------+
|       19 |
+----------+

SELECT COUNT(DISTINCT author_fname) FROM books;

+------------------------------+
| COUNT(DISTINCT author_fname) |
+------------------------------+
|                           12 |
+------------------------------+

SELECT COUNT(DISTINCT author_lname, author_fname) AS counted FROM books; 

SELECT title FROM books WHERE title like '%the%';

SELECT count(*) FROM books WHERE title like '%the%';
--##############################################################################


/* -------------------------------------------------------------------------- */
/* GROUP BY --- SUMMORIZES OR AGGREGATES IDENTICAL DATA INTO SINGLE ROW       */
/* -------------------------------------------------------------------------- */


SELECT author_lname, 
       COUNT(*)
FROM books
GROUP BY author_lname;



SELECT author_fname, 
       author_lname, 
       COUNT(*)
FROM books
GROUP BY author_lname, 
         author_fname;



SELECT CONCAT(
       'In ', released_year, ' ', COUNT(*), ' book(s) released') AS year
FROM books
GROUP BY released_year; 


/* -------------------------------------------------------------------------- */
/* MIN AND MAX ---                                                            */
/* -------------------------------------------------------------------------- */


SELECT MIN(released_year) FROM books;

SELECT MAX(released_year) FROM books;

SELECT *
FROM books
WHERE pages =
(
    SELECT MIN(pages)
    FROM books
);


SELECT *
FROM books
ORDER BY pages ASC
LIMIT 1;


/* -------------------------------------------------------------------------- */
/* MIN AND MAX WITH GROUP BY                                                  */
/* -------------------------------------------------------------------------- */


SELECT author_fname, 
       author_lname, 
       MIN(released_year)
FROM books
GROUP BY author_lname, author_fname;