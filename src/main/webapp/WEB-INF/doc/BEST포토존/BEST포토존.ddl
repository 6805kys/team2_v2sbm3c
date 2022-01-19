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


-- 게시글별 검색어를 통한 검색 레코드
SELECT content_no, content_id, content_name, content_post, recom, content_view, passwd, content_word, content_crtime, content_mdtime, file1, file1saved, thumb1, size1
    FROM brcontent
WHERE   (content_name LIKE '%파이만쥬%' OR content_post LIKE '%파이만쥬%' OR content_word LIKE '%#파이%')


-- 게시글별 검색어를 통한 검색 레코드 갯수
SELECT COUNT(*) as cnt
    FROM brcontent
    WHERE   (content_name LIKE '%파이만쥬%' OR content_post LIKE '%파이만쥬%' OR content_word LIKE '%#파이%')
    
--  게시글별 검색 목록 + 페이징 + 메인 이미지 
SELECT content_no, content_id, content_name, content_post, recom, content_view, passwd, content_word, content_crtime, content_mdtime, file1, file1saved, thumb1, size1, r
FROM (
           SELECT content_no, content_id, content_name, content_post, recom, content_view, passwd, content_word, content_crtime, content_mdtime, file1, file1saved, thumb1, size1, rownum as r
           FROM (
                     SELECT content_no, content_id, content_name, content_post, recom, content_view, passwd, content_word, content_crtime, content_mdtime, file1, file1saved, thumb1, size1
                     FROM brcontent
                     WHERE   (content_name LIKE '%파이만쥬%' OR content_post LIKE '%파이만쥬%' OR content_word LIKE '%#파이%')
                     ORDER BY content_no DESC
           )          
)
WHERE r >= 1 AND r <= 3;

-- 패스워드 검사
SELECT COUNT(*) as cnt 
    FROM brcontent
    WHERE content_no=16 AND passwd=1234
    
-- 텍스트 수정 
 UPDATE brcontent
    SET content_name= '부산 태성당', content_post='부산 최고의 빵집!!',  content_word='#단팥', content_mdtime=sysdate
    WHERE content_no = 32

    
-- 파일(사진) 수정
UPDATE brcontent
    SET file1= '백카페.jpg', file1saved='백카페_2.jpg', thumb1='백카페_2_t.jpg', size1=561990, content_mdtime=sysdate
    WHERE content_no = 32

-- 삭제 기능
DELETE FROM brcontent
    WHERE content_no=32
    
 -- 추천
 UPDATE brcontent
    SET recom = recom + 1
    WHERE content_no = 18
    
 -- 조회수 증가
 UPDATE brcontent
    SET content_view = content_view + 1
    WHERE content_no = 18