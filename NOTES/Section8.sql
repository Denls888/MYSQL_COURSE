
/* -------------------------------------------------------------------------- */
/* DISTINCT statement is used to return only distinct (different) values.     */
/* -------------------------------------------------------------------------- */

SELECT DISTINCT author_lname FROM books LIMIT 5;

+--------------+    
| author_lname |
+--------------+
| Lahiri       |
| Gaiman       |
| Eggers       |
| Chabon       |
| Smith        |
+--------------+


--GETS RID OF DUPLICATES
--##################################################################################


SELECT DISTINCT CONCAT(author_fname,' ', author_lname)
AS 'AUTHORS WITHOUT DUPS'
FROM books;

+----------------------+
| AUTHORS WITHOUT DUPS |
+----------------------+
| Jhumpa Lahiri        |
| Neil Gaiman          |
| Dave Eggers          |
| Michael Chabon       |
| Patti Smith          |
| Raymond Carver       |
| Don DeLillo          |
| John Steinbeck       |
| David Foster Wallace |
| Dan Harris           |
| Freida Harris        |
| George Saunders      |
+----------------------+

--##################################################################################


/* -------------------------------------------------------------------------- */
/* ORDER BY - SORTING OUR RESULTS                                             */
/* -------------------------------------------------------------------------- */

SELECT author_lname FROM books 
ORDER BY author_lname 
LIMIT 5;

+--------------+
| author_lname |
+--------------+
| Carver       |
| Carver       |
| Chabon       |
| DeLillo      |
| Eggers       |
+--------------+

--##################################################################################

SELECT title FROM books 
ORDER BY title DESC
LIMIT 5;

+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| White Noise                                         |
| Where Im Calling From: Selected Stories            |
| What We Talk About When We Talk About Love: Stories |
| The Namesake                                        |
| The Circle                                          |
+-----------------------------------------------------+

--##################################################################################

SELECT title, released_year FROM books 
ORDER BY released_year DESC
LIMIT 5;

+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Lincoln In The Bardo             |          2017 |
| Norse Mythology                  |          2016 |
| 10% Happier                      |          2014 |
| The Circle                       |          2013 |
| A Hologram for the King: A Novel |          2012 |
+----------------------------------+---------------+

--##################################################################################

SELECT title, released_year, pages FROM books 
ORDER BY 3 DESC
LIMIT 5;

+-------------------------------------------+---------------+-------+
| title                                     | released_year | pages |
+-------------------------------------------+---------------+-------+
| The Amazing Adventures of Kavalier & Clay |          2000 |   634 |
| Where I m Calling From: Selected Stories  |          1989 |   526 |
| The Circle                                |          2013 |   504 |
| American Gods                             |          2001 |   465 |
| A Heartbreaking Work of Staggering Genius |          2001 |   437 |
+-------------------------------------------+---------------+-------+

--##################################################################################

SELECT author_fname, author_lname FROM books
ORDER BY author_lname, author_fname --sorting by last then by first
LIMIT 5; 

+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Raymond      | Carver         |
| Raymond      | Carver         |
| Michael      | Chabon         |
| Don          | DeLillo        |
| Dave         | Eggers         |
| Dave         | Eggers         |
| Dave         | Eggers         |
| David        | Foster Wallace |
| David        | Foster Wallace |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Dan          | Harris         |
| Freida       | Harris         |
| Jhumpa       | Lahiri         |
| Jhumpa       | Lahiri         |
| George       | Saunders       |
| Patti        | Smith          |
| John         | Steinbeck      |
+--------------+----------------+

--##################################################################################


/* -------------------------------------------------------------------------- */
/* LIMIT                                                                      */
/* -------------------------------------------------------------------------- */


SELECT title, released_year FROM books  -- 1 to 5
ORDER BY released_year DESC 
LIMIT 5;

+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Lincoln In The Bardo             |          2017 |
| Norse Mythology                  |          2016 |
| 10% Happier                      |          2014 |
| The Circle                       |          2013 |
| A Hologram for the King: A Novel |          2012 |
+----------------------------------+---------------+

--##################################################################################


SELECT title, released_year FROM books  -- 6 to 10
ORDER BY released_year DESC 
LIMIT 5,10;

+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| Just Kids                                 |          2010 |
| Consider the Lobster                      |          2005 |
| Oblivion: Stories                         |          2004 |
| The Namesake                              |          2003 |
| Coraline                                  |          2003 |
| American Gods                             |          2001 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| fake_book                                 |          2001 |
| The Amazing Adventures of Kavalier & Clay |          2000 |
| Interpreter of Maladies                   |          1996 |
+-------------------------------------------+---------------+

--##################################################################################

/* -------------------------------------------------------------------------- */
/* LIKE  "contains"                                                           */
/* -------------------------------------------------------------------------- */

SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%'; -- % % - wildcard

+-------------------------------------------+--------------+
| title                                     | author_fname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Dave         |
| The Circle                                | Dave         |
| A Heartbreaking Work of Staggering Genius | Dave         |
| Oblivion: Stories                         | David        |
| Consider the Lobster                      | David        |
| 10% Happier                               | Dan          |
| fake_book                                 | Freida       |
+-------------------------------------------+--------------+

--##################################################################################

SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%'; -- Freida is gone

+-------------------------------------------+--------------+
| title                                     | author_fname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Dave         |
| The Circle                                | Dave         |
| A Heartbreaking Work of Staggering Genius | Dave         |
| Oblivion: Stories                         | David        |
| Consider the Lobster                      | David        |
| 10% Happier                               | Dan          |
+-------------------------------------------+--------------+

--##################################################################################

SELECT title, stock_quantity FROM books 
WHERE stock_quantity LIKE '____'; -- 4 underscores = 4 characters/digits

+----------------------+----------------+
| title                | stock_quantity |
+----------------------+----------------+
| Lincoln In The Bardo |           1000 |
+----------------------+----------------+

--##################################################################################

---  (206)412-8195 LIKE '(___)___-____'

--##################################################################################

SELECT title FROM books
WHERE title LIKE '%\%%';  --- "\" before actual symbol defines that symbol

+-------------+
| title       |
+-------------+
| 10% Happier |
+-------------+

--##################################################################################

SELECT title FROM books
WHERE title LIKE '%\_%%'; --- "\" before actual symbol defines that symbol

+-----------+
| title     |
+-----------+
| fake_book |
+-----------+

--##################################################################################

SELECT title FROM books
WHERE title LIKE '%stories%';

+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| What We Talk About When We Talk About Love: Stories |
| Where I m Calling From: Selected Stories            |
| Oblivion: Stories                                   |
+-----------------------------------------------------+


SELECT title, pages FROM books 
ORDER BY pages DESC
LIMIT 1;

+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+


SELECT CONCAT(title, ' - ', released_year)
AS summary
FROM books
ORDER BY released_year DESC
LIMIT 3;

+-----------------------------+
| summary                     |
+-----------------------------+
| Lincoln In The Bardo - 2017 |
| Norse Mythology - 2016      |
| 10% Happier - 2014          |
+-----------------------------+


SELECT title, author_lname FROM books
WHERE author_lname like '%\ %';

+----------------------+----------------+
| title                | author_lname   |
+----------------------+----------------+
| Oblivion: Stories    | Foster Wallace |
| Consider the Lobster | Foster Wallace |
+----------------------+----------------+


SELECT title, released_year, stock_quantity FROM books
ORDER BY stock_quantity, title ASC 
LIMIT 3;

+-----------------------------------------------------+---------------+----------------+
| title                                               | released_year | stock_quantity |
+-----------------------------------------------------+---------------+----------------+
| American Gods                                       |          2001 |             12 |
| Where I m Calling From: Selected Stories            |          1989 |             12 |
| What We Talk About When We Talk About Love: Stories |          1981 |             23 |
+-----------------------------------------------------+---------------+----------------+


SELECT title, author_lname FROM books
ORDER BY 2,1;

+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| What We Talk About When We Talk About Love: Stories | Carver         |
| Where I m Calling From: Selected Stories            | Carver         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         |
| White Noise                                         | DeLillo        |
| A Heartbreaking Work of Staggering Genius           | Eggers         |
| A Hologram for the King: A Novel                    | Eggers         |
| The Circle                                          | Eggers         |
| Consider the Lobster                                | Foster Wallace |
| Oblivion: Stories                                   | Foster Wallace |
| American Gods                                       | Gaiman         |
| Coraline                                            | Gaiman         |
| Norse Mythology                                     | Gaiman         |
| 10% Happier                                         | Harris         |
| fake_book                                           | Harris         |
| Interpreter of Maladies                             | Lahiri         |
| The Namesake                                        | Lahiri         |
| Lincoln In The Bardo                                | Saunders       |
| Just Kids                                           | Smith          |
| Cannery Row                                         | Steinbeck      |
+-----------------------------------------------------+----------------+


SELECT 
    UPPER(CONCAT('my favorite author is ', author_fname, ' ', author_lname, '!')) AS 'yell'
from books
ORDER BY author_lname;

+---------------------------------------------+
| yell                                        |
+---------------------------------------------+
| MY FAVORITE AUTHOR IS RAYMOND CARVER!       |
| MY FAVORITE AUTHOR IS RAYMOND CARVER!       |
| MY FAVORITE AUTHOR IS MICHAEL CHABON!       |
| MY FAVORITE AUTHOR IS DON DELILLO!          |
| MY FAVORITE AUTHOR IS DAVE EGGERS!          |
| MY FAVORITE AUTHOR IS DAVE EGGERS!          |
| MY FAVORITE AUTHOR IS DAVE EGGERS!          |
| MY FAVORITE AUTHOR IS DAVID FOSTER WALLACE! |
| MY FAVORITE AUTHOR IS DAVID FOSTER WALLACE! |
| MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
| MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
| MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
| MY FAVORITE AUTHOR IS DAN HARRIS!           |
| MY FAVORITE AUTHOR IS FREIDA HARRIS!        |
| MY FAVORITE AUTHOR IS JHUMPA LAHIRI!        |
| MY FAVORITE AUTHOR IS JHUMPA LAHIRI!        |
| MY FAVORITE AUTHOR IS GEORGE SAUNDERS!      |
| MY FAVORITE AUTHOR IS PATTI SMITH!          |
| MY FAVORITE AUTHOR IS JOHN STEINBECK!       |
+---------------------------------------------+

