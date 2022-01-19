/**********************************/
/* Table Name: ë¹?ë°±ê³¼?¬ì „ */
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

COMMENT ON TABLE brdic is 'ë¹?ë°±ê³¼?¬ì „';
COMMENT ON COLUMN brdic.dic_no is 'ë¹?ë°±ê³¼?¬ì „ê¸€ ë²ˆí˜¸';
COMMENT ON COLUMN brdic.adminno is 'ê´€ë¦¬ìž ë²ˆí˜¸';
COMMENT ON COLUMN brdic.dic_name is 'ë¹?ë°±ê³¼?¬ì „ê¸€ ?œëª©';
COMMENT ON COLUMN brdic.dic_post is 'ë¹?ë°±ê³¼?¬ì „ê¸€ ?´ìš©';
COMMENT ON COLUMN brdic.recom  is 'ì¶”ì²œ??;
COMMENT ON COLUMN brdic.dic_view is 'ì¡°íšŒ??;
COMMENT ON COLUMN brdic.passwd is '?¨ìŠ¤?Œë“œ';
COMMENT ON COLUMN brdic.dic_word is 'ê²€?‰ì–´';
COMMENT ON COLUMN brdic.dic_crtime is 'ë¹?ë°±ê³¼?¬ì „ê¸€ ?‘ì„±?¼ì‹œ';
COMMENT ON COLUMN brdic.dic_mdtime is 'ë¹?ë°±ê³¼?¬ì „ê¸€ ?˜ì •?¼ì‹œ';
COMMENT ON COLUMN brdic.file1 is 'ë©”ì¸ ?´ë?ì§€';
COMMENT ON COLUMN brdic.file1saved is '?¤ì œë¡??€?¥ëœ ë©”ì¸ ?´ë?ì§€';
COMMENT ON COLUMN brdic.thumb1 is 'ë©”ì¸ ?´ë?ì§€ preview';
COMMENT ON COLUMN brdic.size1 is 'ë©”ì¸ ?´ë?ì§€ ?¬ê¸°';

CREATE SEQUENCE brdic_seq
  START WITH 1                -- ?œìž‘ ë²ˆí˜¸
  INCREMENT BY 1            -- ì¦ê?ê°?  MAXVALUE 9999999999  -- ìµœë?ê°? 9999999999 --> NUMBER(10) ?€??  CACHE 2                        -- 2ë²ˆì? ë©”ëª¨ë¦¬ì—?œë§Œ ê³„ì‚°
  NOCYCLE;                      -- ?¤ì‹œ 1ë¶€???ì„±?˜ëŠ” ê²ƒì„ ë°©ì?
  
 INSERT INTO brdic(dic_no, adminno, dic_name, dic_post, dic_view, recom, passwd, dic_word,
                                     file1, file1saved, thumb1, size1, dic_crtime, dic_mdtime)
VALUES (brdic_seq.nextval, 3, '?¨íŒ¥ë¹?, '?ì–‘ ?•ë³´
?´ëŸ‰ : 931 kJ(223 kcal)
?„ìˆ˜?”ë¬¼ : 41.6g
ì§€ë°?: 3.2g
  ???¬í™”ì§€ë°?: 0.671g
  ???¸ëžœ??ì§€ë°?: 0.525g
  ???¤ë¶ˆ?¬í™” ì§€ë°?: 0.878g
  ??ë¶ˆí¬??ì§€ë°?: 1.299g

ì½œë ˆ?¤í…Œë¡?: 28mg
?ì´?¬ìœ  : 1.3g
?˜íŠ¸ë¥?: 271mg
ì¹¼ë¥¨ : 87mg

?”ì•½ : ?¨íŒ¥ë¹?1ê°? ?ˆì— 223ì¹¼ë¡œë¦¬ê? ?ˆìŠµ?ˆë‹¤.
  ??ì¹¼ë¡œë¦?ë¶„ì„: 13% ì§€ë°? 76% ?„ìˆ˜?”ë¬¼, 11% ?¨ë°±ì§?', 0, 0, 1234, '#?¨íŒ¥ë¹?, '?¨íŒ¥ë¹?jpg', '?¨íŒ¥ë¹?1.jpg', '?¨íŒ¥ë¹?1_t.jpg', 495881, sysdate, sysdate);


-- R(List)
SELECT dic_no, adminno, dic_name, dic_post, dic_view, recom, passwd, dic_word, file1, file1saved, thumb1, size1, dic_crtime, dic_mdtime
FROM brdic
ORDER BY dic_no;
      
-- R(Read)
SELECT dic_no, adminno, dic_name, dic_post, dic_view, recom, passwd, dic_word, file1, file1saved, thumb1, size1, dic_crtime, dic_mdtime
FROM brdic
WHERE dic_no=27;
      
-- ê²Œì‹œê¸€ë³?ê²€?‰ì–´ë¥??µí•œ ê²€???ˆì½”??SELECT dic_no, adminno, dic_name, dic_post, recom, dic_view, passwd, dic_word, dic_crtime, dic_mdtime, file1, file1saved, thumb1, size1
FROM brdic
WHERE   (dic_name LIKE '%?¨íŒ¥%' OR dic_post LIKE '%ê³ ë¡œì¼€%' OR dic_word LIKE '%#ê³ ë¡œì¼€%')

-- ê²Œì‹œê¸€ë³?ê²€?‰ì–´ë¥??µí•œ ê²€???ˆì½”??ê°?ˆ˜
SELECT COUNT(*) as cnt
FROM brdic
WHERE   (dic_name LIKE '%?¨íŒ¥%' OR dic_post LIKE '%ê³ ë¡œì¼€%' OR dic_word LIKE '%#ê³ ë¡œì¼€%')
    
--  ê²Œì‹œê¸€ë³?ê²€??ëª©ë¡ + ?˜ì´ì§?+ ë©”ì¸ ?´ë?ì§€ 
SELECT dic_no, adminno, dic_name, dic_post, recom, dic_view, passwd, dic_word, dic_crtime, dic_mdtime, file1, file1saved, thumb1, size1, r
FROM (
           SELECT dic_no, adminno, dic_name, dic_post, recom, dic_view, passwd, dic_word, dic_crtime, dic_mdtime, file1, file1saved, thumb1, size1, rownum as r
           FROM (
                     SELECT dic_no, adminno, dic_name, dic_post, recom, dic_view, passwd, dic_word, dic_crtime, dic_mdtime, file1, file1saved, thumb1, size1
                     FROM brdic
                     WHERE   (dic_name LIKE '%?¨íŒ¥%' OR dic_post LIKE '%ê³ ë¡œì¼€%' OR dic_word LIKE '%#ê³ ë¡œì¼€%')
                     ORDER BY dic_no DESC
           )          
)
WHERE r >= 1 AND r <= 3;

-- ?¨ìŠ¤?Œë“œ ê²€??SELECT COUNT(*) as cnt 
    FROM brdic
    WHERE dic_no=27 AND passwd=1234
    
-- ?ìŠ¤???˜ì • 
 UPDATE brdic
    SET dic_name= 'ë°”ê²Œ??, dic_post='?„ìˆ˜?”ë¬¼: 16.28g',  dic_word='#ë°”ê²Œ??, dic_mdtime=sysdate
    WHERE dic_no = 24

    
-- ?Œì¼(?¬ì§„) ?˜ì •
UPDATE brdic
    SET file1= 'ë°”ê²Œ??jpg', file1saved='ë°”ê²Œ??jpg', thumb1='ë°”ê²Œ??t.jpg', size1=198805, dic_mdtime=sysdate
    WHERE dic_no = 24

-- ?? œ ê¸°ëŠ¥
DELETE FROM brdic
    WHERE dic_no=27
    
 -- ì¶”ì²œ
 UPDATE brdic
    SET recom = recom + 1
    WHERE dic_no = 27
    
 -- ì¡°íšŒ??ì¦ê?
 UPDATE brdic
    SET dic_view = dic_view + 1
    WHERE dic_no = 27
    
commit;