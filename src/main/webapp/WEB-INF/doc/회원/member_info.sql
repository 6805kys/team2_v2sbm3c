DROP TABLE member_info;
-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE member_info CASCADE CONSTRAINTS; 

--테이블 생성
CREATE TABLE member_info (
  memberno NUMBER(10) NOT NULL,
  taste1 VARCHAR(20)     NOT NULL,
  taste2 VARCHAR(20)     NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES member(MEMBERNO)
);

COMMENT ON TABLE member_info is '회원상세';
COMMENT ON COLUMN MEMBER_INFO.MEMBERNO is '회원번호';
COMMENT ON COLUMN MEMBER_INFO.TASTE1 is '취향1';
COMMENT ON COLUMN MEMBER_INFO.TASTE2 is '취향2';

DROP SEQUENCE member_info_seq;
CREATE SEQUENCE member_info_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
commit;


  1. 등록
  
-- 개인 회원 left join
INSERT INTO member_info(taste1, taste2)
VALUES (member_seq.nextval, 'user1', '1234', '회원1', '000-0000-0000', sysdate, 10);
 
INSERT INTO member(memberno, id, passwd, nickname, tel, gradeno)
VALUES (member_seq.nextval, 'user2', '1234', '회원2', '000-0000-0000', sysdate, 10);
 
INSERT INTO member(memberno, id, passwd, nickname, tel, gradeno)
VALUES (member_seq.nextval, 'user3', '1234', '회원3', '000-0000-0000', sysdate, 10);
 

COMMIT;


  2. 목록
SELECT memberno, taste1, taste2
FROM member_info
ORDER BY memberno ASC;

  3. 조회
  1) user1 정보 보기
SELECT memberno, id, passwd, nickname, tel, mdate, gradeno
FROM member_info
WHERE memberno = 1;

SELECT memberno, id, passwd, nickname, tel, mdate, gradeno
FROM member_info
WHERE id = 'user1';
  
  4. 수정
UPDATE member_info 
SET taste1='비건', taste2='국산재료'
WHERE memberno=3;

COMMIT;  
  
  
  5. 삭제
  1) 모두 삭제
DELETE FROM member_info;
 
  2) 특정 회원 상세정보 삭제
DELETE FROM member_info
WHERE memberno=10;

COMMIT;
