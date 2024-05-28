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
    registrationDate date,
    views int
);
select * from notice;
insert into notice values(1,1,"테스트","글내용 테스트중입니다","2024-05-28",0);