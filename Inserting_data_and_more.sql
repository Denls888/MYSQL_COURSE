///Inserting_data 


###########
SHOW WARNINGS;
###########




///Primary_key(UNIQUE_IDENTIFIER)

CREATE TABLE unique_cats (cat_id int not null,
                         name varchar(100),
                         age int,
                         PRIMARY KEY (cat_id)); 
                         
                         
/AUTO_INCREMENT

CREATE TABLE unique_cats2 (cat_id int not null AUTO_INCREMENT,
                         name varchar(100),
                         age int,
                         PRIMARY KEY (cat_id)); 
                         
                    
########################################################
########################################################



CREATE TABLE employees (
  id int not null AUTO_INCREMENT, #*PRIMARY KEY (id) <--(can be here)
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
