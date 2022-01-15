/**********************************/
/* Table Name: 빵 */
/**********************************/
DROP TABLE bread CASCADE CONSTRAINTS;

CREATE TABLE bread(
breadno                        NUMBER(10)  NOT NULL  PRIMARY KEY,
breadgrpno                     NUMBER(10)  NOT NULL,
bread                          VARCHAR2(30)  NOT NULL,
  FOREIGN KEY (breadgrpno) REFERENCES breadgrp (breadgrpno)
);

COMMENT ON TABLE bread is '빵';
COMMENT ON COLUMN bread.breadno is '빵번호';
COMMENT ON COLUMN bread.breadgrpno is '빵그룹번호';
COMMENT ON COLUMN bread.bread is '빵이름';

DROP SEQUENCE bread_seq;

CREATE SEQUENCE bread_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  

-- C
INSERT INTO bread(breadno, breadgrpno, bread)
VALUES (bread_seq.nextval, 1,'단팥빵');

commit;

-- R(List)
SELECT breadno, breadgrpno, bread FROM bread ORDER BY breadgrpno;
      
-- R(Read)
SELECT breadno, breadgrpno, bread FROM bread WHERE breadgrpno=1;
      
-- U
UPDATE bread SET bread='황남빵' WHERE breadno=6;

-- D
DELETE FROM bread WHERE breadno=1;
