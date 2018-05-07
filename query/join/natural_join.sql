SELECT C.*, O.order_num, O.order_date, OI.prod_id, OI.quantity, OI.item_price
FROM Customers AS C, Orders AS O, OrderItems AS OI
WHERE C.cust_id = O.cust_id
 AND OI.order_num = O.order_num
 AND prod_id = 'RGAN01';

SELECT *
FROM Customers AS C, Orders AS O, OrderItems AS OI
WHERE C.cust_id = O.cust_id
 AND OI.order_num = O.order_num
 AND prod_id = 'RGAN01';

SELECT *
FROM Customers
 NATURAL JOIN Orders
  NATURAL JOIN OrderItems
WHERE prod_id = 'RGAN01';

-- 得到的结果一样的 INNER JOIN
SELECT *
FROM Customers
 INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
  INNER JOIN OrderItems ON Orders.order_num = OrderItems.order_num
WHERE prod_id = 'RGAN01';

-- 会得到奇怪结果的 INNER JOIN
SELECT *
FROM Customers
 INNER JOIN Orders
  INNER JOIN OrderItems
WHERE prod_id = 'RGAN01';
