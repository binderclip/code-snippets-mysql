-- create table
CREATE TABLE get_delta
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    r_id INT(10) UNSIGNED NOT NULL,
    v INT(10) UNSIGNED NOT NULL,
    t DATETIME,
    PRIMARY KEY (`id`)
);

-- insert data
INSERT INTO get_delta (r_id, v, t)
    VALUES (100, 7, '2018-05-05 01:00:00'), (100, 9, '2018-05-06 02:00:00'),
           (100, 27, '2018-05-07 01:00:00'), (100, 59, '2018-05-08 02:00:00'),
           (100, 90, '2018-05-09 01:00:00'),
           (101, 3, '2018-05-08 02:00:00'), (101, 2, '2018-05-09 01:00:00');

-- query
select * from get_delta;

select
  g1.r_id,
  g1.t,
  (g1.v-ifnull(g2.v, 0)) as delta
from get_delta g1
  left outer JOIN get_delta g2 on g1.r_id = g2.r_id
    and DATEDIFF(g1.t, g2.t)=1;
