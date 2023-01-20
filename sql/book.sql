drop table book;

create table book(
     bnum int not null primary key auto_increment,
     bkind varchar(3) not null,
     btitle varchar(100) not null,
     author varchar(40) not null,
     pubcom varchar(40) not null,
     pubdate datetime  not null,
     page int not null,
     bimage varchar(100) default 'nothing.jpg',     
     bcontent text not null
);

insert into book(bkind, btitle, author, pubcom, pubdate, page, bimage, bcontent)
values ('100', '미분적분학:대학수학의 첫걸음', '수학교재편찬위원회', '한빛아카데미', '2021-01-06', 620, 'a1234.jpg', '이공계 신입생을 위한 미분적분학 맞춤 기본서...');

insert into book(bkind, btitle, author, pubcom, pubdate, page, bimage, bcontent)
values ('100', '파이썬 자료구조와 알고리즘', '우재남', '한빛아카데미', '2021-01-23', 520, '파이썬 자료구조와 알고리즘.jpg', '파이썬으로 구현하며 다지는 논리적 사고를 위한 기초 체력...');


select * from book;	

select * from book where btitle like '%자료%';