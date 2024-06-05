use studydb;
show tables;
create table members(
	mno	integer	not null comment '회원일련번호',
    email varchar(20) not null comment '이메일',
    pwd varchar(15) not null,
    mname varchar(50) not null,
    cre_date datetime not null comment '가입일',
    mod_date datetime not null comment '마지막 변경일'
) comment '회원';

alter table members
	add primary key(mno);

alter table members
	modify column mno integer not null auto_increment;

insert into members(email,pwd,mname,cre_date,mod_date)
	values('admin@test.com','1234','관리자',now(),now());
insert into members(email,pwd,mname,cre_date,mod_date)
	values('qqqqq@test.com','1234','가가가',now(),now());
insert into members(email,pwd,mname,cre_date,mod_date)
	values('wwwww@test.com','1234','나나나',now(),now());
    
select * from members;
delete from members where mno=2;
update members set email='a@test.com', mname='홍길동님',mod_date=now() where mno=3;

select mno,mname,email,cre_date from members order by mno desc;
select mno,email,mname,cre_date from members where mno=3;