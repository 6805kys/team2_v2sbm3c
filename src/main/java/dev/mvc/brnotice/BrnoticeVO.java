package dev.mvc.brnotice;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
        notice_no                            NUMBER(10)         NOT NULL         PRIMARY KEY,
        notice_id                               VARCHAR2(15)         NOT NULL,
        notice_name VARCHAR(100) NOT NULL,
        notice_post                             CLOB                  NOT NULL,
        recom                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        notice_view                                   NUMBER(7)         DEFAULT 0         NOT NULL,
        replycnt                              NUMBER(7)         DEFAULT 0         NOT NULL,
        passwd                                VARCHAR2(15)         NOT NULL,
        notice_word                                  VARCHAR2(300)         NULL ,
        notice_crtime                                 DATE               NOT NULL,
        notice_mdtime                                  DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        file1saved                            VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,  
 */

@Getter @Setter @ToString
public class BrnoticeVO {
  /** 컨텐츠 번호 */
  private int notice_no;
  /** 작성자ID */
  private String notice_id = "";
  /** 제목 */
  private String notice_name = "";
  /** 내용 */
  private String notice_post = "";
  /** 추천수 */
  private int recom;
  /** 조회수 */
  private int notice_view = 0;
  /** 댓글수 */
  private int replycnt = 0;
  /** 패스워드 */
  private String passwd = "";
  /** 검색어 */
  private String notice_word = "";
  /** 등록 날짜 */
  private String notice_crtime = "";
  
  private String notice_mdtime = "";
 
  

  
  public int getNotice_no() {
      return notice_no;
    }

    public void setNotice_no(int notice_no) {
      this.notice_no = notice_no;
    }
    
    public String getNotice_id() {
        return notice_id;
      }

      public void setNotice_id(String notice_id) {
        this.notice_id = notice_id;
      }

    public String getNotice_name() {
      return notice_name;
    }

    public void setNotice_name(String notice_name) {
      this.notice_name = notice_name;
    }

    public String getNotice_post() {
      return notice_post;
    }

    public void setNotice_post(String notice_post) {
      this.notice_post = notice_post;
    }

    public int getRecom() {
      return recom;
    }

    public void setRecom(int recom) {
      this.recom = recom;
    }

    public int getNotice_view() {
      return notice_view;
    }

    public void setNotice_view(int notice_view) {
      this.notice_view = notice_view;
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

    public String getNotice_word() {
      return notice_word;
    }

    public void setNotice_word(String notice_word) {
      this.notice_word = notice_word;
    }

    public String getNotice_crtime() {
      return notice_crtime;
    }

    public void setNotice_crtime(String notice_crtime) {
      this.notice_crtime = notice_crtime;
    }
    
    public String getNotice_mdtime() {
        return notice_mdtime;
      }

      public void setNotice_mdtime(String notice_mdtime) {
        this.notice_mdtime = notice_mdtime;
      }

}






