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

SELECT title from books
WHERE title = (SELECT released_year WHERE released_year)
