create table notice(
	notice_No bigint primary key auto_increment,
    notice_title varchar(100) not null,
    notice_content text not null,
    notice_views int not null default 0,
    notice_date timestamp not null default now()
);
insert into notice(notice_title,notice_content) values('글제목 테스트','글내용 테스트');

create table inquiry_category(
	iqc_no int primary key,
    iqc_name varchar(45) not null
);
insert into inquiry_category values(1,'카테고리테스트');

create table faq(
	faq_no bigint primary key auto_increment,
    faq_title varchar(100) not null,
    faq_content text not null,
    iqc_no int not null,
    foreign key(iqc_no) references inquiry_category(iqc_no)
);
insert into faq(faq_title,faq_content,iqc_no) values('글제목 테스트','글내용 테스트',1);

create table customer(
	customer_no bigint primary key auto_increment,
    customer_id varchar(20) not null,
    customer_pw varchar(20) not null,
    customer_name varchar(20) not null,
    customer_tel varchar(20),
    postal_code varchar(5) not null,
    address_road varchar(100),
    address_detail varchar(150),
    admin int not null default 0,
    customer_email varchar(45),
    reg_date date not null,
    quit_date date,
    customer_point bigint not null default(0)
);
insert into customer(customer_id,customer_pw,customer_name,customer_tel,postal_code,address_road,address_detail,customer_email,reg_date)
		value('아이디테스트','비번테스트','이름테스트','01011112222','12345','주소테스트','상세주소테스트','이메일테스트',now());
        
create table qna(
	qna_no bigint primary key auto_increment,
    qna_title varchar(100) not null,
    qna_content text not null,
    qna_fileurl varchar(100),
    qna_imgurl varchar(100),
    qna_date timestamp not null,
    qna_answer text,
    customer_no bigint not null,
    iqc_no int not null,
    foreign key(iqc_no) references inquiry_category(iqc_no),
    foreign key(customer_no) references customer(customer_no)
);
insert into qna(qna_title,qna_content,qna_fileurl,qna_imgurl,qna_date,customer_no,iqc_no) values('제목테스트','내용테스트','','',now(),1,1);

create table sns_event(
	se_no bigint primary key auto_increment,
    se_imgurl varchar(100),
    se_url varchar(100) not null,
    se_date date not null,
    customer_no bigint,
    foreign key(customer_no) references customer(customer_no)
);
insert into sns_event(se_imgurl,se_url,se_date,customer_no) values('','https://www.naver.com',now(),1);

create table product_category(
	pc_no int primary key auto_increment,
    pc_name varchar(30) not null,
    pc_level int not null,
    pc_parent_no int,
    foreign key(pc_parent_no) references product_category(pc_no)
);
insert into product_category(pc_name,pc_level) values('부모',1);
insert into product_category(pc_name,pc_level,pc_parent_no) values('자식',2,1);

create table product(
	product_no bigint primary key auto_increment,
    product_name varchar(100) not null,
    product_imgurl varchar(100),
    product_price int not null,
    product_stock int not null,
    product_detail text,
    sold_count int not null default(0),
    product_size varchar(45),
    product_color varchar(20),
    maker varchar(100),
    product_mfd date,
    product_poo varchar(100),
    product_epd date,
    pc_no int not null,
    foreign key(pc_no) references product_category(pc_no)
);
insert into product(product_name,product_imgurl,product_price,product_stock,product_detail,product_size,product_color,maker,product_mfd,product_poo,product_epd,pc_no) values('제품이름','',3000,50,'제품디테일','사이즈','색상','메이커','2000-01-01','','2000-01-01',2);
        
create table discount(
	product_no bigint primary key,
	discount_rate int not null,
    discount_amount int not null,
    foreign key(product_no) references product(product_no)
);
insert into discount values(1,50,2000);

create table product_inquiry(
	pi_no bigint primary key auto_increment,
    pi_title varchar(100) not null,
    pi_content text not null,
    pi_date timestamp not null,
    pi_status int not null default(0),
    product_no bigint,
    foreign key(product_no) references product(product_no)
);
insert into product_inquiry(pi_title,pi_content,pi_date,product_no) values('제목테스트','내용테스트',now(),1);

create table review(
	review_no bigint primary key auto_increment,
    purchase_date date not null,
    review_title varchar(100) not null,
    review_content text not null,
    review_rating int not null,
    product_no bigint not null,
    customer_no bigint not null,
	foreign key(product_no) references product(product_no),
    foreign key(customer_no) references customer(customer_no)
);
insert into review(purchase_date,review_title,review_content,review_rating,product_no,customer_no) values('2000-01-01','제목테스트','내용테스트',4,1,1);

create table event(
	event_no bigint primary key auto_increment,
    event_url varchar(100) not null,
    event_start_date date not null,
    event_end_date date
);
insert into event(event_url,event_start_date,event_end_date) values('https://www.naver.com',now(),'2222-2-22');

create table dibs(
	customer_no bigint,
    product_no bigint,
    foreign key(customer_no) references customer(customer_no),
    foreign key(product_no) references product(product_no),
    primary key(customer_no,product_no)
);
insert into dibs(customer_no,product_no) values(1,1);

create table cart(
	cart_no bigint primary key auto_increment,
    customer_no bigint not null,
    product_no bigint not null,
    product_quantity bigint not null,
    foreign key(customer_no) references customer(customer_no),
    foreign key(product_no) references product(product_no)
);
insert into cart(customer_no,product_no,product_quantity) values(1,1,5);

create table point(
	point_no bigint primary key auto_increment,
    point_amount int not null,
    point_detail varchar(100),
    customer_no bigint not null,
    product_no bigint not null,
    foreign key(customer_no) references customer(customer_no),
    foreign key(product_no) references product(product_no)
);
insert into point(point_amount,point_detail,customer_no,product_no) values(3000,'상세정보',1,1);

create table coupon(
	coupon_no bigint primary key auto_increment,
    coupon_name varchar(100) not null,
    coupon_limit varchar(100),
    coupon_discount int not null,
    product_no bigint,
    foreign key(product_no) references product(product_no)
);
insert into coupon(coupon_name,coupon_limit,coupon_discount,product_no) values('쿠폰이름','제한사항',3000,1);

create table customercoupon(
	customer_no bigint not null,
    coupon_no bigint not null,
    quantity bigint not null,
    coupon_duedate date,
    foreign key(customer_no) references customer(customer_no),
    foreign key(coupon_no) references coupon(coupon_no),
    primary key(customer_no,coupon_no)
);
insert into customercoupon(customer_no,coupon_no,Quantity,coupon_duedate) values(1,1,2,'2222-2-22');

create table orderproduct(
	customer_no bigint,
    product_no bigint,
    coupon_no bigint,
    order_quantity bigint not null,
    foreign key(customer_no) references customer(customer_no),
    foreign key(product_no) references product(product_no),
    foreign key(coupon_no) references coupon(coupon_no),
    primary key(customer_no,product_no)
);
insert into orderproduct values(1,1,1,2);

CREATE TABLE point (
  `point_no` INT NOT NULL auto_increment,
  `point_status` boolean NOT NULL,
  `point_amount` INT NOT NULL,
  `orderproduct_customer_no` BIGINT NOT NULL,
  `orderproduct_product_no` BIGINT NOT NULL,
  PRIMARY KEY (`point_no`),
  INDEX `fk_point_orderproduct_idx` (`orderproduct_customer_no` ASC, `orderproduct_product_no` ASC),
  CONSTRAINT `fk_point_orderproduct`
    FOREIGN KEY (`orderproduct_customer_no` , `orderproduct_product_no`)
    REFERENCES `projectdb`.`orderproduct` (`customer_no` , `product_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
insert into point(point_status,point_amount,orderproduct_customer_no,orderproduct_product_no) values(0,3000,1,1);