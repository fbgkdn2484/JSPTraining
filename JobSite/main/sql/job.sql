create table job(
     job_num int not null primary key auto_increment,
     job_id varchar(20) not null,   
	 job_subject varchar(50) not null, 
	 job_content varchar(20) not null,  
	 job_image varchar(100) default 'nothing.jpg', 
	 job_sdate datetime not null,	
	 job_edate datetime not null,	
	 job_caeer varchar(20) not null,  
	 job_stu varchar(20) not null,  
	 job_empl varchar(20) not null,  
	 job_money varchar(20) not null,  
	 job_up varchar(20) not null,  
	 job_area varchar(20) not null,  
	 job_cond varchar(20) not null,  
	 job_job varchar(20) not null,
	 job_head int default 0,
	 job_readcount int default 0,
	 FOREIGN KEY(job_id) REFERENCES company(comp_id)	

);


select a.comp_user_name, a.comp_name, a.comp_img, a.COMP_EMPL, a.COMP_HEAD, a.COMP_TYPE, a.COMP_DATE, a.COMP_SALE, a.COMP_HTTP, a.comp_addr, b.job_num,
		b.job_subject, b.job_content, b.job_content, b.job_image, b.job_sdate, b.job_edate, b.job_caeer, b.job_stu, b.job_empl, b.job_money,
		b.job_up, b.job_area, b.job_cond, b.job_job, b.job_head, b.job_readcount
from company a
right join job b
on a.comp_id = b.job_id;

select * from job;

select a.comp_user_name, a.comp_name, a.comp_img, a.COMP_EMPL, a.COMP_HEAD, a.COMP_TYPE, a.COMP_DATE, a.COMP_SALE, a.COMP_HTTP, a.comp_addr, b.job_num,
		b.job_subject, b.job_content, b.job_content, b.job_image, b.job_sdate, b.job_edate, b.job_caeer, b.job_stu, b.job_empl, b.job_money,
		b.job_up, b.job_area, b.job_cond, b.job_job, b.job_head, b.job_readcount
from company a
right join job b
on a.comp_id = b.job_id;
