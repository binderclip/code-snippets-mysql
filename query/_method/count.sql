SELECT COUNT(*) FROM foo4;
SELECT COUNT(id) FROM foo4;
SELECT COUNT(e) FROM foo4;
SELECT COUNT(0) FROM foo4;
SELECT COUNT(1) FROM foo4;
SELECT COUNT(2) FROM foo4;
SELECT COUNT(3) FROM foo4;
SELECT 0 FROM foo4;
SELECT 1 FROM foo4;


SELECT COUNT(DISTINCT e) FROM foo4;     -- 不计算 NULL
SELECT COUNT(DISTINCT b) FROM foo3;     -- 只计算不一样的数量
SELECT COUNT(b) FROM foo3;


-- count and case
create table mytable (
   id int(10) unsigned not null auto_increment,
  primary key (id)
);
insert into mytable (
  id
) values
(1), (2), (3), (4), (5);
select
  count(*),
  count(case when id > 3 then 1 end) cnt_id_bigger_than_avg
from mytable;
