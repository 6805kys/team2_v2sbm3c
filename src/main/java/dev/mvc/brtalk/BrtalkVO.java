package dev.mvc.brtalk;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
        talk_no                            NUMBER(10)         NOT NULL         PRIMARY KEY,
        talk_id                               VARCHAR2(15)         NOT NULL,
        talk_name VARCHAR(100) NOT NULL,
        talk_post                             CLOB                  NOT NULL,
        recom                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        talk_view                                   NUMBER(7)         DEFAULT 0         NOT NULL,
        replycnt                              NUMBER(7)         DEFAULT 0         NOT NULL,
        passwd                                VARCHAR2(15)         NOT NULL,
        talk_word                                  VARCHAR2(300)         NULL ,
        talk_crtime                                 DATE               NOT NULL,
        talk_mdtime                                  DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        file1saved                            VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,  
 */

@Getter @Setter @ToString
public class BrtalkVO {
  /** 컨텐츠 번호 */
  private int talk_no;
  /** 작성자ID */
  private String talk_id = "";
  /** 제목 */
  private String talk_name = "";
  /** 내용 */
  private String talk_post = "";
  /** 추천수 */
  private int recom;
  /** 조회수 */
  private int talk_view = 0;
  /** 댓글수 */
  private int replycnt = 0;
  /** 패스워드 */
  private String passwd = "";
  /** 검색어 */
  private String talk_word = "";
  /** 등록 날짜 */
  private String talk_crtime = "";
  
  private String talk_mdtime = "";
 
  

  
  public int getTalk_no() {
      return talk_no;
    }

    public void setTalk_no(int talk_no) {
      this.talk_no = talk_no;
    }
    
    public String getTalk_id() {
        return talk_id;
      }

      public void setTalk_id(String talk_id) {
        this.talk_id = talk_id;
      }

    public String getTalk_name() {
      return talk_name;
    }

    public void setTalk_name(String talk_name) {
      this.talk_name = talk_name;
    }

    public String getTalk_post() {
      return talk_post;
    }

    public void setTalk_post(String talk_post) {
      this.talk_post = talk_post;
    }

    public int getRecom() {
      return recom;
    }

    public void setRecom(int recom) {
      this.recom = recom;
    }

    public int getTalk_view() {
      return talk_view;
    }

    public void setTalk_view(int talk_view) {
      this.talk_view = talk_view;
    }

    public int getReplycnt() {
      return replycnt;
    }

    public void setReplycnt(int replycnt) {
      this.replycnt = replycnt;
    }

    public String getPasswd() {
      return passwd;
    }

    public void setPasswd(String passwd) {
      this.passwd = passwd;
    }

    public String getTalk_word() {
      return talk_word;
    }

    public void setTalk_word(String talk_word) {
      this.talk_word = talk_word;
    }

    public String getTalk_crtime() {
      return talk_crtime;
    }

    public void setTalk_crtime(String talk_crtime) {
      this.talk_crtime = talk_crtime;
    }
    
    public String getTalk_mdtime() {
        return talk_mdtime;
      }

      public void setTalk_mdtime(String talk_mdtime) {
        this.talk_mdtime = talk_mdtime;
      }

}






