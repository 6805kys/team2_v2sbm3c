package dev.mvc.brdic;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
        dic_no                            NUMBER(10)         NOT NULL         PRIMARY KEY,
       adminno                       NUMBER(10)   NULL,
        dic_name VARCHAR(100) NOT NULL,
        dic_post                             CLOB                  NOT NULL,
        recom                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        dic_view                                   NUMBER(7)         DEFAULT 0         NOT NULL,
        replycnt                              NUMBER(7)         DEFAULT 0         NOT NULL,
        passwd                                VARCHAR2(15)         NOT NULL,
        dic_word                                  VARCHAR2(300)         NULL ,
        dic_crtime                                 DATE               NOT NULL,
        dic_mdtime                                  DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        file1saved                            VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,  
 */

@Getter @Setter @ToString
public class BrdicVO {
  /** 컨텐츠 번호 */
  private int dic_no;
  /** 관리자 번호 */
  private int adminno;
  /** 제목 */
  private String dic_name = "";
  /** 내용 */
  private String dic_post = "";
  /** 추천수 */
  private int recom;
  /** 조회수 */
  private int dic_view = 0;
  /** 패스워드 */
  private String passwd = "";
  /** 검색어 */
  private String dic_word = "";
  /** 등록 날짜 */
  private String dic_crtime = "";
  
  private String dic_mdtime = "";
  
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
  
  public int getDic_no() {
      return dic_no;
    }

    public void setDic_no(int dic_no) {
      this.dic_no = dic_no;
    }

    public int getAdminno() {
        return adminno;
      }
      public void setMemberno(int adminno) {
        this.adminno = adminno;
      }
    
    public String getDic_name() {
      return dic_name;
    }

    public void setDic_name(String dic_name) {
      this.dic_name = dic_name;
    }

    public String getDic_post() {
      return dic_post;
    }

    public void setDic_post(String dic_post) {
      this.dic_post = dic_post;
    }

    public int getRecom() {
      return recom;
    }

    public void setRecom(int recom) {
      this.recom = recom;
    }

    public int getDic_view() {
      return dic_view;
    }

    public void setDic_view(int dic_view) {
      this.dic_view = dic_view;
    }


    public String getPasswd() {
      return passwd;
    }

    public void setPasswd(String passwd) {
      this.passwd = passwd;
    }

    public String getDic_word() {
      return dic_word;
    }

    public void setDic_word(String dic_word) {
      this.dic_word = dic_word;
    }

    public String getDic_crtime() {
      return dic_crtime;
    }

    public void setDic_crtime(String dic_crtime) {
      this.dic_crtime = dic_crtime;
    }
    
    public String getDic_mdtime() {
        return dic_mdtime;
      }

      public void setDic_mdtime(String dic_mdtime) {
        this.dic_mdtime = dic_mdtime;
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






