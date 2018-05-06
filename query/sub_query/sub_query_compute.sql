SELECT count(*) AS orders FROM Orders WHERE cust_id = '1000000001';
SELECT cust_id, (
    SELECT count(*) FROM Orders WHERE cust_id=Customers.cust_id
) AS orders FROM Customers;
