/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE brnotice(
		notice_no INT NOT NULL PRIMARY KEY,
		adminno                       NUMBER(10)   NULL ,
		notice_id CLOB          NOT NULL, 
		notice_name VARCHAR(1000) NOT NULL,
		notice_post VARCHAR(10000) NOT NULL,
		recom NUMERIC(7) DEFAULT 0 NOT NULL,
		notice_view NUMERIC(7) DEFAULT 0 NOT NULL,
		passwd VARCHAR(100) NOT NULL,
		notice_word VARCHAR(300),
		notice_crtime DATE NOT NULL,
		notice_mdtime DATE NOT NULL,
		FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

DROP TABLE brnotice CASCADE CONSTRAINTS;

COMMENT ON TABLE brnotice is '공지사항';
COMMENT ON COLUMN brnotice.notice_no is '공지사항글 번호';
COMMENT ON COLUMN brnotice.adminno is '관리자 번호';
COMMENT ON COLUMN brnotice.notice_id is '작성자ID';
COMMENT ON COLUMN brnotice.notice_name is '공지사항글 제목';
COMMENT ON COLUMN brnotice.notice_post is '공지사항글 내용';
COMMENT ON COLUMN brnotice.recom  is '추천수';
COMMENT ON COLUMN brnotice.notice_view is '조회수';
COMMENT ON COLUMN brnotice.passwd is '패스워드';
COMMENT ON COLUMN brnotice.notice_word is '검색어';
COMMENT ON COLUMN brnotice.notice_crtime is '공지사항글 작성일시';
COMMENT ON COLUMN brnotice.notice_mdtime is '공지사항글 수정일시';

CREATE SEQUENCE brnotice_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
  INSERT INTO brnotice(notice_no, adminno, notice_id, notice_name, notice_post, notice_view, recom, passwd, notice_word, notice_crtime, notice_mdtime)
VALUES (brnotice_seq.nextval, 1, 'kd1', '빵파고에 오신것을 환영합니다!!', '빵파고는 사람들이 서울내에 다양한 빵 맛집을 추천해주는 카페입니다!! ', 0, 0, 1234, '#공지사항', sysdate, sysdate);

-- R(List)
SELECT notice_no, adminno, notice_id, notice_name, notice_post, notice_view, recom, passwd, notice_word, notice_crtime, notice_mdtime
FROM brnotice
ORDER BY notice_no;
      
-- R(Read)
SELECT notice_no, adminno, notice_id, notice_name, notice_post, notice_view, recom, passwd, notice_word, notice_crtime, notice_mdtime
FROM brnotice
WHERE notice_no=1;


-- 게시글별 검색어를 통한 검색 레코드 갯수
SELECT COUNT(*) as cnt
    FROM brnotice
    WHERE   (notice_name LIKE '%빵파고%' OR notice_post LIKE '%내용%' OR notice_word LIKE '%#검색어%')
    
--  게시글별 검색 목록 + 페이징 + 메인 이미지 
SELECT notice_no, adminno, notice_id, notice_name, notice_post, recom, notice_view, passwd, notice_word, notice_crtime, notice_mdtime, r
FROM (
           SELECT notice_no, adminno, notice_id, notice_name, notice_post, recom, notice_view, passwd, notice_word, notice_crtime, notice_mdtime, rownum as r
           FROM (
                     SELECT notice_no, adminno, notice_id, notice_name, notice_post, recom, notice_view, passwd, notice_word, notice_crtime, notice_mdtime
                     FROM brnotice
                     WHERE   (notice_name LIKE '%빵파고%' OR notice_post LIKE '%내용%' OR notice_word LIKE '%#검색어%')
                     ORDER BY notice_no DESC
           )          
)
WHERE r >= 1 AND r <= 3;

-- 패스워드 검사
SELECT COUNT(*) as cnt 
    FROM brnotice
    WHERE notice_no=1 AND passwd=1234
    
-- 텍스트 수정 
 UPDATE brnotice
    SET notice_name= '공지', notice_post='공지',  notice_word='#단팥', notice_mdtime=sysdate
    WHERE notice_no = 1


-- 삭제 기능
DELETE FROM brnotice
    WHERE notice_no=1
    
 -- 추천
 UPDATE brnotice
    SET recom = recom + 1
    WHERE notice_no = 1
    
 -- 조회수 증가
 UPDATE brnotice
    SET notice_view = notice_view + 1
    WHERE notice_no = 1