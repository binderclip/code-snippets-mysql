SELECT vend_name, prod_id, prod_price FROM Vendors, Products WHERE Vendors.vend_id=Products.vend_id;

SELECT vend_name, prod_id, prod_price FROM Vendors, Products;    -- 叉联结 cross join

SELECT vend_name, prod_id, prod_price FROM Vendors INNER JOIN Products ON Vendors.vend_id=Products.vend_id;

SELECT prod_name, vend_name, prod_price, quantity FROM OrderItems, Products, Vendors WHERE Vendors.vend_id=Products.vend_id AND Products.prod_id=OrderItems.prod_id AND order_num=20007;

SELECT prod_name, vend_name, prod_price, quantity FROM OrderItems
    INNER JOIN Products ON OrderItems.prod_id=Products.prod_id
    INNER JOIN Vendors ON Products.vend_id=Vendors.vend_id
    WHERE order_num=20007;

SELECT order_date, order_num, prod_id, prod_name FROM Orders
    INNER JOIN OrderItems ON Orders.order_num=OrderItems.order_num
    INNER JOIN Products ON OrderItems.prod_id=Products.prod_id;
