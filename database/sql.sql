create table testdb(
	a int primary key,
    b varchar(5)
);
select * from testdb;

create table notice(
	noticeNo int primary key,
    categoryNo int,
    title varchar(100),
    content text,
     registrationDate timestamp,
    views int
);
select * from notice;
insert into notice values(1,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(2,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(3,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(4,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(5,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(6,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(7,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(8,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(9,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(10,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(11,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(12,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(13,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(14,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(15,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(16,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(17,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(18,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(19,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(20,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(21,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice values(22,1,"테스트","글내용 테스트중입니다",now(),0);
insert into notice(categoryNo,title,content,registrationDate,views) values(1,"글제목 테스트중입니다","글내용 테스트중입니다",now(),0);
insert into notice(categoryNo,title,content,registrationDate,views) values(1,"글제목 테스트중입니다","글내용 테스트중입니다",now(),0);
insert into notice(categoryNo,title,content,registrationDate,views) values(1,"글제목 테스트중입니다","글내용 테스트중입니다",now(),0);
insert into notice(categoryNo,title,content,registrationDate,views) values(1,"글제목 테스트중입니다","글내용 테스트중입니다",now(),0);
insert into notice(categoryNo,title,content,registrationDate,views) values(1,"글제목 테스트중입니다","글내용 테스트중입니다",now(),0);
insert into notice(categoryNo,title,content,registrationDate,views) values(1,"글제목 테스트중입니다","글내용 테스트중입니다",now(),0);
insert into notice(categoryNo,title,content,registrationDate,views) values(1,"글제목 테스트중입니다","글내용 테스트중입니다",now(),0);
insert into notice(categoryNo,title,content,registrationDate,views) values(1,"글제목 테스트중입니다","글내용 테스트중입니다",now(),0);
insert into notice(categoryNo,title,content,registrationDate,views) values(1,"글제목 테스트중입니다","글내용 테스트중입니다",now(),0);
insert into notice(categoryNo,title,content,registrationDate,views) values(1,"글제목 테스트중입니다","글내용 테스트중입니다",now(),0);

select * from notice;
desc notice;
delete from notice where views=0;
drop table notice;
select * from notice where title like "%트중%";
