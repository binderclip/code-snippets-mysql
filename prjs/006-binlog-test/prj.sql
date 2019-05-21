-- check binlog config
show variables like 'log_%'; 

-- create database
create database cool_db;
use cool_db;

-- create table
CREATE TABLE cool_table
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    v INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

-- insert data
INSERT INTO cool_table (v)
    VALUES (1),
           (2),
           (3),
           (4);

-- query
select * from cool_table;

update cool_table set v=v+1 where v > 2;

INSERT INTO cool_table (v)
    VALUES (10);

delete from cool_table where v < 3;

select * from cool_table where v < 10;