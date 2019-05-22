# readme

```shell
$ cat ~/docker/percona/cnf/my.cnf
[mysqld]
server-id=1
binlog_format=ROW
log-bin=mysql-bin
```

```shell
docker run --name masterdb \
    -v ~/docker/percona/cnf:/etc/my.cnf.d \
    -v ~/docker/percona/data:/var/lib/mysql \
    -v ~/docker/percona/log:/var/log/mysql \
    -p 33306:3306\
    -e MYSQL_ROOT_PASSWORD=root -d percona
```
```shell
mysqlbinlog --base64-output=decode-rows --verbose mysql-bin.000003
```

其中有如下的信息，确实是一行一行的

```txt
BEGIN
/*!*/;
# at 1610
#190521 22:04:58 server id 1  end_log_pos 1667 CRC32 0x580dac22 	Table_map: `cool_db`.`cool_table` mapped to number 108
# at 1667
#190521 22:04:58 server id 1  end_log_pos 1720 CRC32 0xd25d9f97 	Delete_rows: table id 108 flags: STMT_END_F
### DELETE FROM `cool_db`.`cool_table`
### WHERE
###   @1=1
###   @2=1
### DELETE FROM `cool_db`.`cool_table`
### WHERE
###   @1=2
###   @2=2
# at 1720
#190521 22:04:58 server id 1  end_log_pos 1751 CRC32 0x532b0231 	Xid = 14
COMMIT/*!*/;
```

- [MySQL的binlog日志 - 马丁传奇 - 博客园](https://www.cnblogs.com/martinzhang/p/3454358.html)
- [Docker MySQL Replication 101 - Percona Database Performance Blog](https://www.percona.com/blog/2016/03/30/docker-mysql-replication-101/)
- [15 mysqlbinlog Command Examples for MySQL Binary Log Files](https://www.thegeekstuff.com/2017/08/mysqlbinlog-examples/)