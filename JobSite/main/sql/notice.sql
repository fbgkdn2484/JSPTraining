create table notice(
     nnum int not null primary key auto_increment,
     nwriter varchar(20) not null,     
     nsubject varchar(50) not null,
     nreg_date datetime not null,		
     nreadcount int default 0,
     ncontent text not null,
     nimage varchar(100) default 'nothing.jpg',   
     FOREIGN KEY(nwriter) REFERENCES members(id)		
);

select * from notice;

drop table notice;
