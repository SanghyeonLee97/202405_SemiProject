-- inquiry_category 추가 전 세팅
set foreign_key_checks=0;
delete from inquiry_category;
set foreign_key_checks=1;

-- inquiry_category 추가
insert into inquiry_category values
(1,'회원가입/로그인'), 
(2,'주문/결제'), 
(3,'배송문의'), 
(4,'취소/교환/반품');

select * from inquiry_category;
