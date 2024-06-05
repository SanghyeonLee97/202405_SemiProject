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



select * from notice;
update notice set 
select * from faq;
select * from notice where notice_title like '%%';
select * from notice where notice_title like '%%';