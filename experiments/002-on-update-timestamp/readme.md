# on update timestamp

## create table

``` sql
CREATE TABLE test_on_update
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    t CHAR(100) NOT NULL,
    `_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);
```

## insert test data

```sql
INSERT INTO test_on_update(
    t
) VALUES (
    "a"
), (
    "b"
);
```

## update data

```sql
UPDATE test_on_update SET t = 'aa' WHERE id = 1;
```

_updated_at updated
