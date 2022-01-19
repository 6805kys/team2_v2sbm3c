/**********************************/
/* Table Name: �?백과?�전 */
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

COMMENT ON TABLE brdic is '�?백과?�전';
COMMENT ON COLUMN brdic.dic_no is '�?백과?�전글 번호';
COMMENT ON COLUMN brdic.adminno is '관리자 번호';
COMMENT ON COLUMN brdic.dic_name is '�?백과?�전글 ?�목';
COMMENT ON COLUMN brdic.dic_post is '�?백과?�전글 ?�용';
COMMENT ON COLUMN brdic.recom  is '추천??;
COMMENT ON COLUMN brdic.dic_view is '조회??;
COMMENT ON COLUMN brdic.passwd is '?�스?�드';
COMMENT ON COLUMN brdic.dic_word is '검?�어';
COMMENT ON COLUMN brdic.dic_crtime is '�?백과?�전글 ?�성?�시';
COMMENT ON COLUMN brdic.dic_mdtime is '�?백과?�전글 ?�정?�시';
COMMENT ON COLUMN brdic.file1 is '메인 ?��?지';
COMMENT ON COLUMN brdic.file1saved is '?�제�??�?�된 메인 ?��?지';
COMMENT ON COLUMN brdic.thumb1 is '메인 ?��?지 preview';
COMMENT ON COLUMN brdic.size1 is '메인 ?��?지 ?�기';

CREATE SEQUENCE brdic_seq
  START WITH 1                -- ?�작 번호
  INCREMENT BY 1            -- 증�?�?  MAXVALUE 9999999999  -- 최�?�? 9999999999 --> NUMBER(10) ?�??  CACHE 2                        -- 2번�? 메모리에?�만 계산
  NOCYCLE;                      -- ?�시 1부???�성?�는 것을 방�?
  
 INSERT INTO brdic(dic_no, adminno, dic_name, dic_post, dic_view, recom, passwd, dic_word,
                                     file1, file1saved, thumb1, size1, dic_crtime, dic_mdtime)
VALUES (brdic_seq.nextval, 3, '?�팥�?, '?�양 ?�보
?�량 : 931 kJ(223 kcal)
?�수?�물 : 41.6g
지�?: 3.2g
  ???�화지�?: 0.671g
  ???�랜??지�?: 0.525g
  ???�불?�화 지�?: 0.878g
  ??불포??지�?: 1.299g

콜레?�테�?: 28mg
?�이?�유 : 1.3g
?�트�?: 271mg
칼륨 : 87mg

?�약 : ?�팥�?1�? ?�에 223칼로리�? ?�습?�다.
  ??칼로�?분석: 13% 지�? 76% ?�수?�물, 11% ?�백�?', 0, 0, 1234, '#?�팥�?, '?�팥�?jpg', '?�팥�?1.jpg', '?�팥�?1_t.jpg', 495881, sysdate, sysdate);


-- R(List)
SELECT dic_no, adminno, dic_name, dic_post, dic_view, recom, passwd, dic_word, file1, file1saved, thumb1, size1, dic_crtime, dic_mdtime
FROM brdic
ORDER BY dic_no;
      
-- R(Read)
SELECT dic_no, adminno, dic_name, dic_post, dic_view, recom, passwd, dic_word, file1, file1saved, thumb1, size1, dic_crtime, dic_mdtime
FROM brdic
WHERE dic_no=27;
      
-- 게시글�?검?�어�??�한 검???�코??SELECT dic_no, adminno, dic_name, dic_post, recom, dic_view, passwd, dic_word, dic_crtime, dic_mdtime, file1, file1saved, thumb1, size1
FROM brdic
WHERE   (dic_name LIKE '%?�팥%' OR dic_post LIKE '%고로케%' OR dic_word LIKE '%#고로케%')

-- 게시글�?검?�어�??�한 검???�코??�?��
SELECT COUNT(*) as cnt
FROM brdic
WHERE   (dic_name LIKE '%?�팥%' OR dic_post LIKE '%고로케%' OR dic_word LIKE '%#고로케%')
    
--  게시글�?검??목록 + ?�이�?+ 메인 ?��?지 
SELECT dic_no, adminno, dic_name, dic_post, recom, dic_view, passwd, dic_word, dic_crtime, dic_mdtime, file1, file1saved, thumb1, size1, r
FROM (
           SELECT dic_no, adminno, dic_name, dic_post, recom, dic_view, passwd, dic_word, dic_crtime, dic_mdtime, file1, file1saved, thumb1, size1, rownum as r
           FROM (
                     SELECT dic_no, adminno, dic_name, dic_post, recom, dic_view, passwd, dic_word, dic_crtime, dic_mdtime, file1, file1saved, thumb1, size1
                     FROM brdic
                     WHERE   (dic_name LIKE '%?�팥%' OR dic_post LIKE '%고로케%' OR dic_word LIKE '%#고로케%')
                     ORDER BY dic_no DESC
           )          
)
WHERE r >= 1 AND r <= 3;

-- ?�스?�드 검??SELECT COUNT(*) as cnt 
    FROM brdic
    WHERE dic_no=27 AND passwd=1234
    
-- ?�스???�정 
 UPDATE brdic
    SET dic_name= '바게??, dic_post='?�수?�물: 16.28g',  dic_word='#바게??, dic_mdtime=sysdate
    WHERE dic_no = 24

    
-- ?�일(?�진) ?�정
UPDATE brdic
    SET file1= '바게??jpg', file1saved='바게??jpg', thumb1='바게??t.jpg', size1=198805, dic_mdtime=sysdate
    WHERE dic_no = 24

-- ??�� 기능
DELETE FROM brdic
    WHERE dic_no=27
    
 -- 추천
 UPDATE brdic
    SET recom = recom + 1
    WHERE dic_no = 27
    
 -- 조회??증�?
 UPDATE brdic
    SET dic_view = dic_view + 1
    WHERE dic_no = 27
    
commit;