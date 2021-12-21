/**********************************/
/* Table Name: 빵그룹 */
/**********************************/
DROP TABLE breadgrp CASCADE CONSTRAINTS;

CREATE TABLE breadgrp(
breadgrpno                     NUMBER(10)  NOT NULL  PRIMARY KEY,
breadgrp                       VARCHAR2(30)  NOT NULL
);

COMMENT ON TABLE breadgrp is '빵그룹';
COMMENT ON COLUMN breadgrp.breadgrpno is '빵그룹번호';
COMMENT ON COLUMN breadgrp.breadgrp is '빵그룹이름';

DROP SEQUENCE breadgrp_seq;

CREATE SEQUENCE breadgrp_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  

-- C
INSERT INTO breadgrp(breadgrpno, breadgrp)
VALUES (breadgrp_seq.nextval, '팥류');

-- R(List)
SELECT breadgrpno, breadgrp FROM breadgrp ORDER BY breadgrpno;
      
-- R(Read)
SELECT breadgrpno, breadgrp FROM breadgrp WHERE breadgrpno=1;
      
-- U
UPDATE breadgrp SET breadgrp='식빵류' WHERE breadgrpno=4;

-- D
DELETE FROM breadgrp WHERE breadgrpno=1;