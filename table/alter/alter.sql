ALTER TABLE Vendors ADD vend_phone CHAR(20);
ALTER TABLE Vendors MODIFY vend_phone CHAR(40);
ALTER TABLE Vendors DROP COLUMN vend_phone;


-- index
ALTER TABLE Customers ADD PRIMARY KEY (cust_id);
ALTER TABLE foo_index ADD INDEX `idx_b_a` (`b`, `a`);
