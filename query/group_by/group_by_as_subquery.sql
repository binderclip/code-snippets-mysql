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
