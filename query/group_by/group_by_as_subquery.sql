SELECT
    bar_count, bar
FROM
    (SELECT
        COUNT(*) AS bar_count, foo.bar AS bar
    FROM
        foo
    GROUP BY foo.bar) AS s
WHERE
    bar_count > 1
ORDER BY bar_count DESC;
-- https://stackoverflow.com/a/27619065/3936457

-- 分组取数量、过滤数量、排序
SELECT COUNT(*) AS bar_count, bar FROM foo GROUP BY bar HAVING bar_count > 1 ORDER BY bar_count DESC;
-- 分组取数量、过滤数量、再取总数
SELECT COUNT(*) FROM
	(SELECT COUNT(*) AS bar_count, bar FROM foo GROUP BY bar HAVING bar_count > 1 ORDER BY bar_count) AS s;
