///Inserting_data 


###########
SHOW WARNINGS;
###########




#Primary key(UNIQUE_IDENTIFIER)

CREATE TABLE unique_cats (cat_id int not null,
                         name varchar(100),
                         age int,
                         PRIMARY KEY (cat_id)); 
                         
                         
#AUTO INCREMENT

CREATE TABLE unique_cats2 (cat_id int not null AUTO_INCREMENT,
                         name varchar(100),
                         age int,
                         PRIMARY KEY (cat_id)); 
                         
                    
########################################################
########################################################



CREATE TABLE employees (
  id int not null AUTO_INCREMENT, #PRIMARY KEY (id) <--(can be here)
  last_name varchar(50) not null,
  first_name varchar(50) not null,
  middle_name varchar(50) not null DEFAULT 'not applicable',
  age int not null,
  current_status varchar(100) not null DEFAULT 'employed',
  PRIMARY KEY (id)
);




INSERT INTO employees (last_name, first_name, age)
VALUES
('Isaev', 'Denis', 25)
;



####################################################################
####################################################################
#* THIS IS WHAT STUFF ABOVE DOES
####################################################################
####################################################################
####################################################################
mysql> CREATE TABLE employees (
    ->   id int not null AUTO_INCREMENT,
    ->   last_name varchar(50) not null,
    ->   first_name varchar(50) not null,
    ->   middle_name varchar(50) not null DEFAULT 'not applicable',
    ->   age int not null,
    ->   current_status varchar(100) not null DEFAULT 'employed',
    ->   PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> desc employees;
+----------------+--------------+------+-----+----------------+----------------+
| Field          | Type         | Null | Key | Default        | Extra          |
+----------------+--------------+------+-----+----------------+----------------+
| id             | int(11)      | NO   | PRI | NULL           | auto_increment |
| last_name      | varchar(50)  | NO   |     | NULL           |                |
| first_name     | varchar(50)  | NO   |     | NULL           |                |
| middle_name    | varchar(50)  | NO   |     | not applicable |                |
| age            | int(11)      | NO   |     | NULL           |                |
| current_status | varchar(100) | NO   |     | employed       |                |
+----------------+--------------+------+-----+----------------+----------------+
6 rows in set (0.00 sec)

mysql> INSERT INTO employees (last_name, first_name, age)
    -> VALUES
    -> ('Isaev', 'Denis', 25)
    -> ;
Query OK, 1 row affected (0.00 sec)

mysql> select * from employees;
+----+-----------+------------+----------------+-----+----------------+
| id | last_name | first_name | middle_name    | age | current_status |
+----+-----------+------------+----------------+-----+----------------+
|  1 | Isaev     | Denis      | not applicable |  25 | employed       |
+----+-----------+------------+----------------+-----+----------------+
1 row in set (0.00 sec)

mysql>
####################################################################
####################################################################
####################################################################




create table cats
     (
     cat_id int not null auto_increment,
     name varchar(100),
     breed varchar(100),
     age int,
     primary key (cat_id)
     );



INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);



#TO SELECT MULTIPLE COLUMNS OF THE SAME TABLE
select cat_id, age from cats;


SELECT * FROM cats WHERE age=4;


#VARCHAR SHOULD USE ' ' 
SELECT * FROM cats WHERE name='egg';

#ALIASES CHANGES COLUMN NAME 
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;
+----------------+-------------+
| cat name       | kitty breed |
+----------------+-------------+
| Ringo          | Tabby       |
| Cindy          | Maine Coon  |
| Dumbledore     | Maine Coon  |
| Egg            | Persian     |
| Misty          | Tabby       |
| George Michael | Ragdoll     |
| Jackson        | Sphynx      |
+----------------+-------------+

SELECT cat_id AS id, name FROM cats;
+----+----------------+
| id | name           |
+----+----------------+
|  1 | Ringo          |
|  2 | Cindy          |
|  3 | Dumbledore     |
|  4 | Egg            |
|  5 | Misty          |
|  6 | George Michael |
|  7 | Jackson        |
+----+----------------+

##############################################
##############################################
 select cat_id, age from cats where cat_id like age; #OR CAT_ID=AGE
+--------+------+
| cat_id | age  |
+--------+------+
|      4 |    4 |
|      7 |    7 |
+--------+------+
##############################################


##############################################
select cat_id from cats;
+--------+
| cat_id |
+--------+
|      1 |
|      2 |
|      3 |
|      4 |
|      5 |
|      6 |
|      7 |
+--------+
##############################################
##############################################



##############################################
##############################################
select name, breed from cats;
+----------------+------------+
| name           | breed      |
+----------------+------------+
| Ringo          | Tabby      |
| Cindy          | Maine Coon |
| Dumbledore     | Maine Coon |
| Egg            | Persian    |
| Misty          | Tabby      |
| George Michael | Ragdoll    |
| Jackson        | Sphynx     |
+----------------+------------+
##############################################
##############################################




##############################################
##############################################
 select name, age from cats where breed='tabby';
+-------+------+
| name  | age  |
+-------+------+
| Ringo |    4 |
| Misty |   13 |
##############################################
##############################################



