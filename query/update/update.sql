UPDATE foo SET bar = bar + 1;

UPDATE foo SET bar = bar - 1 WHERE bar > 1;

UPDATE recipe_feed SET
    read=0
WHERE
    user_id=55555 AND author_id=55555 AND recipe_id=1111111;

UPDATE Customers SET cust_email = 'kim@thetoystore.com' WHERE cust_id = '1000000005';

UPDATE Customers SET
    cust_contact = 'Sam Roberts',
    cust_email = 'sam@toyland.com'
WHERE
    cust_id = '1000000006';

UPDATE Customers
    SET cust_email = NULL
WHERE
    cust_id = '1000000005';


-- bit update
UPDATE users SET permission = permission | 16;
-- https://stackoverflow.com/questions/12928736/update-specific-bit-in-integer-column
