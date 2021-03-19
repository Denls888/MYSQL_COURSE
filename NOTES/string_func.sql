/* -------------------------------------------------------------------------- */
/* The CONCAT() function adds two or more strings together.                   */
/* -------------------------------------------------------------------------- */

SELECT
   CONCAT(author_fname, ' ', author_lname)
FROM books;

+-----------------------------------------+
| CONCAT(author_fname, ' ', author_lname) |
+-----------------------------------------+
| Jhumpa Lahiri                           |
| Neil Gaiman                             |
| Neil Gaiman                             |
| Jhumpa Lahiri                           |
| Dave Eggers                             |
| Dave Eggers                             |
| Michael Chabon                          |
| Patti Smith                             |
| Dave Eggers                             |
| Neil Gaiman                             |
| Raymond Carver                          |
| Raymond Carver                          |
| Don DeLillo                             |
| John Steinbeck                          |
| David Foster Wallace                    |
| David Foster Wallace                    |
+-----------------------------------------+

---######################################################

SELECT author_fname AS first, author_lname AS last,
    CONCAT (author_fname, ' ', author_lname) AS full
FROM books;

+---------+----------------+----------------------+
| first   | last           | full                 |
+---------+----------------+----------------------+
| Jhumpa  | Lahiri         | Jhumpa Lahiri        |
| Neil    | Gaiman         | Neil Gaiman          |
| Neil    | Gaiman         | Neil Gaiman          |
| Jhumpa  | Lahiri         | Jhumpa Lahiri        |
| Dave    | Eggers         | Dave Eggers          |
| Dave    | Eggers         | Dave Eggers          |
| Michael | Chabon         | Michael Chabon       |
| Patti   | Smith          | Patti Smith          |
| Dave    | Eggers         | Dave Eggers          |
| Neil    | Gaiman         | Neil Gaiman          |
| Raymond | Carver         | Raymond Carver       |
| Raymond | Carver         | Raymond Carver       |
| Don     | DeLillo        | Don DeLillo          |
| John    | Steinbeck      | John Steinbeck       |
| David   | Foster Wallace | David Foster Wallace |
| David   | Foster Wallace | David Foster Wallace |
+---------+----------------+----------------------+

---######################################################


---CONCAT_WS The first argument is the separator 
---for the rest of the arguments.


SELECT
    CONCAT_WS(' - ', title, author_fname, author_lname)
FROM books;

+------------------------------------------------------------------------+
| CONCAT_WS (' - ', title, author_fname, author_lname)                   |
+------------------------------------------------------------------------+
| The Namesake - Jhumpa - Lahiri                                         |
| Norse Mythology - Neil - Gaiman                                        |
| American Gods - Neil - Gaiman                                          |
| Interpreter of Maladies - Jhumpa - Lahiri                              |
| A Hologram for the King: A Novel - Dave - Eggers                       |
| The Circle - Dave - Eggers                                             |
| The Amazing Adventures of Kavalier & Clay - Michael - Chabon           |
| Just Kids - Patti - Smith                                              |
| A Heartbreaking Work of Staggering Genius - Dave - Eggers              |
| Coraline - Neil - Gaiman                                               |
| What We Talk About When We Talk About Love: Stories - Raymond - Carver |

---######################################################
---######################################################

/* -------------------------------------------------------------------------- */
/* SUBSTRING   SUBSTR()     
The SUBSTRING() function extracts a substring from a string (starting at any position).
Note: The SUBSTR() and MID() functions equals to the SUBSTRING() function.                                                  */
/* -------------------------------------------------------------------------- */

SELECT SUBSTRING('Hello World', 1, 4);

+--------------------------------+
| SUBSTRING('Hello World', 1, 4) |
+--------------------------------+
| Hell                           |
+--------------------------------+

---######################################################

SELECT SUBSTRING('Hello World', 7);

+-----------------------------+
| SUBSTRING('Hello World', 7) |
+-----------------------------+
| World                       |
+-----------------------------+

---######################################################

SELECT SUBSTRING('Hello World', -3);

+------------------------------+
| SUBSTRING('Hello World', -3) |
+------------------------------+
| rld                          |
+------------------------------+

---######################################################

SELECT SUBSTRING(title, 1, 10) FROM books;

+-------------------------+
| SUBSTRING(title, 1, 10) |
+-------------------------+
| The Namesa              |
| Norse Myth              |
| American G              |

---######################################################

SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;

+-------------+
| short title |
+-------------+
| The Namesa  |
| Norse Myth  |
| American G  |
| Interprete  |
| A Hologram  |

---######################################################

SELECT CONCAT (SUBSTRING(title, 1, 10), '...') AS 'short title'
FROM books;

+---------------+
| short title   |
+---------------+
| The Namesa... |
| Norse Myth... |
| American G... |
| Interprete... |
| A Hologram... |

---######################################################

/* -------------------------------------------------------------------------- */
/* REPLACE  MySQL REPLACE() replaces all the occurrences of a substring within a string.                                                                  */
/* -------------------------------------------------------------------------- */

SELECT REPLACE('Hello World', 'Hell', 'adcc');
 
 +----------------------------------------+
| REPLACE('Hello World', 'Hell', 'adcc') |
+----------------------------------------+
| adcco World                            |
+----------------------------------------+


SELECT
  REPLACE('cheese bread coffee milk', ' ', ' and ');

+---------------------------------------------------+
| REPLACE('cheese bread coffee milk', ' ', ' and ') |
+---------------------------------------------------+
| cheese and bread and coffee and milk              |
+---------------------------------------------------+


SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title'
FROM books;

SELECT SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS 'weird string'
FROM books;

SELECT CONCAT (author_fname, ' - ', released_year)
AS LnameYear
FROM books;


/* -------------------------------------------------------------------------- */
/* REVERSE                                                                    */
/* -------------------------------------------------------------------------- */

SELECT REVERSE('hello world');

SELECT CONCAT('woof', REVERSE('woof'));
 
SELECT CONCAT(author_fname, ' - ', REVERSE(author_fname)) FROM books;


/* -------------------------------------------------------------------------- */
/* CHAR_LENGTH - Counts Characters in string                                  */
/* -------------------------------------------------------------------------- */

SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long')
AS 'last name lenght'
from books;

+--------------------------------------+
| last name lenght                     |
+--------------------------------------+
| Lahiri is 6 characters long          |
| Gaiman is 6 characters long          |
| Gaiman is 6 characters long          |
| Lahiri is 6 characters long          |
| Eggers is 6 characters long          |
| Eggers is 6 characters long          |
| Chabon is 6 characters long          |
| Smith is 5 characters long           |
| Eggers is 6 characters long          |
| Gaiman is 6 characters long          |
| Carver is 6 characters long          |
| Carver is 6 characters long          |
| DeLillo is 7 characters long         |
| Steinbeck is 9 characters long       |
| Foster Wallace is 14 characters long |
| Foster Wallace is 14 characters long |



/* -------------------------------------------------------------------------- */
/* UPPER() and LOWER() -  changes string casing                               */
/* -------------------------------------------------------------------------- */

SELECT UPPER('Hello World');
 
SELECT LOWER('Hello World');

SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;


/* -------------------------------------------------------------------------- */
/* CHALLANGES                                                                 */
/* -------------------------------------------------------------------------- */


---####################################################################

SELECT UPPER(REVERSE ('Why does my cat look at me with such hatred'))
AS 'Reversed Text';

+---------------------------------------------+
| Reversed Text                               |
+---------------------------------------------+
| DERTAH HCUS HTIW EM TA KOOL TAC YM SEOD YHW |
+---------------------------------------------+

---####################################################################


SELECT REPLACE (CONCAT('I', '  ', 'LIKE', '  ', 'CATS'), '  ', '_');

I_LIKE_CATS

+--------------------------------------------------------------+
| REPLACE (CONCAT('I', '  ', 'LIKE', '  ', 'CATS'), '  ', '_') |
+--------------------------------------------------------------+
| I_LIKE_CATS                                                  |
+--------------------------------------------------------------+


---####################################################################

SELECT REPLACE(title, ' ', '->') as title from books;

+--------------------------------------------------------------+
| title                                                        |
+--------------------------------------------------------------+
| The->Namesake                                                |
| Norse->Mythology                                             |
| American->Gods                                               |
| Interpreter->of->Maladies                                    |
| A->Hologram->for->the->King:->A->Novel                       |
| The->Circle                                                  |
| The->Amazing->Adventures->of->Kavalier->&->Clay              |
| Just->Kids                                                   |
| A->Heartbreaking->Work->of->Staggering->Genius               |
| Coraline                                                     |
| What->We->Talk->About->When->We->Talk->About->Love:->Stories |


---####################################################################

SELECT author_lname as frowards,
REVERSE(author_lname) as backwards
FROM books;

+----------------+----------------+
| frowards       | backwards      |
+----------------+----------------+
| Lahiri         | irihaL         |
| Gaiman         | namiaG         |
| Gaiman         | namiaG         |
| Lahiri         | irihaL         |
| Eggers         | sreggE         |
| Eggers         | sreggE         |
| Chabon         | nobahC         |
| Smith          | htimS          |
| Eggers         | sreggE         |
| Gaiman         | namiaG         |
| Carver         | revraC         |
| Carver         | revraC         |
| DeLillo        | olliLeD        |
| Steinbeck      | kcebnietS      |
| Foster Wallace | ecallaW retsoF |
| Foster Wallace | ecallaW retsoF |
+----------------+----------------+

---####################################################################


SELECT UPPER(CONCAT(author_fname, ' ', author_lname))
AS 'full name in caps'
FROM books;

+----------------------+
| full name in caps    |
+----------------------+
| JHUMPA LAHIRI        |
| NEIL GAIMAN          |
| NEIL GAIMAN          |
| JHUMPA LAHIRI        |
| DAVE EGGERS          |
| DAVE EGGERS          |
| MICHAEL CHABON       |
| PATTI SMITH          |
| DAVE EGGERS          |
| NEIL GAIMAN          |
| RAYMOND CARVER       |
| RAYMOND CARVER       |
| DON DELILLO          |
| JOHN STEINBECK       |
| DAVID FOSTER WALLACE |
| DAVID FOSTER WALLACE |
+----------------------+

---####################################################################

SELECT CONCAT(title, ' was released in ', released_year)
   AS 'blurb'
FROM books;

+--------------------------------------------------------------------------+
| blurb                                                                    |
+--------------------------------------------------------------------------+
| The Namesake was released in 2003                                        |
| Norse Mythology was released in 2016                                     |
| American Gods was released in 2001                                       |
| Interpreter of Maladies was released in 1996                             |
| A Hologram for the King: A Novel was released in 2012                    |
| The Circle was released in 2013                                          |
| The Amazing Adventures of Kavalier & Clay was released in 2000           |
| Just Kids was released in 2010                                           |
| A Heartbreaking Work of Staggering Genius was released in 2001           |
| Coraline was released in 2003                                            |
| What We Talk About When We Talk About Love: Stories was released in 1981 |


---####################################################################

SELECT title, CHAR_LENGTH(title) as 'character count' from books;

+-----------------------------------------------------+-----------------+
| title                                               | character count |
+-----------------------------------------------------+-----------------+
| The Namesake                                        |              12 |
| Norse Mythology                                     |              15 |
| American Gods                                       |              13 |
| Interpreter of Maladies                             |              23 |
| A Hologram for the King: A Novel                    |              32 |
| The Circle                                          |              10 |
| The Amazing Adventures of Kavalier & Clay           |              41 |
| Just Kids                                           |               9 |
| A Heartbreaking Work of Staggering Genius           |              41 |
| Coraline                                            |               8 |


---####################################################################

SELECT 
   CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
   CONCAT(author_lname, ',', author_fname) AS 'author',
   CONCAT(stock_quantity, ' in stock') AS 'quantity'
FROM books LIMIT 2;

+---------------+---------------+-------------+
| short title   | author        | quantity    |
+---------------+---------------+-------------+
| The Namesa... | Lahiri,Jhumpa | 32 in stock |
| Norse Myth... | Gaiman,Neil   | 43 in stock |
+---------------+---------------+-------------+


---####################################################################