create table company(
     comp_id varchar(50) not null primary key,
     comp_user_name varchar(30) not null,
     comp_passwd varchar(20) not null,
     COMP_TEL varchar(13) not null,
     comp_num varchar(30) not null,
     comp_name varchar(30) not null,
     comp_img varchar(100) default 'nothing.jpg',
     COMP_EMPL varchar(30) not null,
     COMP_HEAD int not null,
     COMP_TYPE varchar(30) not null,
     COMP_DATE datetime not null,
     COMP_SALE int not null,
     COMP_HTTP varchar(300) not null,
     COMP_ADDR varchar(30) not null,
     comp_reg_date datetime not null
);


select * from company;

drop table company;

update company set comp_user_name = '유하우', COMP_TEL = '01023423546', comp_num = '123124', comp_name = '몰루', comp_img = 'awsdfsda', COMP_EMPL = '합자회사', COMP_HEAD = 123, COMP_TYPE = '디자인',  COMP_SALE = 1231512, COMP_HTTP = 'www.dsf', COMP_ADDR = 'dkfqksh' where comp_id= 'ekdud@naver.com'

