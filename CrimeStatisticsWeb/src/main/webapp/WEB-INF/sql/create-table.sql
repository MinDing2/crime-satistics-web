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


	-------------------------------------------------------

CREATE TABLE answer(
     answer_id NUMBER    PRIMARY KEY
    ,question_id NUMBER REFERENCES QUESTION(question_id)
    ,adminid VARCHAR2(50) REFERENCES ADMIN(adminid)
    ,answer_cont CLOB
    ,create_date DATE    DEFAULT SYSDATE
);

CREATE TABLE question (
     question_id NUMBER PRIMARY KEY,
     memberid VARCHAR2(50) REFERENCES member(memberid),
     question_title VARCHAR2(255) NOT NULL,
     question_content CLOB,
     create_date  DATE    DEFAULT SYSDATE
);

ALTER TABLE answer
MODIFY answer_id NUMBER(10, 0) NOT NULL;



-- "question_id"에 기본값 설정 (시퀀스를 사용하지 않음)
CREATE OR REPLACE TRIGGER set_question_id_default
BEFORE INSERT ON question
FOR EACH ROW
BEGIN
  IF :NEW.question_id IS NULL THEN
    SELECT COALESCE(MAX(question_id), 0) + 1 INTO :NEW.question_id FROM question;
  END IF;
END;

-- 시퀀스 생성
CREATE SEQUENCE answer_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE
  NOCACHE;

ALTER TABLE answer
MODIFY answer_id NUMBER DEFAULT answer_seq.NEXTVAL;
-------------------------------------------------------------------------
--여기까지 내 파일 이다음 합친 파일 (중복있음)
-------------------------------------------------------------------------------
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
    
-- 주문 정보 테이블
CREATE TABLE ORDERINFO (
    orderid             VARCHAR2(100)   NOT NULL,
    memberid            VARCHAR2(50)    NOT NULL,
    name                VARCHAR2(50)    NOT NULL,
    email               VARCHAR2(100)   NOT NULL,
    tel                 VARCHAR2(20)    NOT NULL,
    address             VARCHAR2(300)   NOT NULL,
    address_postcode    VARCHAR2(100)   NOT NULL,
    address_primary     VARCHAR2(100)   NOT NULL,
    address_detail      VARCHAR2(100),
    order_status        VARCHAR2(100)   NOT NULL,
    orderDate           DATE    DEFAULT SYSDATE,
    totalPrice          NUMBER(10)      NOT NULL,
    PRIMARY KEY(orderid)
);

-- order_status default값으로 'COMPLETEPAYMENT' 추가 

-- 주문 정보(외래키 추가)
ALTER TABLE ORDERINFO
ADD CONSTRAINT FK_ORDERINFO_MEMBER
FOREIGN KEY (memberid)
REFERENCES member(memberid);

-- 주문상세 테이블
CREATE TABLE ORDERDETAIL (
    detailid    NUMBER          NOT NULL,
    orderid     VARCHAR2(100)   NOT NULL,
    pdNum       NUMBER          NOT NULL,
    cartStock   NUMBER          NOT NULL,
    totalPrice  NUMBER          NOT NULL,
    PRIMARY KEY(detailid),
    FOREIGN KEY(orderid) REFERENCES ORDERINFO(orderid),
    FOREIGN KEY(pdNum)   REFERENCES PRODUCTS(pdNum)
);

-- 주문상세 시퀀스 생성
CREATE SEQUENCE ORDERDETAIL_SEQ;
 
-- 주문상세 시퀀스 생성
CREATE SEQUENCE reviewid_SEQ;   
-- 후기 테이블
CREATE TABLE Reviews (
    reviewid    NUMBER DEFAULT reviewid_seq.NEXTVAL PRIMARY KEY,
    memberid    VARCHAR2(50)    NOT NULL,
    pdNum       NUMBER          NOT NULL,
    reviewText  VARCHAR2(500)   NOT NULL,
    reviewImg   VARCHAR2(200),
    RATING NUMBER(2, 1),
    reviewDate  DATE DEFAULT SYSDATE,
    FOREIGN KEY (memberid) REFERENCES member(memberid),
    FOREIGN KEY (pdNum)    REFERENCES products(pdNum)
);

------------------------------------------------------------------
//메뉴 테이블 생성
//MENU_CATE = (1 : 자유게시판 , 2 : 지역게시판 )
 CREATE  TABLE    MENUS
 (
       MENU_ID     NUMBER(6)     PRIMARY KEY
    ,  MENU_NAME   VARCHAR2(30)  NOT NULL 
    ,  MENU_CATE   NUMBER(6)     NOT NULL
 )
 //메뉴 MENU_CATE = 1,2만 가능
 ALTER TABLE MENUS ADD CONSTRAINT CHECK_MENU_CATE CHECK(MENU_CATE IN(1, 2))

//메뉴 데이터 추가
INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'자유',1);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'서울',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'부산',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'대구',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'인천',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'광주',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'대전',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'울산',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'경기',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'강원',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'충북',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'충남',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'전북',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'전남',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'경북',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'경남',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'제주',2);
 ------------------------------------------------------------------------------------------------------------
 //게시판 테이블 생성
  CREATE   TABLE   BOARD
(
      BNUM            NUMBER(6, 0)        PRIMARY KEY
    , MENU_ID        NUMBER(6, 0)       NOT NULL
        REFERENCES   MENUS ( MENU_ID  )
    , TITLE          VARCHAR2( 300  )    NOT NULL
    , CONT           VARCHAR2( 4000 )                       
    , WRITER         VARCHAR2( 30 )
    , REGDATE        DATE                DEFAULT  SYSDATE 
    , READCOUNT      NUMBER( 6, 0 )      DEFAULT  0
    
)

//댓글 테이블 생성
<!--  1. rno : 댓글 고유번호
 2. bno : 게시물 고유번호
 3. writer : 댓글 작성자
 4. content : 댓글 내용
 5. regDate : 댓글 작성 날짜 -->
 
 CREATE TABLE REPLY
 (
   RNUM NUMBER(6,0) NOT NULL
  ,BNUM NUMBER(6,0) NOT NULL
  ,WRITER VARCHAR2(30) NOT NULL
  ,CONT VARCHAR2(4000)
  ,REGDATE DATE DEFAULT SYSDATE,
  PRIMARY KEY(RNUM,BNUM),
  FOREIGN KEY(BNUM) REFERENCES BOARD(BNUM)
  ON DELETE CASCADE  
 )


// 좋아요 테이블 생성 + 게시판 테이블 좋아요수 컬럼 추가 
 create table LIKES(
LIKENO NUMBER NOT NULL PRIMARY KEY ,
BNUM NUMBER,
MEMBERID VARCHAR2(50) NOT NULL,
LIKECHECK NUMBER DEFAULT 0 NOT NULL,
FOREIGN KEY (MEMBERID) REFERENCES MEMBER(MEMBERID) ON DELETE CASCADE,
FOREIGN KEY (BNUM) REFERENCES BOARD(BNUM) ON DELETE CASCADE 
);

ALTER TABLE BOARD ADD LIKEHIT NUMBER(6,0) DEFAULT 0;

// 공지사항 테이블 생성
CREATE TABLE NOTICE
(
NBNUM   NUMBER(6,0),
TITLE   VARCHAR2(300 BYTE) NOT NULL,
CONT   VARCHAR2(4000 BYTE),
WRITER   VARCHAR2(30 BYTE) NOT NULL,
REGDATE   DATE,
READCOUNT   NUMBER(6,0),
ENDDATE   DATE
)
----------------------------------------------------------------------
-----형파일(중복있음)
----------------------------------------------------------------------

//메뉴 테이블 생성
//MENU_CATE = (1 : 자유게시판 , 2 : 지역게시판 )
 CREATE  TABLE    MENUS
 (
       MENU_ID     NUMBER(6)     PRIMARY KEY
    ,  MENU_NAME   VARCHAR2(30)  NOT NULL 
    ,  MENU_CATE   NUMBER(6)     NOT NULL
 )
 //메뉴 MENU_CATE = 1,2만 가능
 ALTER TABLE MENUS ADD CONSTRAINT CHECK_MENU_CATE CHECK(MENU_CATE IN(1, 2))

//메뉴 데이터 추가
INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'자유',1);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'서울',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'부산',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'대구',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'인천',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'광주',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'대전',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'울산',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'경기',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'강원',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'충북',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'충남',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'전북',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'전남',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'경북',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'경남',2);
 INSERT INTO MENUS (MENU_ID, MENU_NAME, MENU_CATE)
 VALUES((SELECT NVL(MAX(MENU_ID), 0)+1  FROM  MENUS),'제주',2);
 ------------------------------------------------------------------------------------------------------------
 //게시판 테이블 생성
  CREATE   TABLE   BOARD
(
      BNUM            NUMBER(6, 0)        PRIMARY KEY
    , MENU_ID        NUMBER(6, 0)       NOT NULL
        REFERENCES   MENUS ( MENU_ID  )
    , TITLE          VARCHAR2( 300  )    NOT NULL
    , CONT           VARCHAR2( 4000 )                       
    , WRITER         VARCHAR2( 30 )
    , REGDATE        DATE                DEFAULT  SYSDATE 
    , READCOUNT      NUMBER( 6, 0 )      DEFAULT  0
    
)

//댓글 테이블 생성
<!--  1. rno : 댓글 고유번호
 2. bno : 게시물 고유번호
 3. writer : 댓글 작성자
 4. content : 댓글 내용
 5. regDate : 댓글 작성 날짜 -->
 
 CREATE TABLE REPLY
 (
  RNUM NUMBER(6,0) NOT NULL
  ,BNUM NUMBER(6,0) NOT NULL
  ,WRITER VARCHAR2(30) NOT NULL
  ,CONT VARCHAR2(4000)
  ,REGDATE DATE DEFAULT SYSDATE
  PRIMARY KEY(RNUM,BNUM),
  FOREIGN KEY(BNUM) REFERENCES BOARD(BNUM)
  ON DELETE CASCADE  
 )


// 좋아요 테이블 생성 + 게시판 테이블 좋아요수 컬럼 추가 
 create table LIKES(
LIKENO NUMBER NOT NULL PRIMARY KEY ,
BNUM NUMBER,
MEMBERID VARCHAR2(50) NOT NULL,
LIKECHECK NUMBER DEFAULT 0 NOT NULL,
FOREIGN KEY (MEMBERID) REFERENCES MEMBER(MEMBERID) ON DELETE CASCADE,
FOREIGN KEY (BNUM) REFERENCES BOARD(BNUM) ON DELETE CASCADE 
);

ALTER TABLE BOARD ADD LIKEHIT NUMBER(6,0) DEFAULT 0;

// 공지사항 테이블 생성
CREATE TABLE NOTICE
(
NBNUM   NUMBER(6,0),
TITLE   VARCHAR2(300 BYTE) NOT NULL
CONT   VARCHAR2(4000 BYTE),
WRITER   VARCHAR2(30 BYTE) NOT NULL,
REGDATE   DATE,
READCOUNT   NUMBER(6,0),
ENDDATE   DATE
)