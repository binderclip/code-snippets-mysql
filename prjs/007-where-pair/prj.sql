-- create table
CREATE TABLE cool_table
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    a INT(10) UNSIGNED NOT NULL,
    b INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

-- insert data
INSERT INTO cool_table (a, b)
    VALUES (1, 15),
           (2, 12),
           (2, 17),
           (3, 18),
           (3, 11);

-- query
select * from cool_table where (a, b) >= (2, 16) order by a, b;
