INSERT INTO Customers2(
    cust_id,
    cust_contact,
    cust_email,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country
) SELECT
    cust_id,
    cust_contact,
    cust_email,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country FROM Customers;

-- https://stackoverflow.com/questions/25969/insert-into-values-select-from/26080#26080
