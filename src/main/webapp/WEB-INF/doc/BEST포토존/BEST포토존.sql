/**********************************/
/* Table Name: BEST포토존 */
/**********************************/
CREATE TABLE brcontent(
    content_no                            NUMBER(10)         NOT NULL         PRIMARY KEY,
    memberno                       NUMBER(10)   NULL ,
        content_name VARCHAR(100) NOT NULL,
        content_post                             CLOB                  NOT NULL,
        recom                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        content_view                                   NUMBER(7)         DEFAULT 0         NOT NULL,
        passwd                                VARCHAR2(15)         NOT NULL,
        content_word                                  VARCHAR2(300)         NULL ,
        content_crtime                                 DATE               NOT NULL,
        content_mdtime                                    DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        file1saved                            VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,
         FOREIGN KEY (memberno) REFERENCES member (memberno)
         );
         
         DROP TABLE brcontent CASCADE CONSTRAINTS;
         
COMMENT ON TABLE brcontent is 'BEST포토존';
COMMENT ON COLUMN brcontent.content_no is 'BEST포토존글 번호';
COMMENT ON COLUMN brcontent.memberno is '회원 번호';
COMMENT ON COLUMN brcontent.content_name is 'BEST포토존글 제목';
COMMENT ON COLUMN brcontent.content_post is 'BEST포토존글 내용';
COMMENT ON COLUMN brcontent.recom  is '추천수';
COMMENT ON COLUMN brcontent.content_view is '조회수';
COMMENT ON COLUMN brcontent.passwd is '패스워드';
COMMENT ON COLUMN brcontent.content_word is '검색어';
COMMENT ON COLUMN brcontent.content_crtime is 'BEST포토존글 작성일시';
COMMENT ON COLUMN brcontent.content_mdtime is 'BEST포토존글 수정일시';
COMMENT ON COLUMN brcontent.file1 is '메인 이미지';
COMMENT ON COLUMN brcontent.file1saved is '실제로 저장된 메인 이미지';
COMMENT ON COLUMN brcontent.thumb1 is '메인 이미지 preview';
COMMENT ON COLUMN brcontent.size1 is '메인 이미지 크기';

DROP SEQUENCE brcontent_seq;

CREATE SEQUENCE brcontent_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
 INSERT INTO brcontent(content_no, memberno, content_name, content_post, content_view, recom, passwd, content_word,
                                     file1, file1saved, thumb1, size1, content_crtime, content_mdtime)
VALUES (brcontent_seq.nextval, 4 , '당동 백갤러리 닭가슴살 샌드위치', '샌드위치에는 야채가 많아서 정말 좋았다.

그리고 다이어터인 나에게 닭가슴살 샌드위치가 있어 부담 없이 먹을 수 있었다.

여러 종류의 샌드위치가 있어서 선택할 수 있어 좋았다.

야채와 닭가슴살을 와그작 와그작', 0, 0, 1234, '#닭가슴살 샌드위치 #샌드위치 맛집 #당동 카페 # 백갤러리 카페', '백카페.jpg', '백카페.jpg', '백카페.jpg', 561990, sysdate, sysdate);

commit;

-- R(List)
SELECT content_no, memberno, content_name, content_post, content_view, recom, passwd, content_word,
                                     file1, file1saved, thumb1, size1, content_crtime, content_mdtime
FROM brcontent
ORDER BY content_no;
      
-- R(Read)
SELECT content_no, memberno, content_name, content_post, content_view, recom, passwd, content_word,
                                     file1, file1saved, thumb1, size1, content_crtime, content_mdtime
FROM brcontent
WHERE content_no=12;


-- 게시글별 검색어를 통한 검색 레코드
SELECT content_no, memberno, content_name, content_post, recom, content_view, passwd, content_word, content_crtime, content_mdtime, file1, file1saved, thumb1, size1
    FROM brcontent
WHERE   (content_name LIKE '%백갤러리%' OR content_post LIKE '%샌드위치%' OR content_word LIKE '%#샌드위치%')


-- 게시글별 검색어를 통한 검색 레코드 갯수
SELECT COUNT(*) as cnt
    FROM brcontent
    WHERE   (content_name LIKE '%백갤러리%' OR content_post LIKE '%샌드위치%' OR content_word LIKE '%#샌드위치%')
    
--  게시글별 검색 목록 + 페이징 + 메인 이미지 
SELECT content_no, memberno, content_name, content_post, recom, content_view, passwd, content_word, content_crtime, content_mdtime, file1, file1saved, thumb1, size1, r
FROM (
           SELECT content_no, memberno, content_name, content_post, recom, content_view, passwd, content_word, content_crtime, content_mdtime, file1, file1saved, thumb1, size1, rownum as r
           FROM (
                     SELECT content_no, memberno, content_name, content_post, recom, content_view, passwd, content_word, content_crtime, content_mdtime, file1, file1saved, thumb1, size1
                     FROM brcontent
                       WHERE   (content_name LIKE '%백갤러리%' OR content_post LIKE '%샌드위치%' OR content_word LIKE '%#샌드위치%')
                     ORDER BY content_no DESC
           )          
)
WHERE r >= 1 AND r <= 3;

-- 패스워드 검사
SELECT COUNT(*) as cnt 
    FROM brcontent
    WHERE content_no=12 AND passwd=1234
    
-- 텍스트 수정 
 UPDATE brcontent
    SET content_name= '부산 태성당', content_post='부산 최고의 빵집!!',  content_word='#단팥', content_mdtime=sysdate
    WHERE content_no = 12

    
-- 파일(사진) 수정
UPDATE brcontent
    SET file1= '백카페.jpg', file1saved='백카페_2.jpg', thumb1='백카페_2_t.jpg', size1=561990, content_mdtime=sysdate
    WHERE content_no = 12

-- 삭제 기능
DELETE FROM brcontent
    WHERE content_no=12
    
 -- 추천
 UPDATE brcontent
    SET recom = recom + 1
    WHERE content_no = 12
    
 -- 조회수 증가
 UPDATE brcontent
    SET content_view = content_view + 1
    WHERE content_no = 12
    
    commit;