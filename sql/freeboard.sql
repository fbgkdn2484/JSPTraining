drop table freeboard;

create table freeboard(
     num int not null primary key auto_increment,
     writer varchar(20) not null,     
     subject varchar(50) not null,
     reg_date datetime not null,
     readcount int default 0,
     content text not null,
     FOREIGN KEY(writer) REFERENCES member(id)		
);

--회원만 게시판에 글을 등록할 수 있게 하기 위함

insert into freeboard(writer, subject, reg_date, content)
values ('aaa', '제목 test1', now(), '내용 test1');

insert into freeboard(writer, subject, reg_date, content)
values ('aaa', '제목 test2', now(), '내용 test2');

insert into freeboard(writer, subject, reg_date, content)
values ('bbb', '제목 test3', now(), '내용 test3');

select * from freeboard order by num desc;

select * 
from freeboard 
order by num desc
limit 0,10; --시작번호, 검색할 레코드 수 // mysql은 0부터 시작

delete from freeboard where num=5;