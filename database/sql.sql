create table notice(
	notice_No bigint primary key,
    notice_title varchar(100) not null,
    notice_content text not null,
    notice_views int not null,
    notice_date timestamp not null
);
create table faq(
	faq_no bigint primary key,
    faq_title varchar(100) not null,
    notice_content text not null,
    iqc_no int
);

insert into notice(notice_title,notice_content,notice_views,notice_date) values("글내용 테스트중입니다","집에가고싶다",0,now());
insert into notice(notice_title,notice_content,notice_views,notice_date) values("글내용 테스트중입니다","집에가고싶다",0,now());
insert into notice(notice_title,notice_content,notice_views,notice_date) values("글내용 테스트중입니다","집에가고싶다",0,now());
insert into notice(notice_title,notice_content,notice_views,notice_date) values("글내용 테스트중입니다","집에가고싶다",0,now());
insert into notice(notice_title,notice_content,notice_views,notice_date) values("글내용 테스트중입니다","집에가고싶다",0,now());
insert into notice(notice_title,notice_content,notice_views,notice_date) values("글내용 테스트중입니다","집에가고싶다",0,now());
insert into notice(notice_title,notice_content,notice_views,notice_date) values("글내용 테스트중입니다","집에가고싶다",0,now());
insert into notice(notice_title,notice_content,notice_views,notice_date) values("글내용 테스트중입니다","집에가고싶다",0,now());

insert into faq(faq_title,faq_content,iqc_no) values("글내용 테스트중입니다","집에가고싶다",1);
insert into faq(faq_title,faq_content,iqc_no) values("글내용 테스트중입니다","집에가고싶다",1);
insert into faq(faq_title,faq_content,iqc_no) values("글내용 테스트중입니다","집에가고싶다",1);
insert into faq(faq_title,faq_content,iqc_no) values("글내용 테스트중입니다","집에가고싶다",1);
insert into faq(faq_title,faq_content,iqc_no) values("글내용 테스트중입니다","집에가고싶다",1);
insert into faq(faq_title,faq_content,iqc_no) values("글내용 테스트중입니다","집에가고싶다",1);
insert into faq(faq_title,faq_content,iqc_no) values("글내용 테스트중입니다","집에가고싶다",1);
insert into faq(faq_title,faq_content,iqc_no) values("글내용 테스트중입니다","집에가고싶다",1);
insert into faq(faq_title,faq_content,iqc_no) values("글내용 테스트중입니다","집에가고싶다",1);
insert into faq(faq_title,faq_content,iqc_no) values("글내용 테스트중입니다","집에가고싶다",1);


select * from notice where notice_No=73;
select * from notice;
update notice set notice_views=notice_views+1 where notice_No=1;
select * from faq;
select * from notice where notice_title like '%%';
select * from notice where notice_title like '%%';

create table qna(
	qna_no bigint primary key,
    notice_title varchar(100) not null,
    notice_content text not null,
    notice_views int not null,
    notice_date timestamp not null
);

create table customer(
	customer_no bigint primary key,
    customer_id varchar(20) not null,
    customer_pw varchar(20) not null,
    customer_name varchar(20) not null,
    customer_tel varchar(20),
    postal_code varchar(20),
    address_road varchar(20),
    address_detail varchar(20),
    adminchk int,
    customer_email varchar(45),
    reg_date date,
    quit_date date
);
desc customer;
select * from customer;
select customer_id from customer where customer_id='tldn0631';
insert into customer(customer_id,customer_pw,customer_name,customer_tel,postal_code,address_road,address_detail,customer_email,reg_date) values('test','1324','홍길동','010-1111-2222','02233','서울시 구로구','코오롱','test@test.com',now());