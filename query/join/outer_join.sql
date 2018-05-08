SELECT *
FROM Customers
 LEFT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;

SELECT *
FROM Customers
 RIGHT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;

SELECT *
FROM Orders
 RIGHT OUTER JOIN Customers ON Customers.cust_id = Orders.cust_id;
