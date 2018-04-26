SELECT 'David!' LIKE 'David_';
-- 1
SELECT 'David!' LIKE 'David__';
-- 0
SELECT 'David!' LIKE '%Dav%';
-- 1
