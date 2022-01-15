DROP TABLE auth_info;
-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE auth_info CASCADE CONSTRAINTS; 

CREATE TABLE auth_info (
  authno NUMBER(10) NOT NULL,
  create_auth CHAR(1) NULL,
  update_auth CHAR(1) NULL,
  delete_auth CHAR(1) NULL,
  read_auth CHAR(1) NULL,
  FOREIGN KEY (AUTHNO) REFERENCES authgrp(AUTHNO)
);

COMMENT ON TABLE AUTH_INFO is '권한 상세';
COMMENT ON COLUMN AUTH_INFO.AUTHNO is '권한 번호';
COMMENT ON COLUMN AUTH_INFO.CREATE_AUTH is '등록권한여부[C]';
COMMENT ON COLUMN AUTH_INFO.UPDATE_AUTH is '수정권한여부[U]';
COMMENT ON COLUMN AUTH_INFO.DELETE_AUTH is '삭제권한여부[D]';
COMMENT ON COLUMN AUTH_INFO.READ_AUTH is '조회권한여부[R]';

DROP SEQUENCE auth_info_seq;
CREATE SEQUENCE auth_info_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

COMMIT;

-- 1. 등록
INSERT INTO auth_info(authno, create_auth, update_auth, delete_auth, read_auth)
VALUES(auth_info_seq.nextval, 'Y', 'Y', 'Y', 'Y');

INSERT INTO auth_info(authno, create_auth, update_auth, delete_auth, read_auth)
VALUES(auth_info_seq.nextval, 'N', 'N', 'N', 'Y');

INSERT INTO auth_info(authno, create_auth, update_auth, delete_auth, read_auth)
VALUES(auth_info_seq.nextval, 'N', 'N', 'N', 'N');


SELECT authno, create_auth, update_auth, delete_auth, read_auth FROM auth_info ORDER BY authno ASC;

COMMIT;

--2. 조회
SELECT authno, create_auth, update_auth, delete_auth, read_auth
FROM auth_info
WHERE authno = 1;

--3. 수정
UPDATE auth_info 
SET read_auth='N'
WHERE authno=3;

COMMIT;

--4. 삭제
  1) 모두 삭제
DELETE FROM auth_info;
 
  2) 특정 상세 권한 삭제
DELETE FROM auth_info
WHERE authno=4;