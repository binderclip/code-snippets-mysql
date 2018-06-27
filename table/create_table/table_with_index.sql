CREATE TABLE foo_index
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    a INT(10),
    b INT(10)NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_a` (`a`),
    INDEX `idx_b` (`b`),
    INDEX `idx_a_b` (`a`, `b`)
);
INSERT INTO foo_index (a, b)
    VALUES (null, 1), (null, 2), (null, 2), (3, 3), (4, 4);
