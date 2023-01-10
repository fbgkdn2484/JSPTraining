create table board(
     num int not null primary key auto_increment,
     writer varchar(20) not null,
     email varchar(30) ,
     subject varchar(50) not null,
     passwd varchar(15) not null,
     reg_date datetime not null,
     readcount int default 0,
     content text not null
);

select * from board order by num desc;

select count(*) from board;

select * from board where num = 3;

select * from board order by num desc limit 0, 10;		-- 검색 레코드 수 제한함 시작번호, 레코드 수

