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