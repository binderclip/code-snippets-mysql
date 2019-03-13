CREATE TABLE yourtable
    (`id` int,
     `dt` datetime,
     `n` int
    );

INSERT INTO yourtable
    (`dt`, `n`)
VALUES
    ('2019-03-7 17:19:33', 5),
    ('2019-03-13 17:19:33', 10),
    ('2019-03-17 17:19:33', 12);

select
    FROM_DAYS(TO_DAYS(dt) -MOD(TO_DAYS(dt) -2, 7)) as monday,
    sum(n)
from yourtable
group by monday;

/* monday    sum(n)
2019-03-04    5
2019-03-11    22 */
