ALTER TABLE Vendors ADD vend_phone CHAR(20);
ALTER TABLE Vendors MODIFY vend_phone CHAR(40);
ALTER TABLE Vendors DROP COLUMN vend_phone;
