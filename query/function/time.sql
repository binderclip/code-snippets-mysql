select weekofyear('2015-12-31'); -- 53
select weekofyear('2018-12-31'); -- 1
select weekofyear('2018-12-30'); -- 52
select weekofyear('2018-12-29'); -- 52

select unix_timestamp('2018-12-29'); -- 1546041600

SELECT DATEDIFF("2017-06-14 09:34:21", "2017-06-15 15:25:35"); -- -1
SELECT DATEDIFF("2017-06-14 15:34:21", "2017-06-15 09:25:35"); -- -1
SELECT DATEDIFF("2017-06-15 23:59:59", "2017-06-14 00:00:00"); -- 1

select hour('2019-02-11 15:41:42'); -- 15

select NOW(); -- 2019-02-19 08:54:53

select DATE(NOW()); -- 2019-02-19
select TIME(NOW()); -- 09:07:48
select HOUR(NOW()); -- 9
