DROP TABLE survey;
-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE survey CASCADE CONSTRAINTS; 

/**********************************/
/* Table Name: 설문조사 */
/**********************************/
CREATE TABLE survey(
surveyno                        NUMBER(10)  NULL ,
breadno                        NUMBER(10)  NULL ,
MEMBERNO                       NUMBER(10)  NULL ,
  PRIMARY KEY (surveyno),
  FOREIGN KEY (breadno) REFERENCES bread (breadno),
  FOREIGN KEY (MEMBERNO) REFERENCES member (MEMBERNO)
);

COMMENT ON TABLE survey is '설문조사';
COMMENT ON COLUMN survey.surveyno is '설문조사 번호';
COMMENT ON COLUMN survey.breadno is '빵번호';
COMMENT ON COLUMN survey.MEMBERNO is '회원 번호';

DROP SEQUENCE survey_seq;
CREATE SEQUENCE survey_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
-- C
INSERT INTO survey(surveyno, breadno, memberno)
VALUES (survey_seq.nextval, 1, 1);

COMMIT;

-- R(List)
SELECT surveyno, breadno, memberno FROM survey ORDER BY surveyno;
      
-- R(Read)
SELECT surveyno, breadno, memberno FROM survey WHERE memberno=1;
      
-- U
UPDATE survey SET breadno=2 WHERE memberno=1;

-- D
DELETE FROM survey WHERE memberno=1;
