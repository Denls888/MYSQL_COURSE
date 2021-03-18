

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

+---------+
| counted |
+---------+
|      12 |
+---------+

SELECT title FROM books WHERE title like '%the%';

+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| The Namesake                              |
| A Hologram for the King: A Novel          |
| The Circle                                |
| The Amazing Adventures of Kavalier & Clay |
| Consider the Lobster                      |
| Lincoln In The Bardo                      |
+-------------------------------------------+

SELECT count(*) FROM books WHERE title like '%the%';

+----------+
| count(*) |
+----------+
|        6 |
+----------+



/* -------------------------------------------------------------------------- */
/* GROUP BY --- SUMMORIZES OR AGGREGATES IDENTICAL DATA INTO SINGLE ROW       */
/* -------------------------------------------------------------------------- */


SELECT author_lname, 
       COUNT(*)
FROM books
GROUP BY author_lname;

+----------------+----------+
| author_lname   | COUNT(*) |
+----------------+----------+
| Lahiri         |        2 |
| Gaiman         |        3 |
| Eggers         |        3 |


SELECT author_fname, 
       author_lname, 
       COUNT(*)
FROM books
GROUP BY author_lname, 
         author_fname;

+--------------+----------------+----------+
| author_fname | author_lname   | COUNT(*) |
+--------------+----------------+----------+
| Jhumpa       | Lahiri         |        2 |
| Neil         | Gaiman         |        3 |
| Dave         | Eggers         |        3 |


SELECT CONCAT(
       'In ', released_year, ' ', COUNT(*), ' book(s) released') AS year
FROM books
GROUP BY released_year; 

+----------------------------+
| year                       |
+----------------------------+
| In 2003 2 book(s) released |
| In 2016 1 book(s) released |
| In 2001 3 book(s) released |
| In 1996 1 book(s) released |
| In 2012 1 book(s) released |
+----------------------------+

/* -------------------------------------------------------------------------- */
/* MIN AND MAX ---                                                            */
/* -------------------------------------------------------------------------- */


SELECT MIN(released_year) FROM books;

+--------------------+
| MIN(released_year) |
+--------------------+
|               1945 |
+--------------------+

SELECT MAX(released_year) FROM books;

+--------------------+
| MAX(released_year) |
+--------------------+
|               2017 |
+--------------------+

SELECT *                   ---
FROM books
WHERE pages =
(
    SELECT MIN(pages)
    FROM books
);

+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+

SELECT *
FROM books
ORDER BY pages ASC
LIMIT 1;

+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+

/* -------------------------------------------------------------------------- */
/* MIN AND MAX WITH GROUP BY                                                  */
/* -------------------------------------------------------------------------- */


SELECT author_fname, 
       author_lname, 
       MIN(released_year)
FROM books
GROUP BY author_lname, author_fname; --- 

+--------------+----------------+--------------------+
| author_fname | author_lname   | MIN(released_year) |
+--------------+----------------+--------------------+
| Jhumpa       | Lahiri         |               1996 |
| Neil         | Gaiman         |               2001 |
| Dave         | Eggers         |               2001 |
| Michael      | Chabon         |               2000 |
| Patti        | Smith          |               2010 |
| Raymond      | Carver         |               1981 |
| Don          | DeLillo        |               1985 |
| John         | Steinbeck      |               1945 |
| David        | Foster Wallace |               2004 |
| Dan          | Harris         |               2014 |
| Freida       | Harris         |               2001 |
| George       | Saunders       |               2017 |
+--------------+----------------+--------------------+

-- finf the longest 'page' author

SELECT 
author_fname, author_lname, MAX(pages)
FROM books
GROUP BY author_lname, author_fname
LIMIT 5;

+--------------+--------------+------------+
| author_fname | author_lname | MAX(pages) |
+--------------+--------------+------------+
| Jhumpa       | Lahiri       |        291 |
| Neil         | Gaiman       |        465 |
| Dave         | Eggers       |        504 |
| Michael      | Chabon       |        634 |
| Patti        | Smith        |        304 |
+--------------+--------------+------------+

SELECT
    CONCAT(author_fname, ' ', author_lname) AS author,
    MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname
LIMIT 5,10;

+----------------------+--------------+
| author               | longest book |
+----------------------+--------------+
| Raymond Carver       |          526 |
| Don DeLillo          |          320 |
| John Steinbeck       |          181 |
| David Foster Wallace |          343 |
| Dan Harris           |          256 |
| Freida Harris        |          428 |
| George Saunders      |          367 |
+----------------------+--------------+


/* -------------------------------------------------------------------------- */
/* SUM -- Adds Things together!                                               */
/* -------------------------------------------------------------------------- */

SELECT SUM(pages) FROM books;

+------------+
| SUM(pages) |
+------------+
|       6623 |
+------------+

-- sum + group by

SELECT author_fname, author_lname, SUM(pages) 
FROM books
GROUP BY author_lname, 
         author_fname 
LIMIT 5;

+--------------+--------------+------------+
| author_fname | author_lname | SUM(pages) |
+--------------+--------------+------------+
| Jhumpa       | Lahiri       |        489 |
| Neil         | Gaiman       |        977 |
| Dave         | Eggers       |       1293 |
| Michael      | Chabon       |        634 |
| Patti        | Smith        |        304 |
+--------------+--------------+------------+


/* -------------------------------------------------------------------------- */
/* AVG                                                                        */
/* -------------------------------------------------------------------------- */

SELECT AVG(pages) FROM books;

+------------+
| AVG(pages) |
+------------+
|   348.5789 |
+------------+


SELECT AVG(stock_quantity)
FROM books
GROUP BY released_year;

+---------------------+
| AVG(stock_quantity) |
+---------------------+
|             66.0000 |
|             43.0000 |
|            134.3333 |
|             97.0000 |
|            154.0000 |
|             26.0000 |
|             68.0000 |


SELECT released_year, AVG(stock_quantity)
FROM books
GROUP BY released_year
LIMIT 5;

+---------------+---------------------+
| released_year | AVG(stock_quantity) |
+---------------+---------------------+
|          2003 |             66.0000 |
|          2016 |             43.0000 |
|          2001 |            134.3333 |
|          1996 |             97.0000 |
|          2012 |            154.0000 |
+---------------+---------------------+

SELECT author_fname, author_lname, AVG(pages)
FROM books
GROUP BY author_lname, author_fname
LIMIT 5;

+--------------+--------------+------------+
| author_fname | author_lname | AVG(pages) |
+--------------+--------------+------------+
| Jhumpa       | Lahiri       |   244.5000 |
| Neil         | Gaiman       |   325.6667 |
| Dave         | Eggers       |   431.0000 |
| Michael      | Chabon       |   634.0000 |
| Patti        | Smith        |   304.0000 |
+--------------+--------------+------------+


/* -------------------------------------------------------------------------- */
/* CHALLENGES                                                                 */
/* -------------------------------------------------------------------------- */

SELECT COUNT(title) FROM books;

+--------------+
| COUNT(title) |
+--------------+
|           19 |
+--------------+


SELECT released_year, 
count(released_year) AS 'book quantity'
FROM books
GROUP BY released_year;

+---------------+---------------+
| released_year | book quantity |
+---------------+---------------+
|          2003 |             2 |
|          2016 |             1 |
|          2001 |             3 |
|          1996 |             1 |
|          2012 |             1 |
|          2013 |             1 |
|          2000 |             1 |
|          2010 |             1 |
|          1981 |             1 |
|          1989 |             1 |
|          1985 |             1 |
|          1945 |             1 |
|          2004 |             1 |
|          2005 |             1 |
|          2014 |             1 |
|          2017 |             1 |
+---------------+---------------+

SELECT SUM(stock_quantity)
AS Total
FROM books;

+-------+
| Total |
+-------+
|  2450 |
+-------+

SELECT author_fname, 
       author_lname,
       AVG(released_year)
FROM books
GROUP BY author_lname, author_fname;

+--------------+----------------+--------------------+
| author_fname | author_lname   | AVG(released_year) |
+--------------+----------------+--------------------+
| Jhumpa       | Lahiri         |          1999.5000 |
| Neil         | Gaiman         |          2006.6667 |
| Dave         | Eggers         |          2008.6667 |
| Michael      | Chabon         |          2000.0000 |
| Patti        | Smith          |          2010.0000 |
| Raymond      | Carver         |          1985.0000 |
| Don          | DeLillo        |          1985.0000 |
| John         | Steinbeck      |          1945.0000 |
| David        | Foster Wallace |          2004.5000 |
| Dan          | Harris         |          2014.0000 |
| Freida       | Harris         |          2001.0000 |
| George       | Saunders       |          2017.0000 |
+--------------+----------------+--------------------+

SELECT CONCAT(author_fname, ' ', author_lname) AS 'Full Name',
       pages
FROM books
WHERE pages=(SELECT MAX(pages) FROM books);

+----------------+-------+
| Full Name      | pages |
+----------------+-------+
| Michael Chabon |   634 |
+----------------+-------+


SELECT released_year AS 'Year',
       count(released_year) AS '# books', --- can also be count(*) AS '# books'
       AVG(pages) AS 'Avg pages'
FROM books
GROUP BY released_year;

+------+---------+-----------+
| Year | # books | Avg pages |
+------+---------+-----------+
| 2003 |       2 |  249.5000 |
| 2016 |       1 |  304.0000 |
| 2001 |       3 |  443.3333 |
| 1996 |       1 |  198.0000 |
| 2012 |       1 |  352.0000 |
| 2013 |       1 |  504.0000 |
| 2000 |       1 |  634.0000 |
| 2010 |       1 |  304.0000 |
| 1981 |       1 |  176.0000 |
| 1989 |       1 |  526.0000 |
| 1985 |       1 |  320.0000 |
| 1945 |       1 |  181.0000 |
| 2004 |       1 |  329.0000 |
| 2005 |       1 |  343.0000 |
| 2014 |       1 |  256.0000 |
| 2017 |       1 |  367.0000 |
+------+---------+-----------+