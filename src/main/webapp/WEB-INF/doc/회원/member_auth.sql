DROP TABLE member_auth;
-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE member_auth CASCADE CONSTRAINTS; 

CREATE TABLE member_auth (
  memberno NUMBER(10) NOT NULL,
  authno NUMBER(10) NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES member(MEMBERNO),
  FOREIGN KEY (AUTHNO) REFERENCES authgrp(AUTHNO)
);

COMMENT ON TABLE MEMBER_AUTH is '회원권한';
COMMENT ON COLUMN MEMBER_AUTH.MEMBERNO is '회원 번호';
COMMENT ON COLUMN MEMBER_AUTH.AUTHNO is '권한 번호';

DROP SEQUENCE member_auth_seq;
CREATE SEQUENCE member_auth_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

commit;

-- 1. 등록
INSERT INTO member_auth(memberno, authno)
VALUES(4, 2);

INSERT INTO member_auth(memberno, authno)
VALUES(5, 2);

INSERT INTO member_auth(memberno, authno)
VALUES(6, 2);


SELECT memberno, authno FROM member_auth ORDER BY authno ASC;

SELECT memberno, authno FROM member_auth ORDER BY memberno ASC;

COMMIT;

--2. 조회
-- 특정권한의 회원번호 조회
SELECT memberno, authno
FROM member_auth
WHERE authno = 2;
-- 특정 회원의 권한조회
SELECT memberno, authno
FROM member_auth
WHERE memberno = 4;

-- 3. 수정
-- 특정 회원(6)의 권한변경-> 3: 밀
UPDATE member_auth 
SET authno=3
WHERE memberno=6;


--4. 삭제
  1) 모두 삭제
DELETE FROM member_auth;
 
  2) 특정 권한그룹 회원 전부 삭제
  -- 블랙을 해제
DELETE FROM member_auth
WHERE authno=6;

