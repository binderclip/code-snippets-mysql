SELECT 'David!' LIKE 'David_';
-- 1
SELECT 'David!' LIKE 'David__';
-- 0
SELECT 'David!' LIKE '%Dav%';
-- 1
SELECT 'David!' LIKE 'av%';
-- 0


SELECT * FROM foo5 WHERE g LIKE 'b%';
SELECT * FROM foo5 WHERE g LIKE '%b';
SELECT * FROM foo5 WHERE g LIKE '%b%';
SELECT * FROM foo5 WHERE g LIKE 'b%g';
SELECT * FROM foo5;
SELECT * FROM foo5 WHERE g LIKE '%';
SELECT * FROM foo5 WHERE g LIKE 'b_defg';
