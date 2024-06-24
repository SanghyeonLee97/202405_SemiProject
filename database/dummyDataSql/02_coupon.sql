-- coupon 테이블 데이터 삭제
set foreign_key_checks = 0;

delete from coupon;
alter table coupon auto_increment = 1;

set foreign_key_checks = 1;


-- coupon 테이블 데이터 삽입
insert into coupon (coupon_name, coupon_limit, coupon_discount) value ('1,000원 할인쿠폰', null, 1000);
insert into coupon (coupon_name, coupon_limit, coupon_discount) value ('2,000원 할인쿠폰', null, 2000);
insert into coupon (coupon_name, coupon_limit, coupon_discount) value ('3,000원 할인쿠폰', null, 3000);
insert into coupon (coupon_name, coupon_limit, coupon_discount) value ('4,000원 할인쿠폰', null, 4000);
insert into coupon (coupon_name, coupon_limit, coupon_discount) value ('5,000원 할인쿠폰', null, 5000);

select * from coupon;