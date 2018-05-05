# MySQL Methods

## count

### count(*)

- 统计表中所有的行数
- 不管其中某行的某个字段是不是有 NULL

### count(column)

- 按某一列统计，统计这一列中非 NULL 的行数

### count(num)

- count(0)、count(1)、count(100) 效果都是一样的
- 其中的数字并不是 column 的位置
- 其中的数字类似 `select 1 from foo` 一样，每一行都会对应到 1
- 在数据库内部实现不够优化的时候这样可以不用像 count(*) 那样拷贝整行的数据，不过现在一般是没差的

## refs

- [What is the difference between count(0), count(1).. and count(*) in mySQL/SQL? - Stack Overflow](https://stackoverflow.com/questions/18291036/what-is-the-difference-between-count0-count1-and-count-in-mysql-sql/18291041)
- [MySQL :: MySQL 8.0 Reference Manual :: 12.19.1 Aggregate (GROUP BY) Function Descriptions](https://dev.mysql.com/doc/refman/8.0/en/group-by-functions.html#function_count)
