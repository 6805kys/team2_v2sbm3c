package dev.mvc.reply;

public class ReplyVO {
  /** 댓글 번호 */
  private int replyno;
  /** 관련 글 번호 */
  private int content_no;
  /** 회원 번호 */
  private int memberno;
  /** 내용 */
  private String reply_content;
  /** 패스워드 */
  private String passwd;
  /** 등록일 */
  private String reply_crtime;
  
  public int getReplyno() {
    return replyno;
  }
  public void setReplyno(int replyno) {
    this.replyno = replyno;
  }
  public int getContent_no() {
    return content_no;
  }
  public void setContent_no(int content_no) {
    this.content_no = content_no;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getReply_content() {
    return reply_content;
  }
  public void setReply_content(String reply_content) {
    this.reply_content = reply_content;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getReply_crtime() {
    return reply_crtime;
  }
  public void setReply_crtime(String reply_crtime) {
    this.reply_crtime = reply_crtime;
  }
  
  
}