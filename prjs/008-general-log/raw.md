# raw
## percona

```shell
$ cat ~/docker/percona2/cnf/my.cnf
[mysqld]
server-id=1
binlog_format=ROW
log-bin=mysql-bin
general_log=1
```

```shell
docker run --name testdb2 \
    -v ~/docker/percona2/cnf:/etc/my.cnf.d \
    -v ~/docker/percona2/data:/var/lib/mysql \
    -v ~/docker/percona2/log:/var/log/mysql \
    -p 33306:3306\
    -e MYSQL_ROOT_PASSWORD=rootpw -d percona:5.7
```

```
mysql -h localhost -P 33306 -u root --protocol=tcp -p
```

```
create database testdb;
use testdb;
```

```
CREATE TABLE tb
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    foo INT(10) UNSIGNED NOT NULL,
    bar INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO tb (foo, bar)
    VALUES (1, 1), (1, 2), (2, 1), (2, 2), (3, 1), (3, 2), (4, 1), (4, 2);

select * from tb;
```

```
show global variables like "general_log%";
```
[How to enable general and slow query logging? - MySQL & MariaDB / Other MySQL® Questions - Percona Community Forum](https://forums.percona.com/t/how-to-enable-general-and-slow-query-logging/7736)

```
show session variables like 'autocommit';
set session autocommit=0;
```

```
mysql> INSERT INTO tb (foo, bar) VALUES (10, 10);
Query OK, 1 row affected (0.01 sec)

mysql> select * from tb;
+----+-----+-----+
| id | foo | bar |
+----+-----+-----+
|  1 |   1 |   1 |
|  2 |   1 |   2 |
|  3 |   2 |   1 |
|  4 |   2 |   2 |
|  5 |   3 |   1 |
|  6 |   3 |   2 |
|  7 |   4 |   1 |
|  8 |   4 |   2 |
|  9 |  10 |  10 |
+----+-----+-----+
9 rows in set (0.01 sec)

mysql> rollback;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from tb;
+----+-----+-----+
| id | foo | bar |
+----+-----+-----+
|  1 |   1 |   1 |
|  2 |   1 |   2 |
|  3 |   2 |   1 |
|  4 |   2 |   2 |
|  5 |   3 |   1 |
|  6 |   3 |   2 |
|  7 |   4 |   1 |
|  8 |   4 |   2 |
+----+-----+-----+
8 rows in set (0.00 sec)
```

```
mysql> INSERT INTO tb (foo, bar) VALUES (10, 10);
Query OK, 1 row affected (0.00 sec)

mysql> select * from tb;
+----+-----+-----+
| id | foo | bar |
+----+-----+-----+
|  1 |   1 |   1 |
|  2 |   1 |   2 |
|  3 |   2 |   1 |
|  4 |   2 |   2 |
|  5 |   3 |   1 |
|  6 |   3 |   2 |
|  7 |   4 |   1 |
|  8 |   4 |   2 |
| 10 |  10 |  10 |
+----+-----+-----+
9 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from tb;
+----+-----+-----+
| id | foo | bar |
+----+-----+-----+
|  1 |   1 |   1 |
|  2 |   1 |   2 |
|  3 |   2 |   1 |
|  4 |   2 |   2 |
|  5 |   3 |   1 |
|  6 |   3 |   2 |
|  7 |   4 |   1 |
|  8 |   4 |   2 |
| 10 |  10 |  10 |
+----+-----+-----+
9 rows in set (0.01 sec)
```

```
2021-12-28T09:44:49.289912Z	    3 Query	INSERT INTO tb (foo, bar) VALUES (10, 10)
2021-12-28T09:45:05.855438Z	    3 Query	select * from tb
2021-12-28T09:45:10.890653Z	    3 Query	rollback
2021-12-28T09:45:13.737020Z	    3 Query	select * from tb
2021-12-28T09:45:35.127947Z	    3 Query	INSERT INTO tb (foo, bar) VALUES (10, 10)
2021-12-28T09:45:38.500408Z	    3 Query	select * from tb
2021-12-28T09:45:44.196328Z	    3 Query	commit
2021-12-28T09:45:48.898409Z	    3 Query	select * from tb
```

```
2021-12-28T09:54:08.455742Z	    4 Connect	root@_gateway on testdb using TCP/IP
2021-12-28T09:54:08.458770Z	    4 Query	SET NAMES utf8mb4
2021-12-28T09:54:08.460956Z	    4 Query	SELECT VERSION()
2021-12-28T09:54:08.464856Z	    4 Query	START TRANSACTION
2021-12-28T09:54:08.469397Z	    4 Prepare	INSERT INTO `tb` (`foo`,`bar`) VALUES (?,?)
2021-12-28T09:54:08.470477Z	    4 Execute	INSERT INTO `tb` (`foo`,`bar`) VALUES (11,12)
2021-12-28T09:54:08.473032Z	    4 Close stmt	
2021-12-28T09:54:08.473917Z	    4 Query	COMMIT
```

```
2021-12-28T09:57:29.397647Z	    5 Connect	root@_gateway on testdb using TCP/IP
2021-12-28T09:57:29.400111Z	    5 Query	SET NAMES utf8mb4
2021-12-28T09:57:29.402340Z	    5 Query	SELECT VERSION()
2021-12-28T09:57:29.407126Z	    5 Prepare	INSERT INTO `tb` (`foo`,`bar`) VALUES (?,?)
2021-12-28T09:57:29.408239Z	    5 Execute	INSERT INTO `tb` (`foo`,`bar`) VALUES (12,12)
2021-12-28T09:57:29.412619Z	    5 Close stmt	
```

```
2021-12-28T09:58:38.806957Z	    6 Connect	root@_gateway on testdb using TCP/IP
2021-12-28T09:58:38.810069Z	    6 Query	SET NAMES utf8mb4
2021-12-28T09:58:38.812943Z	    6 Query	SELECT VERSION()
2021-12-28T09:58:38.819765Z	    6 Prepare	INSERT INTO `tb` (`foo`,`bar`) VALUES (?,?)
2021-12-28T09:58:38.821048Z	    6 Execute	INSERT INTO `tb` (`foo`,`bar`) VALUES (12,12)
2021-12-28T09:58:38.825598Z	    6 Close stmt	
2021-12-28T09:58:38.827141Z	    6 Prepare	INSERT INTO `tb` (`foo`,`bar`) VALUES (?,?)
2021-12-28T09:58:38.828369Z	    6 Execute	INSERT INTO `tb` (`foo`,`bar`) VALUES (13,13)
2021-12-28T09:58:38.833784Z	    6 Close stmt	
```

## mysql

```shell
$ cat ~/docker/mysql2/cnf/my.cnf
[mysqld]
server-id=1
binlog_format=ROW
log-bin=mysql-bin
general_log=1
```

```shell
docker run --name testdb3 \
    -v ~/docker/mysql2/cnf:/etc/mysql/conf.d \
    -v ~/docker/mysql2/data:/var/lib/mysql \
    -v ~/docker/mysql2/log:/var/log/mysql \
    -p 23306:3306\
    -e MYSQL_ROOT_PASSWORD=rootpw -d mysql:5.7
```

```
mysql -h localhost -P 23306 -u root --protocol=tcp -p
```

```
create database testdb;
use testdb;
```

```
CREATE TABLE tb
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    foo INT(10) UNSIGNED NOT NULL,
    bar INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO tb (foo, bar)
    VALUES (1, 1), (1, 2), (2, 1), (2, 2), (3, 1), (3, 2), (4, 1), (4, 2);

select * from tb;
```

```
show global variables like "general_log%";
```
[How to enable general and slow query logging? - MySQL & MariaDB / Other MySQL® Questions - Percona Community Forum](https://forums.percona.com/t/how-to-enable-general-and-slow-query-logging/7736)

```
2021-12-28T10:36:04.388318Z	    2 Connect	root@172.17.0.1 on  using SSL/TLS
2021-12-28T10:36:04.390835Z	    2 Query	select @@version_comment limit 1
2021-12-28T10:37:26.769185Z	    2 Query	create database testdb
2021-12-28T10:37:26.782893Z	    2 Query	SELECT DATABASE()
2021-12-28T10:37:26.785511Z	    2 Init DB	testdb
2021-12-28T10:37:26.789069Z	    2 Query	show databases
2021-12-28T10:37:26.812233Z	    2 Query	show tables
2021-12-28T10:37:41.363158Z	    2 Query	CREATE TABLE tb
(
    id INT(10) UNSIGNED NOT NULL auto_increment,
    foo INT(10) UNSIGNED NOT NULL,
    bar INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
)
2021-12-28T10:37:45.669787Z	    2 Query	INSERT INTO tb (foo, bar)
    VALUES (1, 1), (1, 2), (2, 1), (2, 2), (3, 1), (3, 2), (4, 1), (4, 2)
2021-12-28T10:37:50.955884Z	    2 Query	select * from tb
2021-12-28T10:39:04.245978Z	    2 Query	show global variables like "general_log%"
2021-12-28T10:39:11.012297Z	    2 Query	show session variables like 'autocommit'
2021-12-28T10:39:11.017846Z	    2 Query	set session autocommit=0
2021-12-28T10:39:16.381543Z	    2 Query	INSERT INTO tb (foo, bar) VALUES (10, 10)
2021-12-28T10:39:21.694702Z	    2 Query	select * from tb
2021-12-28T10:39:26.072874Z	    2 Query	rollback
2021-12-28T10:39:30.513866Z	    2 Query	select * from tb
2021-12-28T10:39:38.580491Z	    2 Query	INSERT INTO tb (foo, bar) VALUES (10, 10)
2021-12-28T10:39:42.798332Z	    2 Query	select * from tb
2021-12-28T10:39:49.975939Z	    2 Query	commit
2021-12-28T10:39:53.679582Z	    2 Query	select * from tb
```

```
2021-12-28T10:40:50.256871Z	    3 Connect	root@172.17.0.1 on testdb using TCP/IP
2021-12-28T10:40:50.259791Z	    3 Query	SET NAMES utf8mb4
2021-12-28T10:40:50.262211Z	    3 Query	SELECT VERSION()
2021-12-28T10:40:50.268231Z	    3 Query	START TRANSACTION
2021-12-28T10:40:50.275273Z	    3 Prepare	INSERT INTO `tb` (`foo`,`bar`) VALUES (?,?)
2021-12-28T10:40:50.276976Z	    3 Execute	INSERT INTO `tb` (`foo`,`bar`) VALUES (11,12)
2021-12-28T10:40:50.279927Z	    3 Close stmt	
2021-12-28T10:40:50.281175Z	    3 Query	COMMIT
```

```
2021-12-28T10:41:40.274366Z	    4 Connect	root@172.17.0.1 on testdb using TCP/IP
2021-12-28T10:41:40.277892Z	    4 Query	SET NAMES utf8mb4
2021-12-28T10:41:40.280397Z	    4 Query	SELECT VERSION()
2021-12-28T10:41:40.285608Z	    4 Prepare	INSERT INTO `tb` (`foo`,`bar`) VALUES (?,?)
2021-12-28T10:41:40.286662Z	    4 Execute	INSERT INTO `tb` (`foo`,`bar`) VALUES (12,12)
2021-12-28T10:41:40.291289Z	    4 Close stmt	
2021-12-28T10:41:40.292653Z	    4 Prepare	INSERT INTO `tb` (`foo`,`bar`) VALUES (?,?)
2021-12-28T10:41:40.294196Z	    4 Execute	INSERT INTO `tb` (`foo`,`bar`) VALUES (13,13)
2021-12-28T10:41:40.298812Z	    4 Close stmt	
```
