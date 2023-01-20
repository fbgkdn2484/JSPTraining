drop table reply;

create table reply(
     rnum int not null primary key auto_increment,
     rwriter varchar(20) not null,     
     reply varchar(500) not null,
     rreg_date datetime not null,
     ref int not null,
     FOREIGN KEY(rwriter) REFERENCES member(id),
     FOREIGN KEY(ref) REFERENCES freeboard(num)
);

-- ref 원 글 번호

insert into reply(rwriter, reply, rreg_date, ref)
values ('aaa', '하하하', now(), 2);

insert into reply(rwriter, reply, rreg_date, ref)
values ('bbb', '히히히', now(), 1);

select * from reply order by ref;

