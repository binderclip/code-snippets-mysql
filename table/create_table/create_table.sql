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
INSERT INTO foo2 (id, k, v)
    VALUES (4, 2, 1), (5, 3, 2), (7, 4, 4), (8, 1, 1);

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

CREATE TABLE foo4
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    d INT(10) UNSIGNED,
    e INT(10) UNSIGNED,
    PRIMARY KEY (`id`)
);
INSERT INTO foo4 (d, e)
    VALUES (1, 11), (2, NULL), (3, 33), (4, NULL);


CREATE TABLE foo5
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    f INT(10) UNSIGNED,
    g CHAR(20),
    PRIMARY KEY (`id`)
);
INSERT INTO foo5 (f, g)
    VALUES (11, 'abcdef'), (12, 'bcdefg'), (13, 'cdefgh'), (14, 'defghi'),
           (15, 'Abcdef'), (16, 'bbdefg'), (17, 'bdefgh');


CREATE TABLE foo6
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    dt DATETIME,
    PRIMARY KEY (`id`)
);
INSERT INTO foo6 (dt)
    VALUES ('2018-05-05 00:00:00'), ('2018-05-25 00:00:00'),
           ('2018-05-01 00:00:00'), ('2018-01-05 00:00:00'),
           ('2025-05-05 00:00:00');


CREATE TABLE big_boss
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    f FLOAT(3,2),
    f2 FLOAT,
    PRIMARY KEY (`id`)
);
INSERT INTO big_boss (f)
    VALUES (1.1), (2.22);
INSERT INTO big_boss (f2)
    VALUES (1), (2.2), (3.33), (4.444), (5.5555), (6.66666), (7.777777), (8.8888888);
-- 发现精度只有 6 位有效数字

CREATE TABLE foo7
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    text CHAR(100) NOT NULL,
    `_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);
