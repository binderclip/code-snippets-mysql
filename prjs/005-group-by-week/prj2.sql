CREATE TABLE yourtable
    (`id` int,
     `dt` datetime,
     `n` int
    );

INSERT INTO yourtable
    (`dt`, `n`)
VALUES
    ('2018-12-07 17:19:33', 5),
    ('2019-03-13 17:19:33', 10),
    ('2019-03-17 17:19:33', 12);

select
    date_add(date_add(LAST_DAY(dt), interval 1 DAY), interval -1 MONTH) AS month_first_day,
    sum(n)
from yourtable
group by month_first_day;

/* month_first_day    sum(n)
2018-12-01    5
2019-03-01    22 */
