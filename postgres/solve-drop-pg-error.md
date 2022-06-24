[postgresql数据库删除时提示回话 sessions using the database](https://www.cnblogs.com/hellojesson/p/10037315.html)

数据库命令行或者管理工具中执行删除数据库的命令，

```
DROP DATABASE testdb;
```
的时候，可能会提示：

```
ERROR:  database "testdb" is being accessed by other users
DETAIL:  There are 3 other sessions using the database.
```

这个意思是说

删除数据库失败，因为这里还有3个链接连接到该数据库上，

PostgreSQL在有进程连接到数据库时，对应的数据库是不运行被删除的。

那么怎么办呢？

解决方式：断开连接到这个数据库上的所有链接，再删除数据库。

怎么断开呢？在PostgreSQL 9.2 及以上版本，执行下面的语句：

```
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE datname='testdb' AND pid<>pg_backend_pid(); 
```

-- 注：testdb 替换成自己的数据库

执行上面的语句之后，在执行DROP操作，就可以删除数据库了。

上面语句说明：

pg_terminate_backend：用来终止与数据库的连接的进程id的函数。

pg_stat_activity：是一个系统表，用于存储服务进程的属性和状态。

pg_backend_pid()：是一个系统函数，获取附加到当前会话的服务器进程的ID。


