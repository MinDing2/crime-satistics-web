CREATE TABLE member (
    memberid         VARCHAR2(50)  PRIMARY KEY,
    passwd           VARCHAR2(50)         NOT NULL,
    name             VARCHAR2(50)         NOT NULL,
    nickname         VARCHAR2(50)  UNIQUE NOT NULL,
    address          VARCHAR2(100)        NOT NULL,
    email            VARCHAR2(100) UNIQUE NOT NULL,
    sex              VARCHAR2(10)         NOT NULL,
    address_postcode VARCHAR2(100),
    address_primary  VARCHAR2(100),
    address_detail   VARCHAR2(100),
    email_id         VARCHAR2(100),
    email_domain     VARCHAR2(100),
    regdate   DATE          DEFAULT SYSDATE
);

CREATE TABLE admin (
    adminid     VARCHAR2(50)    PRIMARY KEY,
    passwd      VARCHAR2(50)    NOT NULL,
    nickname    VARCHAR2(50)    NOT NULL,
    email       VARCHAR2(100)   UNIQUE NOT NULL
);


INSERT INTO admin (adminid, passwd, nickname, email)
VALUES ('admin12', '1234', 'root', 'root@naver.com');

SELECT * FROM member;
SELECT * FROM admin;

---------------------------------------------------------------
// 상품 테이블 생성
CREATE TABLE products (
	pdNum		NUMBER			PRIMARY KEY,
	pdName		VARCHAR2(50)	NOT NULL,
	cateCode	VARCHAR2(30)	NOT NULL,
	pdPrice		NUMBER			NOT NULL,
	pdStock		NUMBER			NULL,
	pdDes		VARCHAR2(500)	NULL,
	pdImg		VARCHAR2(200)	NULL,
	pdDate		DATE			DEFAULT 	SYSDATE
);

// 상품 카테고리 테이블 생성
CREATE TABLE products_category (
	cateName	VARCHAR2(20)	NOT NULL,
	cateCode	VARCHAR2(30)	NOT NULL,
	PRIMARY KEY(cateCode),
);

// 상품 카테고리 CATENAME 크기 변경
ALTER TABLE PRODUCTS_CATEGORY
MODIFY (CATENAME VARCHAR2(50));

// 상품 테이블에 외래키 추가
ALTER TABLE products ADD
	CONSTRAINT fk_products_category
	FOREIGN KEY (cateCode)
		REFERENCES products_category(cateCode);

// 상품 번호 시퀀스
CREATE SEQUENCE products_seq
START 	  WITH 1
INCREMENT BY 1 NOCACHE;


---------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE) VALUES('스프레이건', '100');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE) VALUES('스프레이', '200');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE) VALUES('전기충격기', '300');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE) VALUES('삼단봉', '400');

COMMIT;
------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE products ADD (pdThumbImg VARCHAR2(200));

SELECT * FROM products;


---------------------------------------------------------------------------------------------------------------------------
// 장바구니 테이블
CREATE TABLE cart (
	cartNum		NUMBER			NOT NULL,
	memberid	VARCHAR2(50)	NOT NULL,
	pdNum		NUMBER			NOT NULL,
	cartStock	NUMBER			NOT NULL,
	addDate		DATE			DEFAULT		SYSDATE,
	PRIMARY KEY (cartNum, memberid)
);

// 카트 번호 생성 시퀀스
CREATE SEQUENCE cart_seq
	   INCREMENT BY 1
	   START WITH	1
	   NOCYCLE
	   NOCACHE;

// 외래키 생성1
alter table cart
    add constraint cart_memberid foreign key(memberid)
    references member(memberid);

// 외래키 생성2
alter table cart
    add constraint cart_pdNum foreign key(pdNum)
    references products(pdNum);