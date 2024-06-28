-- product_category 추가 전 세팅
set foreign_key_checks=0;

delete from product;
alter table product auto_increment = 1;
delete from product_category;
alter table product_category auto_increment = 1;

set foreign_key_checks=1;


-- product_category 추가
insert into product_category(pc_name,pc_level) values('사료',1);
insert into product_category(pc_name,pc_level) values('간식',1);
insert into product_category(pc_name,pc_level) values('장난감',1);
insert into product_category(pc_name,pc_level) values('미용용품',1);
insert into product_category(pc_name,pc_level) values('위생용품',1);

insert into product_category(pc_name,pc_level,pc_parent_no) values('건식사료',2,1);
insert into product_category(pc_name,pc_level,pc_parent_no) values('습식사료',2,1);

insert into product_category(pc_name,pc_level,pc_parent_no) values('강아지껌',2,2);
insert into product_category(pc_name,pc_level,pc_parent_no) values('수제간식',2,2);
insert into product_category(pc_name,pc_level,pc_parent_no) values('육포',2,2);

insert into product_category(pc_name,pc_level,pc_parent_no) values('공/원반',2,3);
insert into product_category(pc_name,pc_level,pc_parent_no) values('인형',2,3);

insert into product_category(pc_name,pc_level,pc_parent_no) values('발톱관리용품',2,4);
insert into product_category(pc_name,pc_level,pc_parent_no) values('드라이기',2,4);
insert into product_category(pc_name,pc_level,pc_parent_no) values('브러쉬',2,4);
insert into product_category(pc_name,pc_level,pc_parent_no) values('샴푸/린스',2,4);

insert into product_category(pc_name,pc_level,pc_parent_no) values('구강위생용품',2,5);
insert into product_category(pc_name,pc_level,pc_parent_no) values('기저귀',2,5);
insert into product_category(pc_name,pc_level,pc_parent_no) values('배변봉투',2,5);
insert into product_category(pc_name,pc_level,pc_parent_no) values('배변패드',2,5);


select * from product_category;