

--UPDATE table_name SET column_name='new data' WHERE column_name='old_data';

UPDATE cats SET breed='Shorthair'
    WHERE breed='tabby';

UPDATE cats SET age=99
    WHERE age=10;

update cats set name='jack'
    where name='jackson';

UPDATE cats SET breed='British shorthair'
    WHERE name='ringo';

UPDATE cats set age=12
     where breed='maine coon';

--################################
--################################


/* -------------------------------------------------------------------------- */
/* THIS WILL DELETE A ROW WHERE NAME IS 'EGG'                                 */
/* -------------------------------------------------------------------------- */

DELETE FROM cats WHERE name='egg';

/* -------------------------------------------------------------------------- */
/* DELETE FROM cats; will delete only rows from table 'cats'                  */
/* -------------------------------------------------------------------------- */

DELETE FROM cats;


---#################################
DELETE FROM cats where age=4;

DELETE FROM cats where age=cat_id;

DELETE FROM cats;
---#################################
---#################################



/* -------------------------------------------------------------------------- */
/* #CRUD CHALLANGE SECTION                                                    */
/* -------------------------------------------------------------------------- */

CREATE DATABASE shirts_db;

CREATE TABLE shirts(
shirt_id int NOT null AUTO_INCREMENT,
article varchar(50),
color varchar(50),
shirt_size varchar(50),
last_worn int,
PRIMARY KEY(shirt_id)
);


INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);



INSERT INTO shirts (article, color, shirt_size, last_worn) values ('polo shirt', 'purple', 'm', 50);

SELECT article, color FROM shirts;

SELECT * FROM shirts WHERE shirt_size='M';

SELECT article, color, shirt_size, last_worn FROM shirts where shirt_size='m';

UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';

UPDATE shirts SET last_worn=0 WHERE last_worn=15;

UPDATE shirts SET shirt_size='XS', color='off white' WHERE color='white';

DELETE from shirts WHERE last_worn>=200;

DELETE from shirts where article='tank top';

DELETE from shirts;

DROP table shirts;

