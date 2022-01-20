/**********************************/
/* Table Name: 빵 백과사전 */
/**********************************/
CREATE TABLE brdic(
        dic_no INT NOT NULL PRIMARY KEY,
        adminno                       NUMBER(10)   NULL,
        dic_name VARCHAR(1000) NOT NULL,
        dic_post CLOB NOT NULL,
        recom NUMERIC(7) DEFAULT 0 NOT NULL,
        dic_view NUMERIC(7) DEFAULT 0 NOT NULL,
        passwd VARCHAR(100) NOT NULL,
        dic_word VARCHAR(300),
        dic_crtime DATE NOT NULL,
        dic_mdtime DATE NOT NULL,
        file1 VARCHAR(100),
        file1saved VARCHAR(100),
        thumb1 VARCHAR(100),
        size1 NUMERIC(10) DEFAULT 0,
        FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

DROP TABLE brdic CASCADE CONSTRAINTS;

COMMENT ON TABLE brdic is '빵 백과사전';
COMMENT ON COLUMN brdic.dic_no is '빵 백과사전글 번호';
COMMENT ON COLUMN brdic.adminno is '관리자 번호';
COMMENT ON COLUMN brdic.dic_name is '빵 백과사전글 제목';
COMMENT ON COLUMN brdic.dic_post is '빵 백과사전글 내용';
COMMENT ON COLUMN brdic.recom  is '추천수';
COMMENT ON COLUMN brdic.dic_view is '조회수';
COMMENT ON COLUMN brdic.passwd is '패스워드';
COMMENT ON COLUMN brdic.dic_word is '검색어';
COMMENT ON COLUMN brdic.dic_crtime is '빵 백과사전글 작성일시';
COMMENT ON COLUMN brdic.dic_mdtime is '빵 백과사전글 수정일시';
COMMENT ON COLUMN brdic.file1 is '메인 이미지';
COMMENT ON COLUMN brdic.file1saved is '실제로 저장된 메인 이미지';
COMMENT ON COLUMN brdic.thumb1 is '메인 이미지 preview';
COMMENT ON COLUMN brdic.size1 is '메인 이미지 크기';

CREATE SEQUENCE brdic_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
 INSERT INTO brdic(dic_no, adminno, dic_name, dic_post, dic_view, recom, passwd, dic_word,
                                     file1, file1saved, thumb1, size1, dic_crtime, dic_mdtime)
VALUES (brdic_seq.nextval, 3, '단팥빵', '영양 정보
열량 : 931 kJ(223 kcal)
탄수화물 : 41.6g
지방 : 3.2g
  ↳ 포화지방 : 0.671g
  ↳ 트랜스 지방 : 0.525g
  ↳ 다불포화 지방 : 0.878g
  ↳ 불포화 지방 : 1.299g

콜레스테롤 : 28mg
식이섬유 : 1.3g
나트륨 : 271mg
칼륨 : 87mg

요약 : 단팥빵(1개) 안에 223칼로리가 있습니다.
  ↳ 칼로리 분석: 13% 지방, 76% 탄수화물, 11% 단백질.', 0, 0, 1234, '#단팥빵', '단팥빵.jpg', '단팥빵_1.jpg', '단팥빵_1_t.jpg', 495881, sysdate, sysdate);


-- R(List)
SELECT dic_no, adminno, dic_name, dic_post, dic_view, recom, passwd, dic_word, file1, file1saved, thumb1, size1, dic_crtime, dic_mdtime
FROM brdic
ORDER BY dic_no;
      
-- R(Read)
SELECT dic_no, adminno, dic_name, dic_post, dic_view, recom, passwd, dic_word, file1, file1saved, thumb1, size1, dic_crtime, dic_mdtime
FROM brdic
WHERE dic_no=27;
      
-- 게시글별 검색어를 통한 검색 레코드
SELECT dic_no, adminno, dic_name, dic_post, recom, dic_view, passwd, dic_word, dic_crtime, dic_mdtime, file1, file1saved, thumb1, size1
FROM brdic
WHERE   (dic_name LIKE '%단팥%' OR dic_post LIKE '%고로케%' OR dic_word LIKE '%#고로케%')

-- 게시글별 검색어를 통한 검색 레코드 갯수
SELECT COUNT(*) as cnt
FROM brdic
WHERE   (dic_name LIKE '%단팥%' OR dic_post LIKE '%고로케%' OR dic_word LIKE '%#고로케%')
    
--  게시글별 검색 목록 + 페이징 + 메인 이미지 
SELECT dic_no, adminno, dic_name, dic_post, recom, dic_view, passwd, dic_word, dic_crtime, dic_mdtime, file1, file1saved, thumb1, size1, r
FROM (
           SELECT dic_no, adminno, dic_name, dic_post, recom, dic_view, passwd, dic_word, dic_crtime, dic_mdtime, file1, file1saved, thumb1, size1, rownum as r
           FROM (
                     SELECT dic_no, adminno, dic_name, dic_post, recom, dic_view, passwd, dic_word, dic_crtime, dic_mdtime, file1, file1saved, thumb1, size1
                     FROM brdic
                     WHERE   (dic_name LIKE '%단팥%' OR dic_post LIKE '%고로케%' OR dic_word LIKE '%#고로케%')
                     ORDER BY dic_no DESC
           )          
)
WHERE r >= 1 AND r <= 3;

-- 패스워드 검사
SELECT COUNT(*) as cnt 
    FROM brdic
    WHERE dic_no=27 AND passwd=1234
    
-- 텍스트 수정 
 UPDATE brdic
    SET dic_name= '바게뜨', dic_post='탄수화물: 16.28g',  dic_word='#바게뜨', dic_mdtime=sysdate
    WHERE dic_no = 24

    
-- 파일(사진) 수정
UPDATE brdic
    SET file1= '바게뜨.jpg', file1saved='바게뜨.jpg', thumb1='바게뜨_t.jpg', size1=198805, dic_mdtime=sysdate
    WHERE dic_no = 24

-- 삭제 기능
DELETE FROM brdic
    WHERE dic_no=27
    
 -- 추천
 UPDATE brdic
    SET recom = recom + 1
    WHERE dic_no = 27
    
 -- 조회수 증가
 UPDATE brdic
    SET dic_view = dic_view + 1
    WHERE dic_no = 27
    
commit;