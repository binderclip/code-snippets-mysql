/* 按表中字段的顺序插入 */
INSERT INTO Customers VALUES(
    '1000000006',
    'Toy Land',
    '123 Any Street',
    'New York',
    'NY',
    '11111',
    'USA',
    NULL,
    NULL
);

/* 指明 key，可以和表中的顺序不一致 */
INSERT INTO Customers(
    cust_id,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country,
    cust_contact,
    cust_email
) VALUES(
    '1000000006',
    'Toy Land',
    '123 Any Street',
    'New York',
    'NY',
    '11111',
    'USA',
    NULL,
    NULL
);

/* 指明 key 之后可以只设置部分的值 */
INSERT INTO Customers(
    cust_id,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country
) VALUES(
    '1000000006',
    'Toy Land',
    '123 Any Street',
    'New York',
    'NY',
    '11111',
    'USA'
);

-- insert multi
INSERT INTO Customers(
    cust_id,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country
) VALUES(
    '1000000006',
    'Toy Land',
    '123 Any Street',
    'New York',
    'NY',
    '11111',
    'USA'
), (
    '1000000007',
    'Land Toy',
    '123 Foo Street',
    'New York',
    'NY',
    '11111',
    'USA'
);
