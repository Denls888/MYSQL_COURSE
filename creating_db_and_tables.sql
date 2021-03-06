#*STARTS CLI
mysql-ctl cli;

############################



#*LISTS AVALIBLE DATABASES
show databases; 



############################



#*GENERAL COMMANDS TO CREATE AND DROP DATABASES
CREATE DATABASE database_name;

DROP DATABASE database_name;



############################



#*TO USE SPECIFIC DATABASE
USE <database_name>;

SELECT database_name();



############################



#TO SHOW SPECIFIC TABLES/ROWS
SHOW TABLES;
 
SHOW COLUMNS FROM tablename;


#SELECTING

SELECT * FROM table_name;
 
DESC tablename;


#DELETE TABLE
DROP TABLE tablename;