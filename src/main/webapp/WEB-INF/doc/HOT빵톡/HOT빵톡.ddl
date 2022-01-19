/**********************************/
/* Table Name: HOT빵톡 */
/**********************************/
CREATE TABLE brtalk(
        talk_no    INT     NOT NULL     PRIMARY KEY,
        memberno                       NUMBER(10)   NULL ,
        talk_id       CLOB          NOT NULL,
        talk_name VARCHAR(1000) NOT NULL,
        talk_post      CLOB         NOT NULL,
        recom NUMERIC(7) DEFAULT 0 NOT NULL,
        talk_view NUMERIC(7)  DEFAULT 0   NOT NULL,
        passwd VARCHAR(100) NOT NULL,
        talk_word VARCHAR(300),
        talk_crtime DATE NOT NULL,
        talk_mdtime DATE NOT NULL,
        FOREIGN KEY (memberno) REFERENCES member (memberno)
);

DROP TABLE brtalk CASCADE CONSTRAINTS;

COMMENT ON TABLE brtalk is 'HOT빵톡';
COMMENT ON COLUMN brtalk.talk_no is 'HOT빵톡글 번호';
COMMENT ON COLUMN brtalk.memberno is '회원 번호';
COMMENT ON COLUMN brtalk.talk_id is '작성자ID';
COMMENT ON COLUMN brtalk.talk_name is 'HOT빵톡글 제목';
COMMENT ON COLUMN brtalk.talk_post is 'HOT빵톡글 내용';
COMMENT ON COLUMN brtalk.recom  is '추천수';
COMMENT ON COLUMN brtalk.talk_view is '조회수';
COMMENT ON COLUMN brtalk.passwd is '패스워드';
COMMENT ON COLUMN brtalk.talk_word is '검색어';
COMMENT ON COLUMN brtalk.talk_crtime is 'HOT빵톡글 작성일시';
COMMENT ON COLUMN brtalk.talk_mdtime is 'HOT빵톡글 수정일시';

CREATE SEQUENCE brtalk_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
  INSERT INTO brtalk(talk_no, memberno, talk_id, talk_name, talk_post, talk_view, recom, passwd, talk_word, talk_crtime, talk_mdtime)
VALUES (brtalk_seq.nextval, 2, 'kd1', '서울 신사 가로수길 퀸아망 맛집!!!', '1. 신사동 가로수길에 있는 "비파티세리" 추천합니다.. ', 0, 0, 1234, '#퀸아망', sysdate, sysdate);

-- R(List)
SELECT talk_no, memberno, talk_id, talk_name, talk_post, talk_view, recom, passwd, talk_word, talk_crtime, talk_mdtime
FROM brtalk
ORDER BY talk_no;
      
-- R(Read)
SELECT talk_no, memberno, talk_id, talk_name, talk_post, talk_view, recom, passwd, talk_word, talk_crtime, talk_mdtime
FROM brtalk
WHERE talk_no=10;
     

-- 게시글별 검색어를 통한 검색 레코드 갯수
SELECT COUNT(*) as cnt
    FROM brtalk
    WHERE   (talk_name LIKE '%서울%' OR talk_post LIKE '%신사동%' OR talk_word LIKE '%#퀸아망%')
    
--  게시글별 검색 목록 + 페이징 + 메인 이미지 
SELECT talk_no, memberno, talk_id, talk_name, talk_post, recom, talk_view, passwd, talk_word, talk_crtime, talk_mdtime, r
FROM (
           SELECT talk_no, memberno, talk_id, talk_name, talk_post, recom, talk_view, passwd, talk_word, talk_crtime, talk_mdtime, rownum as r
           FROM (
                     SELECT talk_no, memberno, talk_id, talk_name, talk_post, recom, talk_view, passwd, talk_word, talk_crtime, talk_mdtime
                     FROM brtalk
                     WHERE   (talk_name LIKE '%서울%' OR talk_post LIKE '%신사동%' OR talk_word LIKE '%#퀸아망%')
                     ORDER BY talk_no DESC
           )          
)
WHERE r >= 1 AND r <= 3;

-- 패스워드 검사
SELECT COUNT(*) as cnt 
    FROM brtalk
    WHERE talk_no=10 AND passwd=1234
    
-- 텍스트 수정 
 UPDATE brtalk
    SET talk_name= '부산 태성당', talk_post='부산 최고의 빵집!!',  talk_word='#단팥', talk_mdtime=sysdate
    WHERE talk_no = 10

-- 삭제 기능
DELETE FROM brtalk
    WHERE talk_no=10
    
 -- 추천
 UPDATE brtalk
    SET recom = recom + 1
    WHERE talk_no = 10
    
 -- 조회수 증가
 UPDATE brtalk
    SET talk_view = talk_view + 1
    WHERE talk_no = 10