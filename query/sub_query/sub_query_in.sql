SELECT order_num FROM OrderItems WHERE prod_id='RGAN01';
SELECT cust_id FROM Orders WHERE order_num IN (20007, 20008);
SELECT * FROM Customers WHERE cust_id IN (1000000004, 1000000005);

SELECT * FROM Customers WHERE cust_id IN (
    SELECT cust_id FROM Orders WHERE order_num IN (20007, 20008)
);

SELECT * FROM Customers WHERE cust_id IN (
    SELECT cust_id FROM Orders WHERE order_num IN (
        SELECT order_num FROM OrderItems WHERE prod_id='RGAN01'
    )
);
