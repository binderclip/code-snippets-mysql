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
