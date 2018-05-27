SELECT cust_name, cust_contact, cust_email, cust_state
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email, cust_state
FROM Customers
WHERE cust_name = 'Fun4ALL';

/* 与上面的等效的 WHERE 查询 */
SELECT cust_name, cust_contact, cust_email, cust_state
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
 OR cust_name = 'Fun4ALL';

/* UNION ALL 是 WHERE 所完成不了的 */
SELECT cust_name, cust_contact, cust_email, cust_state
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION ALL
SELECT cust_name, cust_contact, cust_email, cust_state
FROM Customers
WHERE cust_name = 'Fun4ALL';

/* UNION with order by */
SELECT cust_name, cust_contact, cust_email, cust_state
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email, cust_state
FROM Customers
WHERE cust_name = 'Fun4ALL'
ORDER BY cust_name, cust_contact;
