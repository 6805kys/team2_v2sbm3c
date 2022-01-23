/**********************************/
/* Table Name: 빵 추천 커뮤니티 게시판 */
/**********************************/
CREATE TABLE brpost(
		post_no INT NOT NULL PRIMARY KEY,
		post_name VARCHAR(100) NOT NULL,
		post_id VARCHAR(100) NOT NULL,
		post_crtime DATE NOT NULL,
		post_mdtime DATE
);

COMMENT ON TABLE brpost is '빵 추천 커뮤니티 게시판';
COMMENT ON COLUMN brpost.post_no is '커뮤니티 게시판 번호';
COMMENT ON COLUMN brpost.post_name is '커뮤니티 게시판명';
COMMENT ON COLUMN brpost.post_id is '게시판 생성자ID';
COMMENT ON COLUMN brpost.post_crtime is '게시판 생성일자';
COMMENT ON COLUMN brpost.post_mdtime is '커뮤니티 게시판 번호';


CREATE SEQUENCE brpost_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

/**********************************/
/* Table Name: 빵 추천 커뮤니티 게시글 */
/**********************************/
CREATE TABLE brcontent(
		content_no INT NOT NULL PRIMARY KEY,
		content_name VARCHAR(100) NOT NULL,
		content_id VARCHAR(100),
		content_crtime DATE NOT NULL,
		view INTEGER NOT NULL,
		content_mdtime DATE NOT NULL,
		notice VARCHAR(10) NOT NULL,
		content VARCHAR(1000),
		post_no INT,
  FOREIGN KEY (post_no) REFERENCES brpost (post_no)
);

CREATE SEQUENCE brcontent_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지


COMMENT ON TABLE brcontent is '빵 추천 커뮤니티 게시글';
COMMENT ON COLUMN brcontent.content_no is '커뮤니티 게시글 번호';
COMMENT ON COLUMN brcontent.content_name is '커뮤니티 게시글 제목';
COMMENT ON COLUMN brcontent.content_id is '작성자ID';
COMMENT ON COLUMN brcontent.content_crtime is '커뮤니티 게시글 작성일시';
COMMENT ON COLUMN brcontent.view is '조회수';
COMMENT ON COLUMN brcontent.content_mdtimeis '수정일시';
COMMENT ON COLUMN brcontent.notice '공개여부';
COMMENT ON COLUMN brcontent.content '게시글 내용';

/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE brcomment(
		comment_no INT NOT NULL PRIMARY KEY,
		comment_content VARCHAR(1000) NOT NULL,
		comment_crid VARCHAR(100) NOT NULL,
		comment_crtime DATE NOT NULL,
		comment_mdtime DATE NOT NULL,
		content_no INT,
  FOREIGN KEY (content_no) REFERENCES brcontent (content_no)
);

COMMENT ON TABLE brcomment is '댓글';
COMMENT ON COLUMN brcomment.comment_no is '댓글번호';
COMMENT ON COLUMN brcomment.comment_content is '댓글내용';
COMMENT ON COLUMN brcomment.comment_crid is '작성자ID';
COMMENT ON COLUMN brcomment.comment_crtime is '작성일시';
COMMENT ON COLUMN brcomment.comment_mdtime is '수정일시';

CREATE SEQUENCE brcomment_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
CREATE TABLE brfile(
		file_no INT NOT NULL PRIMARY KEY,
		file_name VARCHAR(100),
		routename VARCHAR(100),
		volume VARCHAR(100),
		content_no INT,
  FOREIGN KEY (content_no) REFERENCES brcontent (content_no)
);

COMMENT ON TABLE brfile is '첨부파일';
COMMENT ON COLUMN brcontent.file_no is '첨부파일번호';
COMMENT ON COLUMN brcontent.file_name is '파일명';
COMMENT ON COLUMN brcontent.routename is '파일경로명';
COMMENT ON COLUMN brcontent.volume is '파일용량';
COMMENT ON COLUMN brcontent.content_no is '커뮤니티 게시글 번호';

CREATE SEQUENCE brfile_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
