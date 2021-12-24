DROP TABLE grade;
-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE grade CASCADE CONSTRAINTS; 

--테이블 생성
CREATE TABLE grade (
  gradeno      NUMBER(10)      NOT NULL, -- 등급번호, 레코드를 구분하는 컬럼 
  gradename  VARCHAR(10)     NOT NULL, -- 등급이름(씨앗, 밀, 빵, 파트너회원)
  PRIMARY KEY (gradeno)                     -- 한번 등록된 값은 중복 안됨
);

COMMENT ON TABLE GRADE is '등급';
COMMENT ON COLUMN GRADE.GRADENO is '등급번호';
COMMENT ON COLUMN GRADE.GRADENAME is '등급이름';

DROP SEQUENCE grade_seq;
CREATE SEQUENCE grade_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
commit;

-- 1. 등록

INSERT INTO grade(gradeno, gradename)
VALUES(1, '매니저');

INSERT INTO grade(gradeno, gradename)
VALUES(10, '씨앗');

INSERT INTO grade(gradeno, gradename)
VALUES(20, '밀');

INSERT INTO grade(gradeno, gradename)
VALUES(30, '빵');

INSERT INTO grade(gradeno, gradename)
VALUES(101, '파트너');

INSERT INTO grade(gradeno, gradename)
VALUES(999, '비회원');

SELECT gradeno, gradename FROM grade ORDER BY gradeno ASC;

COMMIT;

--2. 조회
SELECT gradeno, gradename
FROM grade
WHERE gradeno = 1;

--3. 수정
UPDATE grade 
SET gradename='케이크'
WHERE gradeno=30;

COMMIT;

--4. 삭제
  1) 모두 삭제
DELETE FROM grade;
 
  2) 특정 등급 삭제
DELETE FROM grade
WHERE gradeno=31;
