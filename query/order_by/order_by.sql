SELECT * FROM foo3 ORDER BY c;

SELECT * FROM foo3 ORDER BY b, c;

SELECT * FROM foo3 ORDER BY b DESC, c;

SELECT * FROM foo3 ORDER BY b DESC, c DESC;

SELECT id, a, b FROM foo3 ORDER BY c, 3 DESC;

-- 优先按 order_item 排，order_item 相同的时候按照 order_num
SELECT order_num, order_item FROM OrderItems ORDER BY order_item, order_num;
-- 与上一条相反
SELECT order_num, order_item FROM OrderItems ORDER BY order_num, order_item;
