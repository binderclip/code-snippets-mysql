CREATE TABLE yourtable
    (`id` int,
     `t1` int,
     `t2` int
    );

INSERT INTO yourtable
    (`id`, `t1`, `t2`)
VALUES
    (101, 10, 5),
    (102, 3, 2);

select id, t1 value, 't1' t
from yourtable
union all
select id, t2 value, 't2' t
from yourtable;
-- https://stackoverflow.com/questions/13944417/mysql-convert-column-to-row-pivot-table
