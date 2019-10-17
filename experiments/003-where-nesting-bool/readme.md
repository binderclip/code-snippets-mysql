# where nesting bool

```sql
CREATE TABLE tb
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    foo INT(10) UNSIGNED NOT NULL,
    bar INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO tb (foo, bar)
    VALUES (1, 1), (1, 2), (2, 1), (2, 2), (3, 1), (3, 2), (4, 1), (4, 2);

select * from tb
where
  (foo = 1 AND bar > 1) OR
  (foo = 2 AND bar < 2);
```

发现是可以嵌套查询的
