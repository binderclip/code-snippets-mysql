/* view 中包含联结 */
CREATE VIEW ProductCustomers AS
SELECT cust_name, cust_contact, prod_id
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
 AND OrderItems.order_num = Orders.order_num;

SELECT cust_name, cust_contact
FROM ProductCustomers
WHERE prod_id = 'RGAN01';


/* view 中包含数据重新格式化或计算 */
CREATE VIEW VendorLocations AS
SELECT Concat(RTRIM(vend_name), ' (', RTRIM(vend_country), ')') AS vend_title
FROM Vendors ORDER BY vend_name;

SELECT * FROM VendorLocations;

CREATE VIEW OrderItemsExpanded AS
SELECT order_num, prod_id, quantity, item_price, quantity * item_price AS expanded_price
FROM OrderItems;

SELECT * FROM OrderItemsExpanded
WHERE order_num = 20008;


/* view 中包含数据过滤 */
CREATE VIEW CustomerEMailList AS
SELECT cust_id, cust_name, cust_email
FROM Customers
WHERE cust_email IS NOT NULL;

SELECT * FROM CustomerEMailList;
