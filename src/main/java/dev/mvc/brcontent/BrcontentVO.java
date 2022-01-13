package dev.mvc.brcontent;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
        content_no                            NUMBER(10)         NOT NULL         PRIMARY KEY,
        content_name VARCHAR(100) NOT NULL,
        content_post                             CLOB                  NOT NULL,
        recom                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        content_view                                   NUMBER(7)         DEFAULT 0         NOT NULL,
        replycnt                              NUMBER(7)         DEFAULT 0         NOT NULL,
        passwd                                VARCHAR2(15)         NOT NULL,
        content_word                                  VARCHAR2(300)         NULL ,
        content_crtime                                 DATE               NOT NULL,
        content_mdtime                                  DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        file1saved                            VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,  
 */

@Getter @Setter @ToString
public class BrcontentVO {
  /** 컨텐츠 번호 */
  private int content_no;
  /** 작성자ID */
  private String content_id = "";
  /** 제목 */
  private String content_name = "";
  /** 내용 */
  private String content_post = "";
  /** 추천수 */
  private int recom;
  /** 조회수 */
  private int content_view = 0;
  /** 댓글수 */
  private int replycnt = 0;
  /** 패스워드 */
  private String passwd = "";
  /** 검색어 */
  private String content_word = "";
  /** 등록 날짜 */
  private String content_crtime = "";
  
  private String content_mdtime = "";
  
  /** 메인 이미지 */
  private String file1 = "";
  /** 실제 저장된 메인 이미지 */
  private String file1saved = "";  
  /** 메인 이미지 preview */
  private String thumb1 = "";
  /** 메인 이미지 크기 */
  private long size1;
  
  /** 
  이미지 MultipartFile 
  <input type='file' class="form-control" name='file1MF' id='file1MF' 
                   value='' placeholder="파일 선택">
  */
  private MultipartFile file1MF;

  /**
   * 파일 크기 단위 출력
   */
  private String size1_label;
  
  public int getContent_no() {
      return content_no;
    }

    public void setContent_no(int content_no) {
      this.content_no = content_no;
    }
    
    public String getContent_id() {
        return content_id;
      }

      public void setContent_id(String content_id) {
        this.content_id = content_id;
      }

    public String getContent_name() {
      return content_name;
    }

    public void setContent_name(String content_name) {
      this.content_name = content_name;
    }

    public String getContent_post() {
      return content_post;
    }

    public void setContent_post(String content_post) {
      this.content_post = content_post;
    }

    public int getRecom() {
      return recom;
    }

    public void setRecom(int recom) {
      this.recom = recom;
    }

    public int getContent_view() {
      return content_view;
    }

    public void setContent_view(int Content_view) {
      this.content_view = content_view;
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

    public String getContent_word() {
      return content_word;
    }

    public void setContent_word(String content_word) {
      this.content_word = content_word;
    }

    public String getContent_crtime() {
      return content_crtime;
    }

    public void setContent_crtime(String content_crtime) {
      this.content_crtime = content_crtime;
    }
    
    public String getContent_mdtime() {
        return content_mdtime;
      }

      public void setContent_mdtime(String content_mdtime) {
        this.content_mdtime = content_mdtime;
      }

      
    public String getFile1() {
      return file1;
    }

    public void setFile1(String file1) {
      this.file1 = file1;
    }

    public String getFile1saved() {
      return file1saved;
    }

    public void setFile1saved(String file1saved) {
      this.file1saved = file1saved;
    }

    public String getThumb1() {
      return thumb1;
    }

    public void setThumb1(String thumb1) {
      this.thumb1 = thumb1;
    }

    public long getSize1() {
      return size1;
    }

    public void setSize1(long size1) {
      this.size1 = size1;
    }


    public MultipartFile getFile1MF() {
      return file1MF;
    }

    public void setFile1MF(MultipartFile file1mf) {
      file1MF = file1mf;
    }

    public String getSize1_label() {
      return size1_label;
    }

    public void setSize1_label(String size1_label) {
      this.size1_label = size1_label;
    }
}






