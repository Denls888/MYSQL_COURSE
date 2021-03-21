/* -------------------------------------------------------------------------- */
/* LOGIC OPERATORS                                                            */
/* -------------------------------------------------------------------------- */

-- NOT EQUAL !=

SELECT title, released_year FROM books WHERE released_year != 2017 LIMIT 5;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| The Namesake                     |          2003 |
| Norse Mythology                  |          2016 |
| American Gods                    |          2001 |
| Interpreter of Maladies          |          1996 |
| A Hologram for the King: A Novel |          2012 |
+----------------------------------+---------------+

SELECT title , author_lname FROM books WHERE author_lname != 'Harris';

-- NOT LIKE 

SELECT title FROM books WHERE title NOT LIKE 'The Namesake' LIMIT 3;
+-------------------------+
| title                   |
+-------------------------+
| Norse Mythology         |
| American Gods           |
| Interpreter of Maladies |
+-------------------------+

SELECT title FROM books WHERE title NOT LIKE 'A%' LIMIT 3;
+-------------------------+
| title                   |
+-------------------------+
| The Namesake            |
| Norse Mythology         |
| Interpreter of Maladies |
+-------------------------+

-- GREATER THAN >

SELECT * FROM books WHERE released_year >  2000 LIMIT 3;
+---------+-----------------+--------------+--------------+---------------+----------------+-------+
| book_id | title           | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-----------------+--------------+--------------+---------------+----------------+-------+
|       1 | The Namesake    | Jhumpa       | Lahiri       |          2003 |             32 |   291 |
|       2 | Norse Mythology | Neil         | Gaiman       |          2016 |             43 |   304 |
|       3 | American Gods   | Neil         | Gaiman       |          2001 |             12 |   465 |
+---------+-----------------+--------------+--------------+---------------+----------------+-------+

-- GREATER THAN or EQAL TO >=

SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100 limit 3;
+-------------------------------------------+----------------+
| title                                     | stock_quantity |
+-------------------------------------------+----------------+
| A Hologram for the King: A Novel          |            154 |
| A Heartbreaking Work of Staggering Genius |            104 |
| Coraline                                  |            100 |
+-------------------------------------------+----------------+

-- BOOLIAN LIKE -- IN THIS CASE IT REPRESENTS TRUE AND FALSE

SELECT 99 > 1; -- true
+--------+
| 99 > 1 |
+--------+
|      1 |
+--------+

SELECT 99 > 199; -- false
+----------+
| 99 > 199 |
+----------+
|        0 |
+----------+

100 > 5 -- true
-15 > 15 -- false
9 > -10 -- true
1 > 1 -- false
'a' > 'b' -- for sql its false
'A' > 'a' -- for sql its false

-- LESS THAN <

SELECT * FROM books WHERE released_year < 2000 LIMIT 5;
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri       |          1996 |             97 |   198 |
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
|      12 | Where I m Calling From: Selected Stories            | Raymond      | Carver       |          1989 |             12 |   526 |
|      13 | White Noise                                         | Don          | DeLillo      |          1985 |             49 |   320 |
|      14 | Cannery Row                                         | John         | Steinbeck    |          1945 |             95 |   181 |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+

3 < -10 -- false
-10 < -9 -- true
42 <= 42 -- true
'h' < 'p' -- true WHY?
'Q' <= 'q' -- true


--  LOGICAL AND &&

SELECT * FROM books WHERE author_lname = 'Eggers' AND released_year >= 2010; -- AND or &&(in newer MySQL && has been removed) ! ONLY WORKS IF BOTH ARE TRUE
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                            | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
|       5 | A Hologram for the King: A Novel | Dave         | Eggers       |          2012 |            154 |   352 |
|       6 | The Circle                       | Dave         | Eggers       |          2013 |             26 |   504 |
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+

SELECT * FROM books where author_lname='Eggers' && released_year >2010 AND title LIKE '%novel%'; -- NOT LIMITED 
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                            | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
|       5 | A Hologram for the King: A Novel | Dave         | Eggers       |          2012 |            154 |   352 |
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+


/* -------------------------------------------------------------------------- */
/* LOGICAL OR ||                                                              */
/* -------------------------------------------------------------------------- */

SELECT * FROM books WHERE author_lname = 'Eggers' || released_year > 2010;
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       2 | Norse Mythology                           | Neil         | Gaiman       |          2016 |             43 |   304 |
|       5 | A Hologram for the King: A Novel          | Dave         | Eggers       |          2012 |            154 |   352 |
|       6 | The Circle                                | Dave         | Eggers       |          2013 |             26 |   504 |
|       9 | A Heartbreaking Work of Staggering Genius | Dave         | Eggers       |          2001 |            104 |   437 |
|      17 | 10% Happier                               | Dan          | Harris       |          2014 |             29 |   256 |
|      19 | Lincoln In The Bardo                      | George       | Saunders     |          2017 |           1000 |   367 |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+


/* -------------------------------------------------------------------------- */
/* BETWEEN  | NOT BETWEEN                                                            */
/* -------------------------------------------------------------------------- */


SELECT * FROM books WHERE released_year >= 2004 && released_year <= 2015; -- USING LESS TAHN AND GREATER THAN

SELECT * FROM books WHERE released_year BETWEEN 2004 AND 2015; -- USING BETWEEN
+---------+----------------------------------+--------------+----------------+---------------+----------------+-------+
| book_id | title                            | author_fname | author_lname   | released_year | stock_quantity | pages |
+---------+----------------------------------+--------------+----------------+---------------+----------------+-------+
|       5 | A Hologram for the King: A Novel | Dave         | Eggers         |          2012 |            154 |   352 |
|       6 | The Circle                       | Dave         | Eggers         |          2013 |             26 |   504 |
|       8 | Just Kids                        | Patti        | Smith          |          2010 |             55 |   304 |
|      15 | Oblivion: Stories                | David        | Foster Wallace |          2004 |            172 |   329 |
|      16 | Consider the Lobster             | David        | Foster Wallace |          2005 |             92 |   343 |
|      17 | 10% Happier                      | Dan          | Harris         |          2014 |             29 |   256 |
+---------+----------------------------------+--------------+----------------+---------------+----------------+-------+

-- NOT BETWEEN

SELECT * FROM books WHERE released_year NOT BETWEEN 2004 AND 2015 LIMIT 5;
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       1 | The Namesake                              | Jhumpa       | Lahiri       |          2003 |             32 |   291 |
|       2 | Norse Mythology                           | Neil         | Gaiman       |          2016 |             43 |   304 |
|       3 | American Gods                             | Neil         | Gaiman       |          2001 |             12 |   465 |
|       4 | Interpreter of Maladies                   | Jhumpa       | Lahiri       |          1996 |             97 |   198 |
|       7 | The Amazing Adventures of Kavalier & Clay | Michael      | Chabon       |          2000 |             68 |   634 |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+

-- CAST() 
SELECT CAST('2017-05-02' AS DATETIME); -- IT'S BETTER USE CAST WHEN COMPARING STRINGS LIKE '2017-05-02'
+--------------------------------+
| CAST('2017-05-02' AS DATETIME) |
+--------------------------------+
| 2017-05-02 00:00:00            |
+--------------------------------+

SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';

SELECT name, birthdt FROM people WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);


/* -------------------------------------------------------------------------- */
/* IN | NOT IN | Whether a value is within a set of values                    */
/* -------------------------------------------------------------------------- */

SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Namesake                                        | Lahiri       |
| Interpreter of Maladies                             | Lahiri       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| Where I m Calling From: Selected Stories            | Carver       |
+-----------------------------------------------------+--------------+

SELECT title, released_year FROM books WHERE released_year IN (2004, 2005, 2017);
+----------------------+---------------+
| title                | released_year |
+----------------------+---------------+
| Oblivion: Stories    |          2004 |
| Consider the Lobster |          2005 |
| Lincoln In The Bardo |          2017 |
+----------------------+---------------+

SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year NOT IN (2004, 2005, 2017)
LIMIT 5;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| The Namesake                     |          2003 |
| Norse Mythology                  |          2016 |
| American Gods                    |          2001 |
| A Hologram for the King: A Novel |          2012 |
| The Circle                       |          2013 |
+----------------------------------+---------------+

-- % REMAINDER/MODULO

SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 !=0 ORDER BY released_year;
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| American Gods                             |          2001 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| fake_book                                 |          2001 |
| The Namesake                              |          2003 |
| Coraline                                  |          2003 |
| Consider the Lobster                      |          2005 |
| The Circle                                |          2013 |
| Lincoln In The Bardo                      |          2017 |
+-------------------------------------------+---------------+


/* -------------------------------------------------------------------------- */
/* CASE STATEMENTS                                                            */
/* -------------------------------------------------------------------------- */

SELECT title, released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20 Century Lit'
    END AS Era
FROM books LIMIT 5;
+----------------------------------+---------------+----------------+
| title                            | released_year | Era            |
+----------------------------------+---------------+----------------+
| The Namesake                     |          2003 | Modern Lit     |
| Norse Mythology                  |          2016 | Modern Lit     |
| American Gods                    |          2001 | Modern Lit     |
| Interpreter of Maladies          |          1996 | 20 Century Lit |
| A Hologram for the King: A Novel |          2012 | Modern Lit     |
+----------------------------------+---------------+----------------+

SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS stock
FROM books LIMIT 5;
+----------------------------------+----------------+-------+
| title                            | stock_quantity | stock |
+----------------------------------+----------------+-------+
| The Namesake                     |             32 | *     |
| Norse Mythology                  |             43 | *     |
| American Gods                    |             12 | *     |
| Interpreter of Maladies          |             97 | **    |
| A Hologram for the King: A Novel |            154 | ***   |
+----------------------------------+----------------+-------+

SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity <=50 THEN '*'
        WHEN stock_quantity <=100 THEN '**'
        WHEN stock_quantity <=150 THEN '***'
        ELSE '****'
    END AS stock
FROM books LIMIT 8, 5;
+-----------------------------------------------------+----------------+-------+
| title                                               | stock_quantity | stock |
+-----------------------------------------------------+----------------+-------+
| A Heartbreaking Work of Staggering Genius           |            104 | ***   |
| Coraline                                            |            100 | **    |
| What We Talk About When We Talk About Love: Stories |             23 | *     |
| Where I m Calling From: Selected Stories            |             12 | *     |
| White Noise                                         |             49 | *     |
+-----------------------------------------------------+----------------+-------+


/* -------------------------------------------------------------------------- */
/* EXERCISES                                                                  */
/* -------------------------------------------------------------------------- */

SELECT 10 != 10; -- FALSE
SELECT 15 > 14 && 99 - 5 <= 94; -- TRUE
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; -- TRUE

SELECT * FROM books WHERE released_year < 1980;
+---------+-------------+--------------+--------------+---------------+----------------+-------+
| book_id | title       | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------+--------------+--------------+---------------+----------------+-------+
|      14 | Cannery Row | John         | Steinbeck    |          1945 |             95 |   181 |
+---------+-------------+--------------+--------------+---------------+----------------+-------+

SELECT * FROM books where author_lname IN('Eggers', 'Chabon');
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       5 | A Hologram for the King: A Novel          | Dave         | Eggers       |          2012 |            154 |   352 |
|       6 | The Circle                                | Dave         | Eggers       |          2013 |             26 |   504 |
|       7 | The Amazing Adventures of Kavalier & Clay | Michael      | Chabon       |          2000 |             68 |   634 |
|       9 | A Heartbreaking Work of Staggering Genius | Dave         | Eggers       |          2001 |            104 |   437 |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+

SELECT CONCAT(author_lname, author_fname), 
    CASE
        WHEN author_lname = 'Eggers' THEN 'Eggers'
        WHEN author_lname = 'Chabon' THEN 'Chabon'
    END AS 'FUN'
FROM books LIMIT 3, 5;
+------------------------------------+--------+
| CONCAT(author_lname, author_fname) | FUN    |
+------------------------------------+--------+
| LahiriJhumpa                       | NULL   |
| EggersDave                         | Eggers |
| EggersDave                         | Eggers |
| ChabonMichael                      | Chabon |
| SmithPatti                         | NULL   |
+------------------------------------+--------+

SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Lahiri' && released_year > 2000;
+--------------+--------------+---------------+
| title        | author_lname | released_year |
+--------------+--------------+---------------+
| The Namesake | Lahiri       |          2003 |
+--------------+--------------+---------------+

SELECT title, pages  FROM books where pages BETWEEN 100 AND 200;
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| Interpreter of Maladies                             |   198 |
| What We Talk About When We Talk About Love: Stories |   176 |
| Cannery Row                                         |   181 |
+-----------------------------------------------------+-------+

SELECT title, author_lname FROM books WHERE author_lname LIKE 'C%' || author_lname LIKE 'S%';

SELECT 
    title, 
    author_lname 
FROM books 
WHERE 
    SUBSTR(author_lname,1,1) = 'C' OR 
    SUBSTR(author_lname,1,1) = 'S';

    SELECT title, author_lname FROM books 
WHERE SUBSTR(author_lname,1,1) IN ('C', 'S');
+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Amazing Adventures of Kavalier & Clay           | Chabon       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| Where I m Calling From: Selected Stories            | Carver       |
| Cannery Row                                         | Steinbeck    |
| Lincoln In The Bardo                                | Saunders     |
+-----------------------------------------------------+--------------+

SELECT title, author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short stories'
        WHEN title LIKE 'Just Kids' || title LIKE 'Heartbreaking Work' THEN 'Memoir'
        ELSE 'Novel'
    END AS 'TYPE'
FROM books;
+-----------------------------------------------------+----------------+---------------+
| title                                               | author_lname   | TYPE          |
+-----------------------------------------------------+----------------+---------------+
| The Namesake                                        | Lahiri         | Novel         |
| Norse Mythology                                     | Gaiman         | Novel         |
| American Gods                                       | Gaiman         | Novel         |
| Interpreter of Maladies                             | Lahiri         | Novel         |
| A Hologram for the King: A Novel                    | Eggers         | Novel         |
| The Circle                                          | Eggers         | Novel         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel         |
| Just Kids                                           | Smith          | Memoir        |
| A Heartbreaking Work of Staggering Genius           | Eggers         | Novel         |
| Coraline                                            | Gaiman         | Novel         |
| What We Talk About When We Talk About Love: Stories | Carver         | Short stories |
| Where I m Calling From: Selected Stories            | Carver         | Short stories |
| White Noise                                         | DeLillo        | Novel         |
| Cannery Row                                         | Steinbeck      | Novel         |
| Oblivion: Stories                                   | Foster Wallace | Short stories |
| Consider the Lobster                                | Foster Wallace | Novel         |
| 10% Happier                                         | Harris         | Novel         |
| fake_book                                           | Harris         | Novel         |
| Lincoln In The Bardo                                | Saunders       | Novel         |
+-----------------------------------------------------+----------------+---------------+


SELECT author_fname, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books 
GROUP BY author_lname, author_fname;
+--------------+----------------+---------+
| author_fname | author_lname   | COUNT   |
+--------------+----------------+---------+
| Jhumpa       | Lahiri         | 2 books |
| Neil         | Gaiman         | 3 books |
| Dave         | Eggers         | 3 books |
| Michael      | Chabon         | 1 book  |
| Patti        | Smith          | 1 book  |
| Raymond      | Carver         | 2 books |
| Don          | DeLillo        | 1 book  |
| John         | Steinbeck      | 1 book  |
| David        | Foster Wallace | 2 books |
| Dan          | Harris         | 1 book  |
| Freida       | Harris         | 1 book  |
| George       | Saunders       | 1 book  |
+--------------+----------------+---------+