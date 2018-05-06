SELECT
    COUNT(*), foo.bar
FROM
    foo
GROUP BY bar;

SELECT * FROM foo3 GROUP BY b;  -- 只显示某个 group 的第一条数据
SELECT * FROM foo3 GROUP BY c;
SELECT id, b, COUNT(*) FROM foo3 GROUP BY b;
SELECT id, b, COUNT(*) FROM foo3 GROUP BY b ORDER BY b DESC;

SELECT b, c, COUNT(*) FROM foo3 GROUP BY b, c;
