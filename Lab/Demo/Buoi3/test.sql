create database baitest
use baitest
create table bang1(
id int,
ten varchar(255),
tuoi int
);
create table bang2(
cot1 int auto_increment,
cot2 int not null,
cot3 int,
primary key(cot1)
);
create table bang3(
cotKhoaChinh varchar(9),
cotKhoaNgoai int,
primary key(cotKhoaChinh),
foreign key(cotKhoaNgoai) references dlmoi.bang2(cot1)
);
alter table bang1
add primary key(id);
-- cot4 varchar(99);

alter table bang1
add cot4 varchar(99);

drop table bang3;