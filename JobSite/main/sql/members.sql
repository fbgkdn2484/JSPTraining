create table members(
     id varchar(50) not null primary key,
     passwd varchar(20) not null,
     name varchar(30) not null,
     birth datetime,
     addr varchar(100),
     tel varchar(13),
     img varchar(100) default 'nothing.jpg',
     reg_date datetime not null
);


select * from members;

delete from members;

update members set rnk = "2" where id = '1';

drop table members;

update members set name = '999', tel = '999', addr = '999', img = '999' where id='777';

update members set img = '' where id='777';

