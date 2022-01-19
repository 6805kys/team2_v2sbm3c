/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE brnotice(
		notice_no INT NOT NULL PRIMARY KEY,
		notice_id INT,
		notice_name VARCHAR(1000) NOT NULL,
		notice_post VARCHAR(10000) NOT NULL,
		recom NUMERIC(7) DEFAULT 0 NOT NULL,
		notice_view NUMERIC(7) NOT NULL,
		passwd VARCHAR(100) NOT NULL,
		notice_word VARCHAR(300),
		notice_crtime DATE NOT NULL,
		notice_mdtime DATE NOT NULL
);

COMMENT ON TABLE brnotice is '공지사항';
COMMENT ON COLUMN brnotice.notice_no is '공지사항글 번호';
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
  
  INSERT INTO brnotice(notice_no, notice_id, notice_name, notice_post, notice_view, recom, passwd, notice_word, notice_crtime, notice_mdtime)
VALUES (brnotice_seq.nextval, 'kd1', '빵파고에 오신것을 환영합니다!!', '빵파고는 사람들이 서울내에 다양한 빵 맛집을 추천해주는 카페입니다!! ', 0, 0, 1234, '#공지사항', sysdate, sysdate);

-- R(List)
SELECT notice_no, notice_id, notice_name, notice_post, notice_view, recom, passwd, notice_word, content_crtime, content_mdtime
FROM brnotice
ORDER BY notice_no;
      
-- R(Read)
SELECT notice_no, notice_id, notice_name, notice_post, notice_view, recom, passwd, notice_word, content_crtime, content_mdtime
FROM brnotice
WHERE notice_no=2;

-- U
UPDATE brnotice
SET notice_name='공지사항 변경사항 입니다!!!'
WHERE notice_no=2;

-- D
DELETE FROM brnotice
WHERE notice_no=16;