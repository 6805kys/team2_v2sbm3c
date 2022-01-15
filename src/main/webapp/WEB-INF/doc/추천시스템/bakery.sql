/**********************************/
/* Table Name: 빵집 */
/**********************************/
DROP TABLE bakery CASCADE CONSTRAINTS;

CREATE TABLE bakery(
bakeryno                       NUMBER(10)  NOT NULL  PRIMARY KEY,
bakery                         VARCHAR2(100)  NOT NULL,
telephone                      NUMBER(13)  NULL ,
address                        VARCHAR2(100)  NULL ,
station                        VARCHAR2(30)  NULL ,
tag                            VARCHAR2(100)  NULL ,
rating                         DOUBLE PRECISION  NULL ,
signature                      VARCHAR2(90)  NULL ,
breadgrpno                     NUMBER(30)  NULL ,
  FOREIGN KEY (breadgrpno) REFERENCES breadgrp (breadgrpno)
);

COMMENT ON TABLE bakery is '빵집';
COMMENT ON COLUMN bakery.bakeryno is '빵집번호';
COMMENT ON COLUMN bakery.bakery is '빵집';
COMMENT ON COLUMN bakery.telephone is '전화번호';
COMMENT ON COLUMN bakery.address is '주소';
COMMENT ON COLUMN bakery.station is '역';
COMMENT ON COLUMN bakery.tag is '태그';
COMMENT ON COLUMN bakery.rating is '평점';
COMMENT ON COLUMN bakery.signature is '시그니쳐';
COMMENT ON COLUMN bakery.breadgrpno is '빵그룹번호';

DROP SEQUENCE bakery_seq;

CREATE SEQUENCE bakery_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  

-- C
INSERT INTO bakery(bakeryno, bakery, telephone, address, station, tag, rating, signature, breadgrpno)
VALUES (bakery_seq.nextval, '장불랑제리', '0200000000', '관악구', '서울대입구역', '맘모스빵, 단팥빵, 단팥생크림빵', '5.0', '맘모스빵', 1);

commit;

-- R(List)
SELECT bakeryno, bakery, telephone, address, station, tag, rating, signature, breadgrpno FROM bakery ORDER BY breadgrpno;
      
-- R(Read)
SELECT bakeryno, bakery, telephone, address, station, tag, rating, signature, breadgrpno FROM bakery WHERE breadgrpno=4;
      
-- U
UPDATE bakery SET breadgrpno=4 WHERE bakeryno=1;

-- D
DELETE FROM bakery WHERE bakeryno=1;