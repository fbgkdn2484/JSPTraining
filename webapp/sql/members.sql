create table members(
     id varchar(50) not null primary key,
     passwd varchar(20) not null,
     name varchar(30) not null,
     reg_date datetime not null
);

insert into members
     values ("kingdora@gragon.com", "1234", "김개동", now());

insert into members
     values ("hongkd@aaa.com", "1111", "홍길동", now());
     
insert into members
     values ('awexcd@gragon.com', '2222', '김가가', now());
     
select id, passwd from members where id = "3333";
select * from members;



