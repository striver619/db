#!/bin/bash

func_sql_bakup(){
    find /data/dbbackup -type f -mtime +15 -name "*.gz" -exec rm -rf {} \;
    mysqldump -uroot -p'jat$12345789' mdplatform |gzip > /data/dbbackup/mdplatform_$(date +%F_%H%M%S).sql.gz
}

func_sql_bakup

#备份数据库
#可以在root权限下使用mysqldump命令备份数据库。

#备份主机为192.168.1.10，端口为3306，root用户下的所有数据库到alldb.sql中。
# mysqldump -h 192.168.1.10 -P 3306 -uroot -p123456 --all-databases > alldb.sql

#备份主机为192.168.1.10，端口为3306，root用户下的db1数据库到db1.sql中。
# mysqldump -h 192.168.1.10 -P 3306 -uroot -p123456 --databases db1 > db1.sql

#备份主机为192.168.1.10，端口为3306，root用户下的db1数据库的tb1表到db1tb1.sql中。
# mysqldump -h 192.168.1.10 -P 3306 -uroot -p123456 db1 tb1 > db1tb1.sql

#只备份主机为192.168.1.10，端口为3306，root用户下的db1数据库的表结构到db1.sql中。
# mysqldump -h 192.168.1.10 -P 3306 -uroot -p123456 -d db1 > db1.sql

#只备份主机为192.168.1.10，端口为3306，root用户下的db1数据库的数据到db1.sql中。
# mysqldump -h 192.168.1.10 -P 3306 -uroot -p123456 -t db1 > db1.sql

#恢复数据库
#可以在root权限下使用mysql命令恢复数据库。

#恢复数据库。

# mysql -h 192.168.1.10 -P 3306 -uroot -p123456 -t db1 < db1.sql
