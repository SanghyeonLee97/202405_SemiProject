-- customercoupon 테이블 데이터 삭제
set foreign_key_checks = 0;

delete from customercoupon;
alter table customercoupon auto_increment = 1;

set foreign_key_checks = 1;

-- customercoupon 추가
insert into customercoupon (customer_no, coupon_no, quantity, coupon_duedate) value (1, 1, 100, '2100-12-31');
insert into customercoupon (customer_no, coupon_no, quantity, coupon_duedate) value (1, 2, 100, '2100-12-31');
insert into customercoupon (customer_no, coupon_no, quantity, coupon_duedate) value (1, 3, 100, '2100-12-31');
insert into customercoupon (customer_no, coupon_no, quantity, coupon_duedate) value (1, 4, 100, '2100-12-31');
insert into customercoupon (customer_no, coupon_no, quantity, coupon_duedate) value (1, 5, 100, '2100-12-31');

select * from customercoupon;