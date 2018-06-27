# use pt-online-schema-change

## info

```text
host=devdb
user=root
db=clip_test
table=clip_test_foo3
```

```sql
CREATE TABLE clip_test_foo3
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    a INT(10) UNSIGNED NOT NULL,
    b INT(10) UNSIGNED NOT NULL,
    c INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);
```

```shell
pt-online-schema-change \
    --execute \
    --ask-pass \
    --recursion-method none \
    --set-vars lock_wait_timeout=3 \
    --alter 'ADD INDEX `idx_a_field` (`a_filed`)' \
    u=<user>,h=<host>,D=<database>,t=<table>
```

## add line

```text
ADD d INT(10) unsigned NOT NULL     -- 命令可以执行，但是没有默认值的数据在拷贝的过程中会失败
ADD d int(10) unsigned NOT NULL DEFUALT 0       -- 可以设置默认值来解决
ADD f blob      -- blob 不能设置 default 值，所以只能不要求 NOT NULL
ADD g varchar(255) NOT NULL DEFAULT ""
```

```shell
pt-online-schema-change \
    --execute \
    --ask-pass \
    --recursion-method none \
    --set-vars lock_wait_timeout=3 \
    --alter 'ADD g INT(10), ADD h INT(10)'\
    u=root,h=devdb,D=clip_test,t=clip_test_foo3
```

## change multi

```
ADD g INT(10), ADD h INT(10)
```

## modify type

```
MODIFY g varchar(127) NOT NULL
```

## index

```
DROP INDEX idx_user_id_status
ADD INDEX idx_user_id_status (user_id, status)
```

## refs

- [pt-online-schema-change](https://www.percona.com/doc/percona-toolkit/LATEST/pt-online-schema-change.html)
- [MySQL :: MySQL 8.0 Reference Manual :: 13.1.8 ALTER TABLE Syntax](https://dev.mysql.com/doc/refman/8.0/en/alter-table.html)
