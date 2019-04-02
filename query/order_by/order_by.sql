SELECT * FROM foo3 ORDER BY c;

SELECT * FROM foo3 ORDER BY b, c;

SELECT * FROM foo3 ORDER BY b DESC, c;

SELECT * FROM foo3 ORDER BY b DESC, c DESC;

SELECT id, a, b FROM foo3 ORDER BY c, 3 DESC;

-- 优先按 order_item 排，order_item 相同的时候按照 order_num
SELECT order_num, order_item FROM OrderItems ORDER BY order_item, order_num;
-- 与上一条相反
SELECT order_num, order_item FROM OrderItems ORDER BY order_num, order_item;

-- foo4 的 e 列中含有 NULL 数据，排列的时候如果是正序排，会被排到前面，倒序排会被排到后面
SELECT * FROM foo4 ORDER BY e;


/* === order by field === */
CREATE TABLE yourtable
    (`id` int,
     `n` int
    );
INSERT INTO yourtable
    (`id`, `n`)
VALUES
    (1, 5),
    (2, 10),
    (3, 12);

SELECT * FROM yourtable WHERE id IN (3,1,2)
ORDER BY FIELD(id,3,1,2)
-- https://stackoverflow.com/questions/3799935/mysql-select-where-in-given-order
