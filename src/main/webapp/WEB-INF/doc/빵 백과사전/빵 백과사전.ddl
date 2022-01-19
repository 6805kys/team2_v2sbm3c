/**********************************/
/* Table Name: 빵 백과사전 */
/**********************************/
CREATE TABLE brdic(
		dic_no INT NOT NULL PRIMARY KEY,
		dic_name VARCHAR(1000) NOT NULL,
		dic_post VARCHAR(10000) NOT NULL,
		recom NUMERIC(7) DEFAULT 0 NOT NULL,
		dic_view NUMERIC(7) NOT NULL,
		passwd VARCHAR(100) NOT NULL,
		dic_word VARCHAR(300),
		dic_crtime DATE NOT NULL,
		dic_mdtime DATE NOT NULL,
		file1 VARCHAR(100),
		file1saved VARCHAR(100),
		thumb1 VARCHAR(100),
		size1 NUMERIC(10) DEFAULT 0
);

COMMENT ON TABLE brdic is '빵 백과사전';
COMMENT ON COLUMN brdic.dic_no is '빵 백과사전글 번호';
COMMENT ON COLUMN brdic.dic_name is '빵 백과사전글 제목';
COMMENT ON COLUMN brdic.dic_post is '빵 백과사전글 내용';
COMMENT ON COLUMN brdic.recom  is '추천수';
COMMENT ON COLUMN brdic.dic_view is '조회수';
COMMENT ON COLUMN brdic.passwd is '패스워드';
COMMENT ON COLUMN brdic.dic_word is '검색어';
COMMENT ON COLUMN brdic.dic_crtime is '빵 백과사전글 작성일시';
COMMENT ON COLUMN brdic.dic_mdtime is '빵 백과사전글 수정일시';
COMMENT ON COLUMN brdic.file1 is '메인 이미지';
COMMENT ON COLUMN brdic.filesaved is '실제로 저장된 메인 이미지';
COMMENT ON COLUMN brdic.thumb1 is '메인 이미지 preview';
COMMENT ON COLUMN brdic.size1 is '메인 이미지 크기';

CREATE SEQUENCE brdic_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
 INSERT INTO brdic(dic_no, dic_name, dic_post, dic_view, recom, passwd, dic_word,
                                     file1, file1saved, thumb1, size1, dic_crtime, dic_mdtime)
VALUES (brdic_seq.nextval, '단팥빵', '열량 : 625 kJ(149 kcal) 탄수화물 : 7.98g', 0, 0, 1234, '#단팥빵', '단팥빵.jpg', '단팥빵_1.jpg', '단팥빵_1_t.jpg', 495881, sysdate, sysdate);


-- R(List)
SELECT dic_no, dic_name, dic_post, dic_view, recom, passwd, dic_word, file1, file1saved, thumb1, size1, dic_crtime, dic_mdtime
FROM brdic
ORDER BY dic_no;
      
-- R(Read)
SELECT dic_no, dic_name, dic_post, dic_view, recom, passwd, dic_word, file1, file1saved, thumb1, size1, dic_crtime, dic_mdtime
FROM brdic
WHERE dic_no=2;
      
-- U
UPDATE brdic
SET dic_name='바게뜨'
WHERE dic_no=2;

-- D
DELETE FROM brdic
WHERE dic_no=2;
