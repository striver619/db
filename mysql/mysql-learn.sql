select version();
# 5.7.35

show databases ;

use dblearn;

show tables;

create table tb_learn_1(
    id int,
    name varchar(100),
    job varchar(100)
);

show create table tb_learn_1;

CREATE TABLE `tb_learn_1` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

desc dblearn.tb_learn_1;

select * from dblearn.tb_learn_1;

insert into dblearn.tb_learn_1(id, name, job) VALUE (20221001, '张三', '数仓工程师');

insert into dblearn.tb_learn_1(id, name, job) VALUE (20221002, '李四', '大数据工程师'),(20221003, '王五', 'BI工程师'),(20221004, '马六', '项目经理');

update dblearn.tb_learn_1 set name='王老五' where name='王五';

select * from dblearn.tb_learn_1;

delete from dblearn.tb_learn_1 where id=20221002;

truncate dblearn.tb_learn_1;

select version();

# 查看MySQL运行多长时间
SHOW GLOBAL STATUS LIKE 'UPTIME';

# 查看MySQL连接超时
SHOW GLOBAL VARIABLES LIKE '%TIMEOUT';

show tables;

desc dblearn.tb_learn_1;

select *
from dblearn.tb_learn_1;

create table if not exists `qc_tb1`(
    `id` int unsigned auto_increment,
    `name` varchar(100) not null,
    `job` varchar(200) not null,
    `date` date,
    primary key (`id`)
)engine=InnoDB default charset=utf8;

show table status ;

show create table qc_tb1;

/*
CREATE TABLE `qc_tb1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `job` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
 */

insert into qc_tb1 (id, name, job, date)
values (1001, '张三', '数仓工程师', '2022-11-03');

select *
from qc_tb1;

insert into qc_tb1 (name, job, date)
values ('李四', 'BI工程师', '2022-11-03'),
       ('马六', '大数据架构师', '2022-11-03'),
       ('陈七', '技术总监', '2022-11-03')
;

insert into qc_tb1 (name, job, date)
values ('李小东', 'BI工程师', '2022-11-02'),
       ('马小南', '数仓工程师', '2022-11-02'),
       ('陈小北', '运维工程师', '2022-11-02'),
       ('刘小七', '数仓工程师', '2022-11-02')
;

desc qc_tb1;

select
    id,
    name,
    job,
    date
from qc_tb1;

select count(*) from qc_tb1;

select id,
    name,
    job,
    date
from qc_tb1
where id=1001;

select *
from qc_tb1
where id<1003 and date='2022-11-03';

select *
from qc_tb1
where id<1003 or date='2022-11-03';

select count(*)
from qc_tb1
where job='数仓工程师';

select *
from qc_tb1
where job='数仓工程师'
order by id desc;

select *
from qc_tb1
where job='BI工程师'
order by id desc;

update qc_tb1
set job='数仓工程师'
where id=1002;

select *
from qc_tb1;

delete from qc_tb1
where id=1010;

select *
from qc_tb1
where name like '%李%';

select *
from dblearn.tb_learn_1
order by id;

desc dblearn.tb_learn_1;

insert into
dblearn.tb_learn_1(id, name, job)
VALUES (1101, '小红', '运营'),
       (1103, '小黄', '人事'),
       (1104, '小蓝', '行政'),
       (1102, '小紫', '财务')
;

select *
from qc_tb1
order by job;

select *
from dblearn.tb_learn_1
order by id;

select *
from (select name,job
      from qc_tb1
      where job='数仓工程师') as a
union all
select *
from (select name,job
      from dblearn.tb_learn_1
     where job='运营') as b
;


insert into
dblearn.tb_learn_1(id, name, job)
values (1106, '小橙', '数仓工程师')

select *
from dblearn.tb_learn_1
where id=1106;


select *
from (select job, name
      from qc_tb1
      where job='数仓工程师') as a
union
select *
from (select job, name
      from dblearn.tb_learn_1
     where job='数仓工程师') as b
;


select *
from (select job
      from qc_tb1) as a
union
select *
from (select job
      from dblearn.tb_learn_1) as b
;

select *
from (select job,name
      from qc_tb1
      where job='数仓工程师'
      order by job) as a
union all
select *
from (select job,name
      from dblearn.tb_learn_1
      where job='数仓工程师') as b
;

select *
from qc_tb1
order by date desc ;

update qc_tb1
set date='2022-10-31'
where id in (1009,1013);

drop table if exists emp_tb1;
create table emp_tb1 (
    id int(11) not null ,
    name varchar(20) not null default '',
    date datetime not null ,
    signin int(4) not null default '0' comment '登录次数',
    primary key (id)
)engine = innodb default charset = utf8;

desc emp_tb1;

delete from emp_tb1 where id in (1,2,3,4,5,6);

insert into emp_tb1
values (7, '小明', '2022-11-01 16:16:20', 30),
       (8, '小李', '2022-10-05 16:36:21', 15),
#        (3, '小刘', '2022-10-02 16:26:21', 3),
       (9, '小明', '2022-11-03 16:36:27', 36),
#        (5, '小李', '2022-10-03 16:06:40', 1),
       (10, '小刘', '2022-11-06 16:36:54', 27)
;

update emp_tb1
set date='2022-11-05 16:46:21'
where id=8

select *
from emp_tb1;

select date_format(date,'%Y-%m-%d') date
from emp_tb1;

select
    id,
    name,
    date_format(date,'%Y-%m-%d') date,
    signin
from emp_tb1
order by signin;

select name,count(*)
from emp_tb1
group by name;

select count(*) from emp_tb1;

delete from emp_tb1 where id=6;

select
    name,
    sum(signin) as signin_count
from
emp_tb1
group by name with rollup;

select
    coalesce(name, '总数') as total,
    sum(signin) as signin_count
from emp_tb1
group by name with rollup ;


-- ----------------------------
--  Table structure for `runoob_tbl`
-- ----------------------------
DROP TABLE IF EXISTS `runoob_tbl`;
CREATE TABLE `runoob_tbl` (
  `runoob_id` int(11) NOT NULL AUTO_INCREMENT,
  `runoob_title` varchar(100) NOT NULL,
  `runoob_author` varchar(40) NOT NULL,
  `submission_date` date DEFAULT NULL,
  PRIMARY KEY (`runoob_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `runoob_tbl`
-- ----------------------------
BEGIN;
INSERT INTO `runoob_tbl` VALUES ('1', '学习 PHP', '菜鸟教程', '2017-04-12'), ('2', '学习 MySQL', '菜鸟教程', '2017-04-12'), ('3', '学习 Java', 'RUNOOB.COM', '2015-05-01'), ('4', '学习 Python', 'RUNOOB.COM', '2016-03-06'), ('5', '学习 C', 'FK', '2017-04-05');
COMMIT;

-- ----------------------------
--  Table structure for `tcount_tbl`
-- ----------------------------
DROP TABLE IF EXISTS `tcount_tbl`;
CREATE TABLE `tcount_tbl` (
  `runoob_author` varchar(255) NOT NULL DEFAULT '',
  `runoob_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tcount_tbl`
-- ----------------------------
BEGIN;
INSERT INTO `tcount_tbl` VALUES ('菜鸟教程', '10'), ('RUNOOB.COM ', '20'), ('Google', '22');
COMMIT;

select * from runoob_tbl;
select * from tcount_tbl;

select
    a.runoob_id,
    a.runoob_author,
    b.runoob_count
from runoob_tbl a
inner join
tcount_tbl b
on a.runoob_author=b.runoob_author;

select
    a.runoob_id,
    a.runoob_author,
    b.runoob_count
from
runoob_tbl a,
tcount_tbl b
where a.runoob_author=b.runoob_author;

select
    a.runoob_id,
    a.runoob_author,
    b.runoob_count
from
runoob_tbl a
left join
tcount_tbl b
on a.runoob_author=b.runoob_author;

select
    a.runoob_id,
    a.runoob_author,
    b.runoob_count
from
runoob_tbl a
right join
tcount_tbl b
on a.runoob_author=b.runoob_author;


create table runoob_test_tbl
(
    runoob_author varchar(40) NOT NULL,
    runoob_count  INT
);

insert into runoob_test_tbl(runoob_author, runoob_count)
values ('RUNOOB', 20),
       ('菜鸟教程', NULL),
       ('Google', NULL),
       ('FK', 20)
;

select * from runoob_test_tbl;

select * from runoob_test_tbl where runoob_count is not NULL;

select * from qc_tb1 where name regexp '^陈';

select * from qc_tb1 where name regexp '六$';

select * from qc_tb1 where name regexp '小';

select * from qc_tb1 where name not regexp '小';

select * from runoob_test_tbl;

insert into runoob_test_tbl values ('test', 36);

begin;
insert into runoob_test_tbl values ('test transa', 16);
commit;

select * from runoob_test_tbl;

rollback;

begin;
insert into runoob_test_tbl values ('test transa rollback', 6);
select * from runoob_test_tbl;
rollback;
select * from runoob_test_tbl;

show tables;

desc runoob_test_tbl;

alter table runoob_test_tbl add runoob_id int(10);

alter table runoob_test_tbl add runoob_age int(10);

alter table runoob_test_tbl drop runoob_age;

select *
from runoob_test_tbl;

alter table runoob_test_tbl drop runoob_id;

alter table runoob_test_tbl add id int(10) first ;

select *
from runoob_test_tbl;

alter table runoob_test_tbl add a varchar(30) after id;

alter table runoob_test_tbl modify a char(10);

show columns from runoob_test_tbl;

alter table runoob_test_tbl alter a set default 1000;

alter table runoob_test_tbl alter a drop default ;

show table status like 'runoob_test_tbl';

alter table runoob_test_tbl rename to run_test_tbl;

show tables;

select *
from run_test_tbl;

insert into
    run_test_tbl(id, a, runoob_author, runoob_count)
    VALUES (1001, 'a', 'ppp', 30),
           (1002, 'b', 'eee', 33),
           (1003, 'c', 't', 34),
           (1004, 'd', 'tt', 35),
           (1005, 'e', 'ddd', 36)
;

delete from run_test_tbl where id is null;

create index index_id on run_test_tbl(id);

show table status like 'run_test_tbl';

desc run_test_tbl;

drop index ind_id on run_test_tbl;

alter table run_test_tbl add index ind_id(id);

show index from run_test_tbl;

select id
from run_test_tbl;

# 74ms
# 75ms

# 80ms
# 79ms

create table mytable(
    id int(10) not null ,
    username varchar(20) not null ,
    index indexName (username(20))
);

show index from mytable;

drop index indexName on mytable;

create unique index indexName on mytable(username(20));
desc mytable;
alter table mytable add unique index_Name (username(10));

create table my_tbl(
    id int not null ,
    username varchar(20) not null ,
    unique index_nm (username(20))
);

show index from my_tbl;

alter table my_tbl add primary key(id);

desc my_tbl;

alter table my_tbl add unique index_name (username);

alter table my_tbl add index (username);

drop index index_nm on my_tbl;

show index from my_tbl;

drop index username_2 on my_tbl;

drop index username on my_tbl;

drop index index_name on my_tbl;

show index from my_tbl;

alter table my_tbl drop primary key;

select *
from my_tbl;

alter table my_tbl add index (id);

show index from my_tbl;

alter table my_tbl drop index id;

desc my_tbl;

alter table my_tbl modify id int not null;

alter table my_tbl add primary key (id);

desc my_tbl;

show index from my_tbl;

alter table my_tbl drop primary key;

create table sale_sum(
    product_name varchar(50) not null ,
    total_sale decimal(12,2) not null default 0.00,
    avg_unit_price decimal(7,2) not null default 0.00,
    total_unit_sold int unsigned not null default 0
);

show tables;

insert into
sale_sum
values
('cucumber', 100.25, 90, 2),
('cucumber', 200.15, 30, 3),
('cucumber', 300.35, 50, 4),
('cucumber', 400.5, 60, 5)
;

select *
from
sale_sum;

show tables;

drop table sale_sum;

show tables;

select *
from sale_sum;


show create table emp_tb1;
/*
CREATE TABLE `emp_tb1` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `signin` int(4) NOT NULL DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
 */

CREATE TABLE `emp_tb2` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `signin` int(4) NOT NULL DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`),
  unique key name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

show tables;

alter table emp_tb2 drop index name;

show index from emp_tb2;

insert into emp_tb2
(id, name, date, signin)
select
    id, name, date, signin
from emp_tb1;

select *
from emp_tb1;

select *
from emp_tb2;

create table targetTb like run_test_tbl;

show tables;

desc targetTb;

select * from targetTb;

insert into targetTb
select * from run_test_tbl;

create table tb_1 select * from targetTb where 1=1;

select * from tb_1;

create table tb_2 select * from targetTb where 1=2;

select * from tb_2;

select version();

select database();

select user();

show status;

show variables;

create table insect
(
    id int unsigned not null auto_increment,
    primary key (id),
    name varchar(30) not null ,
    date date not null ,
    origin varchar(30) not null
);

show tables;

select *
from insect;

insert into insect
values
(NUll, 'aaaa', '2022-10-10', 'kkk'),
(NUll, 'bb', '2022-11-19', 'mm'),
(NUll, 'ccc', '2022-02-21', 'yy'),
(NUll, 'dd', '2022-12-11', 'rr'),
(NUll, 'eee', '2022-09-14', 'tt')
;

select *
from insect
order by date;

alter table insect drop id;

alter table insect
add id int(20) unsigned not null auto_increment first,
add primary key (id);

select *
from qc_tb1;

select
    distinct name
# name
from
emp_tb1;

select
name
from
emp_tb1
group by
name;

create table person_tb1
(
    first_name char(20),
    last_name char(20),
    sex char(10)
);

show tables;

create table person_tb2
(
    first_name char(20) not null,
    last_name char(20) not null ,
    sex char(10),
    primary key (last_name, first_name)
);

show tables;

insert into person_tb1
(last_name, first_name)
values
('sam', 'aa'),
('tam', 'bb'),
('pam', 'cc'),
('ham', 'dd')
;

insert into person_tb1
(last_name, first_name)
values
('sam', 'aa'),
('tam', 'bb'),
('pam', 'cc'),
('ham', 'dd')
;

select * from person_tb1;

select count(*) as repetitions , last_name , first_name
from person_tb1
group by last_name, first_name
having repetitions > 1;

insert into person_tb2
(last_name, first_name)
values
('sam', 'aa'),
('tam', 'bb'),
('pam', 'cc'),
('ham', 'dd')
;

select *
from person_tb2;

insert ignore into person_tb2
(last_name, first_name)
values
('sam', 'aa'),
('tam', 'bb'),
('pam', 'cc'),
('ham', 'dd')
;



create table person_tb3
(
    first_name char(20) not null ,
    last_name char(20) not null,
    sex char(10),
    unique (last_name, first_name)
);

insert into person_tb3
(last_name, first_name)
values
('sam', 'aa'),
('tam', 'bb'),
('pam', 'cc'),
('ham', 'dd')
;


select * from person_tb3;

select count(*) as repetitions , last_name , first_name
from person_tb3
group by last_name, first_name
having repetitions > 0;

select distinct last_name, first_name
from person_tb1
;

select last_name, first_name
from person_tb1
group by last_name, first_name;

desc person_tb1;

select * from person_tb1;

CREATE TABLE tmp
(SELECT last_name, first_name, sex
FROM person_tb3
GROUP BY last_name, first_name , sex);

show tables;

select * from tmp;

desc tmp;

alter table tmp rename to person_tb4;

alter table person_tb4
add primary key (last_name, first_name);

desc person_tb4;

alter table person_tb4
drop primary key;

select *
from person_tb4;

insert into
person_tb4
(last_name, first_name)
values
('ham', 'dd'),
('pam', 'cc'),
('sam', 'aa'),
('tam', 'bb')
;

alter ignore table person_tb4
add primary key (last_name, first_name);

desc person_tb4;

select * from person_tb4
;

select distinct last_name, first_name
from person_tb4;

select count(distinct  last_name, first_name)
from person_tb4;

/*
防止SQL注入，我们需要注意以下几个要点：

1.永远不要信任用户的输入。对用户的输入进行校验，可以通过正则表达式，或限制长度；对单引号和 双"-"进行转换等。
2.永远不要使用动态拼装sql，可以使用参数化的sql或者直接使用存储过程进行数据查询存取。
3.永远不要使用管理员权限的数据库连接，为每个应用使用单独的权限有限的数据库连接。
4.不要把机密信息直接存放，加密或者hash掉密码和敏感的信息。
5.应用的异常信息应该给出尽可能少的提示，最好使用自定义的错误信息对原始错误信息进行包装
6.sql注入的检测方法一般采取辅助软件或网站平台来检测，软件一般采用sql注入检测工具jsky，
  网站平台就有亿思网站安全平台检测工具。MDCSOFT SCAN等。采用MDCSOFT-IPS可以有效的防御SQL注入，XSS攻击等。
 */

select * from emp_tb1
into outfile 'd:/emp_tb1.txt'
;

show global variables like '%secure_file_priv%';

# 修改my.ini
# 添加secure-file-priv="C:/ProgramData/MySQL/MySQL Server 8.0/Uploads"（就是要导入的文件所在位置）
# 网上说设成空好像可以任意导入导出
# secure_file_priv=''

# 重启mysql服务

# mysqldump -u root -p --no-create-info --tab=/tmp RUNOOB runoob_tbl

# mysqldump -u root -p RUNOOB runoob_tbl > dump.txt

# 导出整个数据库的数据
# mysqldump -u root -p RUNOOB > database_dump.txt

# 要备份所有数据库
# mysqldump -u root -p --all-databases > database_dump.txt

/*
导出
mysqldump -u root -p database_name table_name > dump.txt

导入
mysql -u root -p database_name < dump.txt

将导出的数据直接导入到远程的服务器上
mysqldump -u root -p database_name mysql -h other-host.com database_name
 */

# mysql 命令导入
# mysql -u用户名    -p密码    <  要导入的数据库数据(runoob.sql)
# mysql -uroot -p123456 < runoob.sql

# source 命令导入

# create database abc;      # 创建数据库
# use abc;                  # 使用已创建的数据库
# set names utf8;           # 设置编码
# source /home/abc/abc.sql  # 导入备份数据库

# 使用 LOAD DATA 导入数据
# LOAD DATA LOCAL INFILE 'dump.txt' INTO TABLE mytbl;
# LOAD DATA LOCAL INFILE 'dump.txt' INTO TABLE mytbl FIELDS TERMINATED BY ':' LINES TERMINATED BY '\r\n';
# LOAD DATA LOCAL INFILE 'dump.txt' INTO TABLE mytbl (b, c, a);

# 使用 mysqlimport 导入数据
# mysqlimport -u root -p --local mytbl dump.txt
# mysqlimport -u root -p --local --fields-terminated-by=":" --lines-terminated-by="\r\n"  mytbl dump.txt

# mysqlimport 语句中使用 --columns 选项来设置列的顺序：
# mysqlimport -u root -p --local --columns=b,c,a mytbl dump.txt

/*
MySQL 函数
MySQL 有很多内置的函数，以下列出了这些函数的说明。

MySQL 字符串函数
函数	描述	实例
ASCII(s)	返回字符串 s 的第一个字符的 ASCII 码。
返回 CustomerName 字段第一个字母的 ASCII 码：

SELECT ASCII(CustomerName) AS NumCodeOfFirstChar
FROM Customers;
CHAR_LENGTH(s)	返回字符串 s 的字符数
返回字符串 RUNOOB 的字符数

SELECT CHAR_LENGTH("RUNOOB") AS LengthOfString;
CHARACTER_LENGTH(s)	返回字符串 s 的字符数，等同于 CHAR_LENGTH(s)
返回字符串 RUNOOB 的字符数

SELECT CHARACTER_LENGTH("RUNOOB") AS LengthOfString;
CONCAT(s1,s2...sn)	字符串 s1,s2 等多个字符串合并为一个字符串
合并多个字符串

SELECT CONCAT("SQL ", "Runoob ", "Gooogle ", "Facebook") AS ConcatenatedString;
CONCAT_WS(x, s1,s2...sn)	同 CONCAT(s1,s2,...) 函数，但是每个字符串之间要加上 x，x 可以是分隔符
合并多个字符串，并添加分隔符：

SELECT CONCAT_WS("-", "SQL", "Tutorial", "is", "fun!")AS ConcatenatedString;
FIELD(s,s1,s2...)	返回第一个字符串 s 在字符串列表(s1,s2...)中的位置
返回字符串 c 在列表值中的位置：

SELECT FIELD("c", "a", "b", "c", "d", "e");
FIND_IN_SET(s1,s2)	返回在字符串s2中与s1匹配的字符串的位置
返回字符串 c 在指定字符串中的位置：

SELECT FIND_IN_SET("c", "a,b,c,d,e");
FORMAT(x,n)	函数可以将数字 x 进行格式化 "#,###.##", 将 x 保留到小数点后 n 位，最后一位四舍五入。
格式化数字 "#,###.##" 形式：

SELECT FORMAT(250500.5634, 2);     -- 输出 250,500.56
INSERT(s1,x,len,s2)	字符串 s2 替换 s1 的 x 位置开始长度为 len 的字符串
从字符串第一个位置开始的 6 个字符替换为 runoob：

SELECT INSERT("google.com", 1, 6, "runoob");  -- 输出：runoob.com
LOCATE(s1,s)	从字符串 s 中获取 s1 的开始位置
获取 b 在字符串 abc 中的位置：

SELECT LOCATE('st','myteststring');  -- 5
返回字符串 abc 中 b 的位置：

SELECT LOCATE('b', 'abc') -- 2
LCASE(s)	将字符串 s 的所有字母变成小写字母
字符串 RUNOOB 转换为小写：

SELECT LCASE('RUNOOB') -- runoob
LEFT(s,n)	返回字符串 s 的前 n 个字符
返回字符串 runoob 中的前两个字符：

SELECT LEFT('runoob',2) -- ru
LOWER(s)	将字符串 s 的所有字母变成小写字母
字符串 RUNOOB 转换为小写：

SELECT LOWER('RUNOOB') -- runoob
LPAD(s1,len,s2)	在字符串 s1 的开始处填充字符串 s2，使字符串长度达到 len
将字符串 xx 填充到 abc 字符串的开始处：

SELECT LPAD('abc',5,'xx') -- xxabc
LTRIM(s)	去掉字符串 s 开始处的空格
去掉字符串 RUNOOB开始处的空格：

SELECT LTRIM("    RUNOOB") AS LeftTrimmedString;-- RUNOOB
MID(s,n,len)	从字符串 s 的 n 位置截取长度为 len 的子字符串，同 SUBSTRING(s,n,len)
从字符串 RUNOOB 中的第 2 个位置截取 3个 字符：

SELECT MID("RUNOOB", 2, 3) AS ExtractString; -- UNO
POSITION(s1 IN s)	从字符串 s 中获取 s1 的开始位置
返回字符串 abc 中 b 的位置：

SELECT POSITION('b' in 'abc') -- 2
REPEAT(s,n)	将字符串 s 重复 n 次
将字符串 runoob 重复三次：

SELECT REPEAT('runoob',3) -- runoobrunoobrunoob
REPLACE(s,s1,s2)	将字符串 s2 替代字符串 s 中的字符串 s1
将字符串 abc 中的字符 a 替换为字符 x：

SELECT REPLACE('abc','a','x') --xbc
REVERSE(s)	将字符串s的顺序反过来
将字符串 abc 的顺序反过来：

SELECT REVERSE('abc') -- cba
RIGHT(s,n)	返回字符串 s 的后 n 个字符
返回字符串 runoob 的后两个字符：

SELECT RIGHT('runoob',2) -- ob
RPAD(s1,len,s2)	在字符串 s1 的结尾处添加字符串 s2，使字符串的长度达到 len
将字符串 xx 填充到 abc 字符串的结尾处：

SELECT RPAD('abc',5,'xx') -- abcxx
RTRIM(s)	去掉字符串 s 结尾处的空格
去掉字符串 RUNOOB 的末尾空格：

SELECT RTRIM("RUNOOB     ") AS RightTrimmedString;   -- RUNOOB
SPACE(n)	返回 n 个空格
返回 10 个空格：

SELECT SPACE(10);
STRCMP(s1,s2)	比较字符串 s1 和 s2，如果 s1 与 s2 相等返回 0 ，如果 s1>s2 返回 1，如果 s1<s2 返回 -1
比较字符串：

SELECT STRCMP("runoob", "runoob");  -- 0
SUBSTR(s, start, length)	从字符串 s 的 start 位置截取长度为 length 的子字符串
从字符串 RUNOOB 中的第 2 个位置截取 3个 字符：

SELECT SUBSTR("RUNOOB", 2, 3) AS ExtractString; -- UNO
SUBSTRING(s, start, length)	从字符串 s 的 start 位置截取长度为 length 的子字符串，等同于 SUBSTR(s, start, length)
从字符串 RUNOOB 中的第 2 个位置截取 3个 字符：

SELECT SUBSTRING("RUNOOB", 2, 3) AS ExtractString; -- UNO
SUBSTRING_INDEX(s, delimiter, number)	返回从字符串 s 的第 number 个出现的分隔符 delimiter 之后的子串。
如果 number 是正数，返回第 number 个字符左边的字符串。
如果 number 是负数，返回第(number 的绝对值(从右边数))个字符右边的字符串。
SELECT SUBSTRING_INDEX('a*b','*',1) -- a
SELECT SUBSTRING_INDEX('a*b','*',-1)    -- b
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX('a*b*c*d*e','*',3),'*',-1)    -- c
TRIM(s)	去掉字符串 s 开始和结尾处的空格
去掉字符串 RUNOOB 的首尾空格：

SELECT TRIM('    RUNOOB    ') AS TrimmedString;
UCASE(s)	将字符串转换为大写
将字符串 runoob 转换为大写：

SELECT UCASE("runoob"); -- RUNOOB
UPPER(s)	将字符串转换为大写
将字符串 runoob 转换为大写：

SELECT UPPER("runoob"); -- RUNOOB
MySQL 数字函数
函数名	描述	实例
ABS(x)	返回 x 的绝对值　　
返回 -1 的绝对值：

SELECT ABS(-1) -- 返回1
ACOS(x)	求 x 的反余弦值（单位为弧度），x 为一个数值
SELECT ACOS(0.25);
ASIN(x)	求反正弦值（单位为弧度），x 为一个数值
SELECT ASIN(0.25);
ATAN(x)	求反正切值（单位为弧度），x 为一个数值
SELECT ATAN(2.5);
ATAN2(n, m)	求反正切值（单位为弧度）
SELECT ATAN2(-0.8, 2);
AVG(expression)	返回一个表达式的平均值，expression 是一个字段
返回 Products 表中Price 字段的平均值：

SELECT AVG(Price) AS AveragePrice FROM Products;
CEIL(x)	返回大于或等于 x 的最小整数　
SELECT CEIL(1.5) -- 返回2
CEILING(x)	返回大于或等于 x 的最小整数　
SELECT CEILING(1.5); -- 返回2
COS(x)	求余弦值(参数是弧度)
SELECT COS(2);
COT(x)	求余切值(参数是弧度)
SELECT COT(6);
COUNT(expression)	返回查询的记录总数，expression 参数是一个字段或者 * 号
返回 Products 表中 products 字段总共有多少条记录：

SELECT COUNT(ProductID) AS NumberOfProducts FROM Products;
DEGREES(x)	将弧度转换为角度　　
SELECT DEGREES(3.1415926535898) -- 180
n DIV m	整除，n 为被除数，m 为除数
计算 10 除于 5：

SELECT 10 DIV 5;  -- 2
EXP(x)	返回 e 的 x 次方　　
计算 e 的三次方：

SELECT EXP(3) -- 20.085536923188
FLOOR(x)	返回小于或等于 x 的最大整数　　
小于或等于 1.5 的整数：

SELECT FLOOR(1.5) -- 返回1
GREATEST(expr1, expr2, expr3, ...)	返回列表中的最大值
返回以下数字列表中的最大值：

SELECT GREATEST(3, 12, 34, 8, 25); -- 34
返回以下字符串列表中的最大值：

SELECT GREATEST("Google", "Runoob", "Apple");   -- Runoob
LEAST(expr1, expr2, expr3, ...)	返回列表中的最小值
返回以下数字列表中的最小值：

SELECT LEAST(3, 12, 34, 8, 25); -- 3
返回以下字符串列表中的最小值：

SELECT LEAST("Google", "Runoob", "Apple");   -- Apple
LN	返回数字的自然对数，以 e 为底。
返回 2 的自然对数：

SELECT LN(2);  -- 0.6931471805599453
LOG(x) 或 LOG(base, x)	返回自然对数(以 e 为底的对数)，如果带有 base 参数，则 base 为指定带底数。　　
SELECT LOG(20.085536923188) -- 3
SELECT LOG(2, 4); -- 2
LOG10(x)	返回以 10 为底的对数　　
SELECT LOG10(100) -- 2
LOG2(x)	返回以 2 为底的对数
返回以 2 为底 6 的对数：

SELECT LOG2(6);  -- 2.584962500721156
MAX(expression)	返回字段 expression 中的最大值
返回数据表 Products 中字段 Price 的最大值：

SELECT MAX(Price) AS LargestPrice FROM Products;
MIN(expression)	返回字段 expression 中的最小值
返回数据表 Products 中字段 Price 的最小值：

SELECT MIN(Price) AS MinPrice FROM Products;
MOD(x,y)	返回 x 除以 y 以后的余数　
5 除于 2 的余数：

SELECT MOD(5,2) -- 1
PI()	返回圆周率(3.141593）　　
SELECT PI() --3.141593
POW(x,y)	返回 x 的 y 次方　
2 的 3 次方：

SELECT POW(2,3) -- 8
POWER(x,y)	返回 x 的 y 次方　
2 的 3 次方：

SELECT POWER(2,3) -- 8
RADIANS(x)	将角度转换为弧度　　
180 度转换为弧度：

SELECT RADIANS(180) -- 3.1415926535898
RAND()	返回 0 到 1 的随机数　　
SELECT RAND() --0.93099315644334
ROUND(x [,y])	返回离 x 最近的整数，可选参数 y 表示要四舍五入的小数位数，如果省略，则返回整数。
SELECT ROUND(1.23456) --1

SELECT ROUND(345.156, 2) -- 345.16
SIGN(x)	返回 x 的符号，x 是负数、0、正数分别返回 -1、0 和 1　
SELECT SIGN(-10) -- (-1)
SIN(x)	求正弦值(参数是弧度)　　
SELECT SIN(RADIANS(30)) -- 0.5
SQRT(x)	返回x的平方根　　
25 的平方根：

SELECT SQRT(25) -- 5
SUM(expression)	返回指定字段的总和
计算 OrderDetails 表中字段 Quantity 的总和：

SELECT SUM(Quantity) AS TotalItemsOrdered FROM OrderDetails;
TAN(x)	求正切值(参数是弧度)
SELECT TAN(1.75);  -- -5.52037992250933
TRUNCATE(x,y)	返回数值 x 保留到小数点后 y 位的值（与 ROUND 最大的区别是不会进行四舍五入）
SELECT TRUNCATE(1.23456,3) -- 1.234
MySQL 日期函数
函数名	描述	实例
ADDDATE(d,n)	计算起始日期 d 加上 n 天的日期
SELECT ADDDATE("2017-06-15", INTERVAL 10 DAY);
->2017-06-25
ADDTIME(t,n)	n 是一个时间表达式，时间 t 加上时间表达式 n
加 5 秒：

SELECT ADDTIME('2011-11-11 11:11:11', 5);
->2011-11-11 11:11:16 (秒)
添加 2 小时, 10 分钟, 5 秒:

SELECT ADDTIME("2020-06-15 09:34:21", "2:10:5");
-> 2020-06-15 11:44:26
CURDATE()	返回当前日期
SELECT CURDATE();
-> 2018-09-19
CURRENT_DATE()	返回当前日期
SELECT CURRENT_DATE();
-> 2018-09-19
CURRENT_TIME	返回当前时间
SELECT CURRENT_TIME();
-> 19:59:02
CURRENT_TIMESTAMP()	返回当前日期和时间
SELECT CURRENT_TIMESTAMP()
-> 2018-09-19 20:57:43
CURTIME()	返回当前时间
SELECT CURTIME();
-> 19:59:02
DATE()	从日期或日期时间表达式中提取日期值
SELECT DATE("2017-06-15");
-> 2017-06-15
DATEDIFF(d1,d2)	计算日期 d1->d2 之间相隔的天数
SELECT DATEDIFF('2001-01-01','2001-02-02')
-> -32
DATE_ADD(d，INTERVAL expr type)	计算起始日期 d 加上一个时间段后的日期，type 值可以是：
MICROSECOND
SECOND
MINUTE
HOUR
DAY
WEEK
MONTH
QUARTER
YEAR
SECOND_MICROSECOND
MINUTE_MICROSECOND
MINUTE_SECOND
HOUR_MICROSECOND
HOUR_SECOND
HOUR_MINUTE
DAY_MICROSECOND
DAY_SECOND
DAY_MINUTE
DAY_HOUR
YEAR_MONTH
SELECT DATE_ADD("2017-06-15", INTERVAL 10 DAY);
-> 2017-06-25

SELECT DATE_ADD("2017-06-15 09:34:21", INTERVAL 15 MINUTE);
-> 2017-06-15 09:49:21

SELECT DATE_ADD("2017-06-15 09:34:21", INTERVAL -3 HOUR);
->2017-06-15 06:34:21

SELECT DATE_ADD("2017-06-15 09:34:21", INTERVAL -3 MONTH);
->2017-04-15
DATE_FORMAT(d,f)	按表达式 f的要求显示日期 d
SELECT DATE_FORMAT('2011-11-11 11:11:11','%Y-%m-%d %r')
-> 2011-11-11 11:11:11 AM
DATE_SUB(date,INTERVAL expr type)	函数从日期减去指定的时间间隔。
Orders 表中 OrderDate 字段减去 2 天：

SELECT OrderId,DATE_SUB(OrderDate,INTERVAL 2 DAY) AS OrderPayDate
FROM Orders
DAY(d)	返回日期值 d 的日期部分
SELECT DAY("2017-06-15");
-> 15
DAYNAME(d)	返回日期 d 是星期几，如 Monday,Tuesday
SELECT DAYNAME('2011-11-11 11:11:11')
->Friday
DAYOFMONTH(d)	计算日期 d 是本月的第几天
SELECT DAYOFMONTH('2011-11-11 11:11:11')
->11
DAYOFWEEK(d)	日期 d 今天是星期几，1 星期日，2 星期一，以此类推
SELECT DAYOFWEEK('2011-11-11 11:11:11')
->6
DAYOFYEAR(d)	计算日期 d 是本年的第几天
SELECT DAYOFYEAR('2011-11-11 11:11:11')
->315
EXTRACT(type FROM d)	从日期 d 中获取指定的值，type 指定返回的值。
type可取值为：
MICROSECOND
SECOND
MINUTE
HOUR
DAY
WEEK
MONTH
QUARTER
YEAR
SECOND_MICROSECOND
MINUTE_MICROSECOND
MINUTE_SECOND
HOUR_MICROSECOND
HOUR_SECOND
HOUR_MINUTE
DAY_MICROSECOND
DAY_SECOND
DAY_MINUTE
DAY_HOUR
YEAR_MONTH
SELECT EXTRACT(MINUTE FROM '2011-11-11 11:11:11')
-> 11
FROM_DAYS(n)	计算从 0000 年 1 月 1 日开始 n 天后的日期
SELECT FROM_DAYS(1111)
-> 0003-01-16
HOUR(t)	返回 t 中的小时值
SELECT HOUR('1:2:3')
-> 1
LAST_DAY(d)	返回给给定日期的那一月份的最后一天
SELECT LAST_DAY("2017-06-20");
-> 2017-06-30
LOCALTIME()	返回当前日期和时间
SELECT LOCALTIME()
-> 2018-09-19 20:57:43
LOCALTIMESTAMP()	返回当前日期和时间
SELECT LOCALTIMESTAMP()
-> 2018-09-19 20:57:43
MAKEDATE(year, day-of-year)	基于给定参数年份 year 和所在年中的天数序号 day-of-year 返回一个日期
SELECT MAKEDATE(2017, 3);
-> 2017-01-03
MAKETIME(hour, minute, second)	组合时间，参数分别为小时、分钟、秒
SELECT MAKETIME(11, 35, 4);
-> 11:35:04
MICROSECOND(date)	返回日期参数所对应的微秒数
SELECT MICROSECOND("2017-06-20 09:34:00.000023");
-> 23
MINUTE(t)	返回 t 中的分钟值
SELECT MINUTE('1:2:3')
-> 2
MONTHNAME(d)	返回日期当中的月份名称，如 November
SELECT MONTHNAME('2011-11-11 11:11:11')
-> November
MONTH(d)	返回日期d中的月份值，1 到 12
SELECT MONTH('2011-11-11 11:11:11')
->11
NOW()	返回当前日期和时间
SELECT NOW()
-> 2018-09-19 20:57:43
PERIOD_ADD(period, number)	为 年-月 组合日期添加一个时段
SELECT PERIOD_ADD(201703, 5);
-> 201708
PERIOD_DIFF(period1, period2)	返回两个时段之间的月份差值
SELECT PERIOD_DIFF(201710, 201703);
-> 7
QUARTER(d)	返回日期d是第几季节，返回 1 到 4
SELECT QUARTER('2011-11-11 11:11:11')
-> 4
SECOND(t)	返回 t 中的秒钟值
SELECT SECOND('1:2:3')
-> 3
SEC_TO_TIME(s)	将以秒为单位的时间 s 转换为时分秒的格式
SELECT SEC_TO_TIME(4320)
-> 01:12:00
STR_TO_DATE(string, format_mask)	将字符串转变为日期
SELECT STR_TO_DATE("August 10 2017", "%M %d %Y");
-> 2017-08-10
SUBDATE(d,n)	日期 d 减去 n 天后的日期
SELECT SUBDATE('2011-11-11 11:11:11', 1)
->2011-11-10 11:11:11 (默认是天)
SUBTIME(t,n)	时间 t 减去 n 秒的时间
SELECT SUBTIME('2011-11-11 11:11:11', 5)
->2011-11-11 11:11:06 (秒)
SYSDATE()	返回当前日期和时间
SELECT SYSDATE()
-> 2018-09-19 20:57:43
TIME(expression)	提取传入表达式的时间部分
SELECT TIME("19:30:10");
-> 19:30:10
TIME_FORMAT(t,f)	按表达式 f 的要求显示时间 t
SELECT TIME_FORMAT('11:11:11','%r')
11:11:11 AM
TIME_TO_SEC(t)	将时间 t 转换为秒
SELECT TIME_TO_SEC('1:12:00')
-> 4320
TIMEDIFF(time1, time2)	计算时间差值
mysql> SELECT TIMEDIFF("13:10:11", "13:10:10");
-> 00:00:01
mysql> SELECT TIMEDIFF('2000:01:01 00:00:00',
    ->                 '2000:01:01 00:00:00.000001');
        -> '-00:00:00.000001'
mysql> SELECT TIMEDIFF('2008-12-31 23:59:59.000001',
    ->                 '2008-12-30 01:01:01.000002');
        -> '46:58:57.999999'
TIMESTAMP(expression, interval)	单个参数时，函数返回日期或日期时间表达式；有2个参数时，将参数加和
mysql> SELECT TIMESTAMP("2017-07-23",  "13:10:11");
-> 2017-07-23 13:10:11
mysql> SELECT TIMESTAMP('2003-12-31');
        -> '2003-12-31 00:00:00'
mysql> SELECT TIMESTAMP('2003-12-31 12:00:00','12:00:00');
        -> '2004-01-01 00:00:00'
TIMESTAMPDIFF(unit,datetime_expr1,datetime_expr2)	计算时间差，返回 datetime_expr2 − datetime_expr1 的时间差
mysql> SELECT TIMESTAMPDIFF(DAY,'2003-02-01','2003-05-01');   // 计算两个时间相隔多少天
        -> 89
mysql> SELECT TIMESTAMPDIFF(MONTH,'2003-02-01','2003-05-01');   // 计算两个时间相隔多少月
        -> 3
mysql> SELECT TIMESTAMPDIFF(YEAR,'2002-05-01','2001-01-01');    // 计算两个时间相隔多少年
        -> -1
mysql> SELECT TIMESTAMPDIFF(MINUTE,'2003-02-01','2003-05-01 12:05:55');  // 计算两个时间相隔多少分钟
        -> 128885
TO_DAYS(d)	计算日期 d 距离 0000 年 1 月 1 日的天数
SELECT TO_DAYS('0001-01-01 01:01:01')
-> 366
WEEK(d)	计算日期 d 是本年的第几个星期，范围是 0 到 53
SELECT WEEK('2011-11-11 11:11:11')
-> 45
WEEKDAY(d)	日期 d 是星期几，0 表示星期一，1 表示星期二
SELECT WEEKDAY("2017-06-15");
-> 3
WEEKOFYEAR(d)	计算日期 d 是本年的第几个星期，范围是 0 到 53
SELECT WEEKOFYEAR('2011-11-11 11:11:11')
-> 45
YEAR(d)	返回年份
SELECT YEAR("2017-06-15");
-> 2017
YEARWEEK(date, mode)	返回年份及第几周（0到53），mode 中 0 表示周天，1表示周一，以此类推
SELECT YEARWEEK("2017-06-15");
-> 201724
MySQL 高级函数
函数名	描述	实例
BIN(x)	返回 x 的二进制编码
15 的 2 进制编码:

SELECT BIN(15); -- 1111
BINARY(s)	将字符串 s 转换为二进制字符串
SELECT BINARY "RUNOOB";
-> RUNOOB
CASE expression
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
   ...
    WHEN conditionN THEN resultN
    ELSE result
END	CASE 表示函数开始，END 表示函数结束。如果 condition1 成立，则返回 result1, 如果 condition2 成立，则返回 result2，当全部不成立则返回 result，而当有一个成立之后，后面的就不执行了。
SELECT CASE
　　WHEN 1 > 0
　　THEN '1 > 0'
　　WHEN 2 > 0
　　THEN '2 > 0'
　　ELSE '3 > 0'
　　END
->1 > 0
CAST(x AS type)	转换数据类型
字符串日期转换为日期：

SELECT CAST("2017-08-29" AS DATE);
-> 2017-08-29
COALESCE(expr1, expr2, ...., expr_n)	返回参数中的第一个非空表达式（从左向右）
SELECT COALESCE(NULL, NULL, NULL, 'runoob.com', NULL, 'google.com');
-> runoob.com
CONNECTION_ID()	返回唯一的连接 ID
SELECT CONNECTION_ID();
-> 4292835
CONV(x,f1,f2)	返回 f1 进制数变成 f2 进制数
SELECT CONV(15, 10, 2);
-> 1111
CONVERT(s USING cs)	函数将字符串 s 的字符集变成 cs
SELECT CHARSET('ABC')
->utf-8

SELECT CHARSET(CONVERT('ABC' USING gbk))
->gbk
CURRENT_USER()	返回当前用户
SELECT CURRENT_USER();
-> guest@%
DATABASE()	返回当前数据库名
SELECT DATABASE();
-> runoob
IF(expr,v1,v2)	如果表达式 expr 成立，返回结果 v1；否则，返回结果 v2。
SELECT IF(1 > 0,'正确','错误')
->正确
IFNULL(v1,v2)	如果 v1 的值不为 NULL，则返回 v1，否则返回 v2。
SELECT IFNULL(null,'Hello Word')
->Hello Word
ISNULL(expression)	判断表达式是否为 NULL
SELECT ISNULL(NULL);
->1
LAST_INSERT_ID()	返回最近生成的 AUTO_INCREMENT 值
SELECT LAST_INSERT_ID();
->6
NULLIF(expr1, expr2)	比较两个字符串，如果字符串 expr1 与 expr2 相等 返回 NULL，否则返回 expr1
SELECT NULLIF(25, 25);
->
SESSION_USER()	返回当前用户
SELECT SESSION_USER();
-> guest@%
SYSTEM_USER()	返回当前用户
SELECT SYSTEM_USER();
-> guest@%
USER()	返回当前用户
SELECT USER();
-> guest@%
VERSION()	返回数据库的版本号
SELECT VERSION()
-> 5.6.34
 */



# 运算符

/*
算术运算符
MySQL 支持的算术运算符包括:

运算符	作用
+	加法
-	减法
*	乘法
/ 或 DIV	除法
% 或 MOD	取余
在除法运算和模运算中，如果除数为0，将是非法除数，返回结果为NULL。

1、加

mysql> select 1+2;
+-----+
| 1+2 |
+-----+
|   3 |
+-----+
2、减

mysql> select 1-2;
+-----+
| 1-2 |
+-----+
|  -1 |
+-----+
3、乘

mysql> select 2*3;
+-----+
| 2*3 |
+-----+
|   6 |
+-----+
4、除

mysql> select 2/3;
+--------+
| 2/3    |
+--------+
| 0.6667 |
+--------+
5、商

mysql> select 10 DIV 4;
+----------+
| 10 DIV 4 |
+----------+
|        2 |
+----------+
6、取余

mysql> select 10 MOD 4;
+----------+
| 10 MOD 4 |
+----------+
|        2 |
+----------+
比较运算符
SELECT 语句中的条件语句经常要使用比较运算符。通过这些比较运算符，可以判断表中的哪些记录是符合条件的。比较结果为真，则返回 1，为假则返回 0，比较结果不确定则返回 NULL。

符号	描述	备注
=	等于
<>, !=	不等于
>	大于
<	小于
<=	小于等于
>=	大于等于
BETWEEN	在两值之间	>=min&&<=max
NOT BETWEEN	不在两值之间
IN	在集合中
NOT IN	不在集合中
<=>	严格比较两个NULL值是否相等	两个操作码均为NULL时，其所得值为1；而当一个操作码为NULL时，其所得值为0
LIKE	模糊匹配
REGEXP 或 RLIKE	正则式匹配
IS NULL	为空
IS NOT NULL	不为空
1、等于

mysql> select 2=3;
+-----+
| 2=3 |
+-----+
|   0 |
+-----+


mysql> select NULL = NULL;
+-------------+
| NULL = NULL |
+-------------+
|        NULL |
+-------------+
2、不等于

mysql> select 2<>3;
+------+
| 2<>3 |
+------+
|    1 |
+------+
3、安全等于

与 = 的区别在于当两个操作码均为 NULL 时，其所得值为 1 而不为 NULL，而当一个操作码为 NULL 时，其所得值为 0而不为 NULL。

mysql> select 2<=>3;
+-------+
| 2<=>3 |
+-------+
|     0 |
+-------+


mysql> select null=null;
+-----------+
| null=null |
+-----------+
|      NULL |
+-----------+


mysql> select null<=>null;
+-------------+
| null<=>null |
+-------------+
|           1 |
+-------------+
4、小于

mysql> select 2<3;
+-----+
| 2<3 |
+-----+
|   1 |
+-----+
5、小于等于

mysql> select 2<=3;
+------+
| 2<=3 |
+------+
|    1 |
+------+
6、大于

mysql> select 2>3;
+-----+
| 2>3 |
+-----+
|   0 |
+-----+
7、大于等于

mysql> select 2>=3;
+------+
| 2>=3 |
+------+
|    0 |
+------+
8、BETWEEN

mysql> select 5 between 1 and 10;
+--------------------+
| 5 between 1 and 10 |
+--------------------+
|                  1 |
+--------------------+
9、IN

mysql> select 5 in (1,2,3,4,5);
+------------------+
| 5 in (1,2,3,4,5) |
+------------------+
|                1 |
+------------------+
10、NOT IN

mysql> select 5 not in (1,2,3,4,5);
+----------------------+
| 5 not in (1,2,3,4,5) |
+----------------------+
|                    0 |
+----------------------+
11、IS NULL

mysql> select null is NULL;
+--------------+
| null is NULL |
+--------------+
|            1 |
+--------------+

mysql> select 'a' is NULL;
+-------------+
| 'a' is NULL |
+-------------+
|           0 |
+-------------+
12、IS NOT NULL

mysql> select null IS NOT NULL;
+------------------+
| null IS NOT NULL |
+------------------+
|                0 |
+------------------+


mysql> select 'a' IS NOT NULL;
+-----------------+
| 'a' IS NOT NULL |
+-----------------+
|               1 |
+-----------------+
13、LIKE

mysql> select '12345' like '12%';
+--------------------+
| '12345' like '12%' |
+--------------------+
|                  1 |
+--------------------+

mysql> select '12345' like '12_';
+--------------------+
| '12345' like '12_' |
+--------------------+
|                  0 |
+--------------------+
14、REGEXP

mysql> select 'beijing' REGEXP 'jing';
+-------------------------+
| 'beijing' REGEXP 'jing' |
+-------------------------+
|                       1 |
+-------------------------+

mysql> select 'beijing' REGEXP 'xi';
+-----------------------+
| 'beijing' REGEXP 'xi' |
+-----------------------+
|                     0 |
+-----------------------+
逻辑运算符
逻辑运算符用来判断表达式的真假。如果表达式是真，结果返回 1。如果表达式是假，结果返回 0。

运算符号	作用
NOT 或 !	逻辑非
AND	逻辑与
OR	逻辑或
XOR	逻辑异或
1、与

mysql> select 2 and 0;
+---------+
| 2 and 0 |
+---------+
|       0 |
+---------+


mysql> select 2 and 1;
+---------+
| 2 and 1 |
+---------+
|       1 |
+---------+
2、或

mysql> select 2 or 0;
+--------+
| 2 or 0 |
+--------+
|      1 |
+--------+

mysql> select 2 or 1;
+--------+
| 2 or 1 |
+--------+
|      1 |
+--------+

mysql> select 0 or 0;
+--------+
| 0 or 0 |
+--------+
|      0 |
+--------+

mysql> select 1 || 0;
+--------+
| 1 || 0 |
+--------+
|      1 |
+--------+
3、非

mysql> select not 1;
+-------+
| not 1 |
+-------+
|     0 |
+-------+

mysql> select !0;
+----+
| !0 |
+----+
|  1 |
+----+
4、异或

mysql> select 1 xor 1;
+---------+
| 1 xor 1 |
+---------+
|       0 |
+---------+

mysql> select 0 xor 0;
+---------+
| 0 xor 0 |
+---------+
|       0 |
+---------+

mysql> select 1 xor 0;
+---------+
| 1 xor 0 |
+---------+
|       1 |
+---------+

mysql> select null or 1;
+-----------+
| null or 1 |
+-----------+
|         1 |
+-----------+

mysql> select 1 ^ 0;
+-------+
| 1 ^ 0 |
+-------+
|     1 |
+-------+
位运算符
位运算符是在二进制数上进行计算的运算符。位运算会先将操作数变成二进制数，进行位运算。然后再将计算结果从二进制数变回十进制数。

运算符号	作用
&	按位与
|	按位或
^	按位异或
!	取反
<<	左移
>>	右移
1、按位与

mysql> select 3&5;
+-----+
| 3&5 |
+-----+
|   1 |
+-----+
2、按位或

mysql> select 3|5;
+-----+
| 3|5 |
+-----+
|   7 |
+-----+
3、按位异或

mysql> select 3^5;
+-----+
| 3^5 |
+-----+
|   6 |
+-----+
4、按位取反

mysql> select ~18446744073709551612;
+-----------------------+
| ~18446744073709551612 |
+-----------------------+
|                     3 |
+-----------------------+
5、按位右移

mysql> select 3>>1;
+------+
| 3>>1 |
+------+
|    1 |
+------+
6、按位左移

mysql> select 3<<1;
+------+
| 3<<1 |
+------+
|    6 |
+------+
运算符优先级
最低优先级为： :=。
最高优先级为： !、BINARY、 COLLATE。
 */


# [菜鸟学习](https://www.runoob.com/mysql/mysql-operator.html)

