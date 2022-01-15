-- 테이블 구조
-- member 삭제전에 FK가 선언된 테이블 먼저 삭제합니다.
--DROP TABLE survey;
--DROP TABLE member_auth;
--DROP TABLE grade; -- member drop 후에 가능
--DROP TABLE member_info;
--DROP TABLE brcomment;
--DROP TABLE brcontent;
--DROP TABLE member;
-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
--DROP TABLE member CASCADE CONSTRAINTS; 

CREATE TABLE member (
  memberno NUMBER(10) NOT NULL, -- 회원 번호, 레코드를 구분하는 컬럼 
  id             VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 중복 안됨, 레코드를 구분 
  passwd      VARCHAR(60)   NOT NULL, -- 패스워드, 영숫자 조합
  nickname   VARCHAR(30)   NOT NULL, -- 닉네임 10자 저장 가능
  tel            VARCHAR(15)   NOT NULL, -- 전화번호
  email        VARCHAR(50)   NOT NULL, -- 이메일
  mdate       DATE             NOT NULL, -- 가입일    
  gradeno     NUMBER(10)     NOT NULL, -- 등급(씨앗, 밀, 빵, 파트너회원 등)
  PRIMARY KEY (memberno),                     -- 한번 등록된 값은 중복 안됨
  FOREIGN KEY (GRADENO) REFERENCES grade(GRADENO)
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원 번호';
COMMENT ON COLUMN MEMBER.ID is '아이디';
COMMENT ON COLUMN MEMBER.PASSWD is '패스워드';
COMMENT ON COLUMN MEMBER.NICKNAME is '닉네임';
COMMENT ON COLUMN MEMBER.TEL is '전화번호';
COMMENT ON COLUMN MEMBER.EMAIL is '이메일';
COMMENT ON COLUMN MEMBER.MDATE is '가입일';
COMMENT ON COLUMN MEMBER.GRADENO is '등급번호';

--DROP SEQUENCE member_seq;
CREATE SEQUENCE member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

COMMIT;

  1. 등록
-- 회원 관리용 계정, Q/A 용 계정
INSERT INTO member(memberno, id, passwd, nickname, tel, email, mdate, gradeno)
VALUES (member_seq.nextval, 'manager1', '1234', '회원관리 매니저', '000-0000-0000', 'Insert@Email.address', sysdate, 1);
-- 게시판 관리자
INSERT INTO member(memberno, id, passwd, nickname, tel, email, mdate, gradeno)
VALUES (member_seq.nextval, 'manager2', '1234', '게시판 매니저', '000-0000-0000', 'Insert@Email.address', sysdate, 1);
  
-- 개인 회원 테스트 계정
INSERT INTO member(memberno, id, passwd, nickname, tel, email, mdate, gradeno)
VALUES (member_seq.nextval, 'user1', '1234', '회원1', '000-0000-0000', 'Insert@Email.address', sysdate, 10);
 
INSERT INTO member(memberno, id, passwd, nickname, tel, email, mdate, gradeno)
VALUES (member_seq.nextval, 'user2', '1234', '회원2', '000-0000-0000', 'Insert@Email.address', sysdate, 10);
 
INSERT INTO member(memberno, id, passwd, nickname, tel, email, mdate, gradeno)
VALUES (member_seq.nextval, 'user18', '1234', '회원18', '000-0000-0000', 'Insert@Email.address', sysdate, 10);
 

COMMIT;


  2. 목록
SELECT memberno, id, passwd, nickname, tel, email, mdate, gradeno
FROM member
ORDER BY memberno ASC;

  3. 조회
  1) user1 정보 보기
SELECT memberno, id, passwd, nickname, tel, email, mdate, gradeno
FROM member
WHERE memberno = 4;

SELECT memberno, id, passwd, nickname, tel, email, mdate, gradeno
FROM member
WHERE id = 'user1';
  
  2) id 중복 확인
SELECT COUNT(id) as cnt
FROM member
WHERE id='user1';

 3) nickname 중복 확인
SELECT COUNT(nickname) as cnt
FROM member
WHERE nickname='빵덕1';
 
CNT
------
   0   ← 중복 되지 않음.
CNT
------
   1   ← 중복 됨.
   
  4) mypage: memberno기준으로 member_info NATURAL JOIN
SELECT memberno, id, nickname, tel, email, mdate, gradeno, taste1, taste2
FROM member
NATURAL JOIN  member_info
WHERE memberno=4;
 
  5) LEFT OUTER JOIN
SELECT m1.memberno, m1.id, m1.nickname, m1.tel, m1.email, m1.mdate, m1.gradeno, m2.taste1, m2.taste2
FROM member m1
LEFT OUTER JOIN member_info m2
ON (m1.memberno=m2.memberno);


  
  4. 수정
UPDATE member 
SET nickname='빵덕1', tel='111-1111-1111', email='email@bpg.com', gradeno=20
WHERE memberno=4;

UPDATE member 
SET id='user29', nickname='회원29'
WHERE memberno=29;

COMMIT;  
  
  
  5. 삭제
  1) 모두 삭제
DELETE FROM member;
 
  2) 특정 회원 삭제
--DELETE FROM member
--WHERE memberno=6;


COMMIT;


  6. 패스워드 변경
  1) 패스워드 검사
SELECT COUNT(memberno) as cnt
FROM member
WHERE memberno=1 AND passwd='1234';
 
  2) 패스워드 수정
UPDATE member
SET passwd='0000'
WHERE memberno=1;

COMMIT;
 
 
  7. 로그인
SELECT COUNT(memberno) as cnt
FROM member
WHERE id='user1' AND passwd='1234';

 
