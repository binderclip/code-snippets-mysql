INSERT INTO foo2 (k, v)
    VALUES (4, 4)
    ON DUPLICATE KEY UPDATE
    k=VALUES(k),v=VALUES(v);

-- batch

INSERT INTO foo2 (k, v)
    VALUES (1, 1), (2, 2), (3, 3)
    ON DUPLICATE KEY UPDATE
    k=VALUES(k),v=VALUES(v);
