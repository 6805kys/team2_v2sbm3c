--DROP TABLE authgrp;
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

-- 1-1 authgrp, auth_info INSERT
-- SQL 오류: ORA-00923: FROM 키워드가 필요한 위치에 없습니다.
--INSERT ALL
--    INTO authgrp VALUES(authno, authname)
--    INTO auth_info VALUES(authno, create_auth, update_auth, delete_auth, read_auth)
--SELECT authno authgrp_seq.nextval, authname '씨앗(R)',
--            create_auth 'N', update_auth 'N', delete_auth 'N', read_auth 'Y'
--FROM authgrp, auth_info
--WHERE authno = 1;

-- 1-1 
-- SQL 오류: ORA-00923: FROM 키워드가 필요한 위치에 없습니다.
--INSERT ALL
--    INTO authgrp VALUES(authno, authname, create_auth, update_auth, delete_auth, read_auth)
--    SELECT authno authgrp_seq.nextval, authname '씨앗(R)'
--    FROM DUAL
--    UNION ALL
--    SELECT authno authgrp_seq.nextval, create_auth 'N', update_auth 'N', delete_auth 'N', read_auth 'Y'
--    FROM DUAL;

-- 1-1 여러 테이블에 동시에 INSERT
INSERT ALL
    INTO authgrp VALUES(authgrp_seq.nextval, '씨앗(R)')
    INTO auth_info VALUES(authgrp_seq.nextval, 'N', 'N', 'N', 'Y')
SELECT *
    FROM DUAL;
    
-- 1-2 여러 테이블에 동시에 INSERT 
--*****************************************************************
--INSERT ALL
--    WHEN 조건1 THEN
--        INTO 테이블명 (컬럼1, 컬럼2,...) VALUES(값1, 값2, ...)
--    WHEN 조건 2 THEN
--        INTO 테이블명 (컬럼1, 컬럼2,...) VALUES(값1, 값2, ...)
--    ELSE
--        INTO 톄이블명 (컬럼1, 컬럼2, ...) VALUES(값1, 값2, ...)
--    SELECT문
--*******************************************************************
--INSERT ALL
--    WHEN gradeno=1 THEN
--        INTO authgrp (authno, authname) VALUES(authgrp_seq.nextval, '테스트그룹')
--    WHEN gradeno=1 THEN
--        INTO auth_info (authno, create_auth, update_auth, delete_auth, read_auth) VALUES(auth_info_seq.nextval, 'N', 'N', 'N', 'N')
--    SELECT authno, authname, create_auth, update_auth, delete_auth, read_auth
--    FROM MEMBER;
--  SQL 오류: ORA-00904: "READ_AUTH": 부적합한 식별자
    
    

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
--DELETE FROM authgrp
--WHERE authno=6;