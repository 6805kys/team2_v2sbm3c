DROP TABLE authgrp;
-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE authgrp CASCADE CONSTRAINTS; 

CREATE TABLE authgrp (
  authno NUMBER(10) NOT NULL,
  authname VARCHAR(20)   NOT NULL,
  PRIMARY KEY (authno)
);

COMMENT ON TABLE AUTHGRP is '권한그룹';
COMMENT ON COLUMN AUTHGRP.AUTHNO is '권한 번호';
COMMENT ON COLUMN AUTHGRP.AUTHNAME is '권한그룹명';

DROP SEQUENCE authgrp_seq;
CREATE SEQUENCE authgrp_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

commit;

-- 1. 등록
INSERT INTO authgrp(authno, authname)
VALUES(authgrp_seq.nextval, '매니저(CRUD)');

INSERT INTO authgrp(authno, authname)
VALUES(authgrp_seq.nextval, '씨앗(R)');

INSERT INTO authgrp(authno, authname)
VALUES(authgrp_seq.nextval, '밀(CRUD)');

INSERT INTO authgrp(authno, authname)
VALUES(authgrp_seq.nextval, '빵(CRUD)');

INSERT INTO authgrp(authno, authname)
VALUES(authgrp_seq.nextval, '파트너(CRUD)');

INSERT INTO authgrp(authno, authname)
VALUES(authgrp_seq.nextval, '블랙(R)');

SELECT authno, authname FROM authgrp ORDER BY authno ASC;

COMMIT;

--2. 조회
SELECT authno, authname
FROM authgrp
WHERE authno = 1;

--3. 수정
UPDATE authgrp 
SET authname='블랙회원(R)'
WHERE authno=6;

COMMIT;

--4. 삭제
  1) 모두 삭제
DELETE FROM authgrp;
 
  2) 특정 권한그룹 삭제
DELETE FROM authgrp
WHERE authno=6;