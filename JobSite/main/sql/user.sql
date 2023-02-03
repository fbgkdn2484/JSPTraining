create table user(
     user_num int not null primary key auto_increment,
     user_id varchar(20) not null,
     user_sex varchar(13),
     user_mil_mil varchar(13),
     user_mil_type varchar(13),
     user_mil_rnk varchar(13),
     user_stu varchar(13),
     
     user_mid_name varchar(30),
     user_mid_area varchar(30),
     user_mid_sdate datetime,
     user_mid_edate datetime,
     user_mid_grad varchar(30),
     
     user_high_name varchar(30),
     user_high_area varchar(30),
     user_high_GED varchar(30),
     user_high_Gdate varchar(30),
     user_high_sdate datetime,
     user_high_edate datetime,
     user_high_trans varchar(30),
     user_high_grad varchar(30),
     user_high_major varchar(30),
     
     user_univ_type1 varchar(30),
     user_univ_name1 varchar(30),
     user_univ_area1 varchar(30),
     user_univ_sdate1 datetime,
     user_univ_edate1 datetime,
     user_univ_grad1 varchar(30),
     user_univ_major1 varchar(30),
     user_univ_nm1 varchar(30),
     user_univ_cdit1 FLOAT,
     
     user_univ_type2 varchar(30),
     user_univ_name2 varchar(30),
     user_univ_area2 varchar(30),
     user_univ_sdate2 datetime,
     user_univ_edate2 datetime,
     user_univ_grad2 varchar(30),
     user_univ_major2 varchar(30),
     user_univ_nm2 varchar(30),
     user_univ_cdit2 FLOAT,
     
     user_univ_type3 varchar(30),
     user_univ_name3 varchar(30),
     user_univ_area3 varchar(30),
     user_univ_sdate3 datetime,
     user_univ_edate3 datetime,
     user_univ_grad3 varchar(30),
     user_univ_major3 varchar(30),
     user_univ_nm3 varchar(30),
     user_univ_cdit3 FLOAT,
     
     user_caeer varchar(30),
     
     user_caeer_name1 varchar(30),
     user_caeer_sdate1 datetime,
     user_caeer_edate1 datetime,
     user_caeer_leave1 varchar(30),
     user_caeer_jobt1 varchar(30),
     user_caeer_dept1 varchar(30),
     user_caeer_linc1 varchar(30),
     user_caeer_area1 varchar(30),
     user_caeer_sale1 varchar(30),
     
     user_caeer_name2 varchar(30),
     user_caeer_sdate2 datetime,
     user_caeer_edate2 datetime,
     user_caeer_leave2 varchar(30),
     user_caeer_jobt2 varchar(30),
     user_caeer_dept2 varchar(30),
     user_caeer_linc2 varchar(30),
     user_caeer_area2 varchar(30),
     user_caeer_sale2 varchar(30),
     
     user_caeer_name3 varchar(30),
     user_caeer_sdate3 datetime,
     user_caeer_edate3 datetime,
     user_caeer_leave3 varchar(30),
     user_caeer_jobt3 varchar(30),
     user_caeer_dept3 varchar(30),
     user_caeer_linc3 varchar(30),
     user_caeer_area3 varchar(30),
     user_caeer_sale3 varchar(30),
     
     user_caeer_name4 varchar(30),
     user_caeer_sdate4 datetime,
     user_caeer_edate4 datetime,
     user_caeer_leave4 varchar(30),
     user_caeer_jobt4 varchar(30),
     user_caeer_dept4 varchar(30),
     user_caeer_linc4 varchar(30),
     user_caeer_area4 varchar(30),
     user_caeer_sale4 varchar(30),
     
     user_licen_type1 varchar(30),
     user_licen_name1 varchar(30),
     user_licen_publ1 varchar(30),
     user_licen_pass1 varchar(30),
     user_licen_date1 datetime,
     
     user_licen_type2 varchar(30),
     user_licen_name2 varchar(30),
     user_licen_publ2 varchar(30),
     user_licen_pass2 varchar(30),
     user_licen_date2 datetime,
     
     user_licen_type3 varchar(30),
     user_licen_name3 varchar(30),
     user_licen_publ3 varchar(30),
     user_licen_pass3 varchar(30),
     user_licen_date3 datetime,
     
     reg_date datetime not null,
     
     FOREIGN KEY(user_id) REFERENCES members(id)
);

select * from user;


select * from user where user_id = '123';

delete from user where user_num = 1;
drop table user;
