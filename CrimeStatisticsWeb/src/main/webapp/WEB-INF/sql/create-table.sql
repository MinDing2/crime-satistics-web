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
	cateCodeRef	VARCHAR2(30)	NULL,
	PRIMARY KEY(cateCode),
	FOREIGN KEY(cateCodeRef) 	REFERENCES	products_category(cateCode)
);

// 상품 카테고리 CATENAME 크기 변경
ALTER TABLE PRODUCTS_CATEGORY
MODIFY (CATENAME VARCHAR2(100));

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
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('액체 페퍼 스프레이건', '101', '100');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('액체가스총', '102', '100');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('미니오토건 가스총', '103', '100');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('미니오토건 보충약제통 강력 시력일시 상실', '104', '100');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('호신용 가스총 스프레이 여성호신용품 에이스건', '105', '100');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('호신용 스프레이 건 B-45S 호신무기 고압분사 가스총', '106', '100');

INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE) VALUES('스프레이', '200');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('페퍼 슈코빌 스프레이', '201', '200');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('여성 호신용품 강력 액체 스프레이', '202', '200');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('캡사이신 스프레이', '203', '200');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('여성 호신용품 와사비 스프레이', '204', '200');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('스팅어 호신용품 여성귀가 안심총 4세대 묻지마대처용', '205', '200');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('호신용품 은장도 호신스프레이 치한 시력 일시상실', '206', '200');

INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE) VALUES('전기충격기', '300');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('보인다고 휴대용 충격기 B2 고충격 호신용품', '301', '300');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('보인다고 호신장비 블랙코브라 자기방어장비', '302', '300');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('전자충격기 여성호신용품 (전용케이스미포함)', '303', '300');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('호신용 핑크 전기충격기 로즈골드 블랙 전자충격기', '304', '300');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('후레쉬 호신용 전기충격기 여성호신용품 휴대용', '305', '300');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('ESP-1 전기 충격기 파워 B+ 최고급형 단품 + 사은품 미니 호루라기', '306', '300');

INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE) VALUES('삼단봉', '400');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('위급상황대비 호신용 강력 삼단봉 간편 휴대용 접이식', '401', '400');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('호신용 삼단봉 휴대용 여성 호신용품', '402', '400');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('샤네끄 호신용 삼단봉 기본형', '403', '400');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('티타늄 소재 호신용 삼단봉 (저가형 비교불가)', '404', '400');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('마켓민 삼단봉 확장형', '405', '400');
INSERT INTO PRODUCTS_CATEGORY (CATENAME, CATECODE, CATECODEREF) VALUES('FI-JB2301 초경량 호신용 휴대용 삼단봉 기본형', '406', '400');

COMMIT;
------------------------------------------------------------------------------------------------------------------------------------------------
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