/* 简单的 select */
DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT *  FROM Products;
END //
DELIMITER ;

CALL GetAllProducts();


/* 带有 IN 参数的例子 */
DELIMITER //
CREATE PROCEDURE CustInCountry (IN country CHAR(50))
BEGIN
    SELECT *
    FROM Customers
    WHERE cust_country = country;
END //
DELIMITER ;

CALL CustInCountry('USA');


/* 带有 OUT 参数的例子 */
DELIMITER //
CREATE PROCEDURE MailingListCount (OUT list_count INTEGER)
BEGIN
    SELECT COUNT(*) INTO list_count
    FROM Customers
    WHERE NOT cust_email IS NULL;
END //
DELIMITER ;

CALL MailingListCount(@list_count);
SELECT @list_count;
