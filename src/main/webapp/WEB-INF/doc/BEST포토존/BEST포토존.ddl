/**********************************/
/* Table Name: BEST포토존 */
/**********************************/
CREATE TABLE brcontent(
        content_no                            NUMBER(10)         NOT NULL         PRIMARY KEY,
        content_name                        VARCHAR(100)            NOT NULL,
        content_post                             CLOB                  NOT NULL,
        recom                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        content_view                                   NUMBER(7)         DEFAULT 0         NOT NULL,
        passwd                                VARCHAR2(15)         NOT NULL,
        content_word                                  VARCHAR2(300)         NULL ,
        content_crtime                                 DATE               NOT NULL,
        content_mdtime                                  DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        file1saved                            VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,
        content_id                              CLOB            NULL
);

COMMENT ON TABLE brcontent is 'BEST포토존';
COMMENT ON COLUMN brcontent.content_no is 'BEST포토존글 번호';
COMMENT ON COLUMN brcontent.content_name is 'BEST포토존글 제목';
COMMENT ON COLUMN brcontent.content_post is 'BEST포토존글 내용';
COMMENT ON COLUMN brcontent.content_recom  is '추천수';
COMMENT ON COLUMN brcontent.content_view is '조회수';
COMMENT ON COLUMN brcontent.passwd is '패스워드';
COMMENT ON COLUMN brcontent.content_word is '검색어';
COMMENT ON COLUMN brcontent.content_crtime is 'BEST포토존글 작성일시';
COMMENT ON COLUMN brcontent.content_mdtime is 'BEST포토존글 수정일시';
COMMENT ON COLUMN brcontent.file1 is '메인 이미지';
COMMENT ON COLUMN brcontent.filesaved is '실제로 저장된 메인 이미지';
COMMENT ON COLUMN brcontent.thumb1 is '메인 이미지 preview';
COMMENT ON COLUMN brcontent.size1 is '메인 이미지 크기';
COMMENT ON COLUMN brcontent.content_id is '작성자ID';

CREATE SEQUENCE brcontent_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
 INSERT INTO brcontent(content_no, content_id, content_name, content_post, content_view, content_recom, passwd, content_word,
                                     file1, file1saved, thumb1, size1, content_crtime, content_mdtime)
VALUES (brcontent_seq.nextval, 'kd1', '부산 태성당', '부산 최고의 빵집!!', 0, 0, 1234, '#단팥', '파이01.jpg', '파이01.jpg', '파이01.jpg', 592, sysdate, sysdate);


-- R(List)
SELECT content_no, content_id, content_name, content_post, content_view, content_recom, passwd, content_word,
                                     file1, file1saved, thumb1, size1, content_crtime, content_mdtime
FROM brcontent
ORDER BY content_no;
      
-- R(Read)
SELECT content_no, content_id, content_name, content_post, content_view, content_recom, passwd, content_word,
                                     file1, file1saved, thumb1, size1, content_crtime, content_mdtime
FROM brcontent
WHERE content_no=18;
      
-- U
UPDATE brcontent
SET content_name='비건빵의 최고 맛집 밀토니아!!'
WHERE content_no=18;

-- D
DELETE FROM brcontent
WHERE content_no=18;
