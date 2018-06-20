# alter varchar to int

## create table

```sql
CREATE TABLE varchar_to_int
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    a VARCHAR(20),
    PRIMARY KEY (`id`)
);
```

## insert data

```sql
INSERT INTO varchar_to_int(
    a
) VALUES (
    "10",
), (
    "11",
);
```

## alter

```sql
ALTER TABLE varchar_to_int MODIFY a INT(10) NOT NULL;
```

## conclusion

it's ok
