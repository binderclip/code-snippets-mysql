CREATE TABLE foo
(
    bar TINYINT(3)
);

CREATE TABLE foo2
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    k INT(10) UNSIGNED NOT NULL,
    v INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_k` (`k`)
);

CREATE TABLE foo3
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    a INT(10) UNSIGNED NOT NULL,
    b INT(10) UNSIGNED NOT NULL,
    c INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);
INSERT INTO foo3 (a, b, c)
    VALUES (1, 1, 1), (1, 1, 2), (1, 2, 1), (1, 2, 2);
