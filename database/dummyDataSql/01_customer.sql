-- customer 추가 전 세팅
set foreign_key_checks=0;
delete from customer;
alter table customer auto_increment = 1;
set foreign_key_checks=1;

-- customer 추가
insert into customer (customer_id, customer_pw, customer_name, customer_tel, postal_code, address_road, address_detail, admin, customer_email, reg_date, customer_point)
	values('admin', '1234', '관리자', '01012345678', '08390', '서울특별시 구로구 디지털로30길 31', '코오롱디지털타워빌란트 2차 204호', 1, 'admin@dengdeng.com', '2024-03-22', 99999999);
insert into customer(customer_id, customer_pw, customer_name, customer_tel, postal_code, address_road, address_detail, customer_email, reg_date, customer_point)
		value('hong', '1234', '홍길동', '01011111111', '46586', '부산광역시 북구 낙동북로663번나길 58', '세명개발', 'hong@test.com', '2024-04-02', 2000);
insert into customer(customer_id, customer_pw, customer_name, customer_tel, postal_code, address_road, address_detail, customer_email, reg_date, customer_point)
		value('kang', '1234', '강감찬', '01022222222', '10513', '경기도 고양시 덕양구 행신로143번길 72-6', '코머스', 'kang@test.com', '2024-04-15', 4500);
insert into customer(customer_id, customer_pw, customer_name, customer_tel, postal_code, address_road, address_detail, customer_email, reg_date, customer_point)
		value('lee', '1234', '이순신', '01033333333', '32206', '충남 홍성군 서부면 남당항로213번길 1-1', '남당항', 'lee@test.com', '2024-05-01', 10500);
insert into customer(customer_id, customer_pw, customer_name, customer_tel, postal_code, address_road, address_detail, customer_email, reg_date, customer_point)
		value('kim', '1234', '김구', '01055555555', '59437', '전남 보성군 득량면 쇠실길 22-45', '백범김구선생은거기념관', 'kim@test.com', '2024-05-02', 6700);
insert into customer(customer_id, customer_pw, customer_name, customer_tel, postal_code, address_road, address_detail, customer_email, reg_date, customer_point)
		value('yu', '1234', '유관순', '01066666666', '31256', '충청남도 천안시 동남구 병천면 유관순길 38', '유관순열사유적지', 'yu@test.com', '2024-05-06', 9300);
insert into customer(customer_id, customer_pw, customer_name, customer_tel, postal_code, address_road, address_detail, customer_email, reg_date, customer_point)
		value('einstein', '1234', '아인슈타인', '01077777777', '63521', '제주특별자치도 서귀포시 안덕면 녹차분재로 218', '제주항공우주박물관', 'einstein@test.com', '2024-05-11', 8800);
insert into customer(customer_id, customer_pw, customer_name, customer_tel, postal_code, address_road, address_detail, customer_email, reg_date, customer_point)
		value('sejong', '1234', '세종대왕', '01088888888', '02456', '서울특별시 동대문구 회기로 56', '세종대왕기념관', 'kim@test.com', '2024-05-12', 7000);
insert into customer(customer_id, customer_pw, customer_name, customer_tel, postal_code, address_road, address_detail, customer_email, reg_date, customer_point)
		value('yulgok', '1234', '율곡이이', '01099999999', '10825', '경기도 파주시 법원읍 자운서원로 204', '자운서원', 'yulgok@test.com', '2024-05-19', 6900);
insert into customer(customer_id, customer_pw, customer_name, customer_tel, postal_code, address_road, address_detail, customer_email, reg_date, customer_point)
		value('jang', '1234', '장보고', '01000000000', '59104', '전라남도 완도군 완도읍 청해진로 1455', '장보고 기념관', 'jang@test.com', '2024-05-12', 9500);

select * from customer;