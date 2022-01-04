package dev.mvc.member;

public class MemberVO {
    /*
    memberno NUMBER(10) NOT NULL, -- 회원 번호, 레코드를 구분하는 컬럼 
    id             VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 중복 안됨, 레코드를 구분 
    passwd      VARCHAR(60)   NOT NULL, -- 패스워드, 영숫자 조합
    nickname   VARCHAR(30)   NOT NULL, -- 성명, 한글 10자 저장 가능
    tel            VARCHAR(15)   NOT NULL, -- 전화번호
    email        VARCHAR(50)   NOT NULL, -- 이메일
    mdate       DATE             NOT NULL, -- 가입일    
    gradeno     NUMBER(10)     NOT NULL, -- 등급(씨앗, 밀, 빵, 파트너회원 등)
    PRIMARY KEY (memberno),                     -- 한번 등록된 값은 중복 안됨
    FOREIGN KEY (GRADENO) REFERENCES grade(GRADENO)
    */
    /** 회원 번호 */
    private int memberno;
    /** 아이디 */
    private String id = "";
    /** 패스워드 */
    private String passwd = "";
    /** 닉네임 */
    private String nickname = "";
    /** 전화 번호 */
    private String tel = "";
    /** 이메일 */
    private String email = "";
    /** 가입일 */
    private String mdate = "";
    /** 등급 번호 */
    private int gradeno = 0;
    
    /** 등록된 패스워드 */
    private String old_passwd = "";
    /** id 저장 여부 */
    private String id_save = "";
    /** passwd 저장 여부 */
    private String passwd_save = "";
    /** 이동할 주소 저장 */
    private String url_address = "";
    
    /** 취향1 */
    private String taste1 = "";
    /** 취향2 */
    private String taste2 = "";
    
    
    
    public String getTaste1() {
        return taste1;
    }
    public void setTaste1(String taste1) {
        this.taste1 = taste1;
    }
    public String getTaste2() {
        return taste2;
    }
    public void setTaste2(String taste2) {
        this.taste2 = taste2;
    }
    public String getOld_passwd() {
        return old_passwd;
    }
    public void setOld_passwd(String old_passwd) {
        this.old_passwd = old_passwd;
    }
    public String getId_save() {
        return id_save;
    }
    public void setId_save(String id_save) {
        this.id_save = id_save;
    }
    public String getPasswd_save() {
        return passwd_save;
    }
    public void setPasswd_save(String passwd_save) {
        this.passwd_save = passwd_save;
    }
    public String getUrl_address() {
        return url_address;
    }
    public void setUrl_address(String url_address) {
        this.url_address = url_address;
    }
    public int getMemberno() {
        return memberno;
    }
    public void setMemberno(int memberno) {
        this.memberno = memberno;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPasswd() {
        return passwd;
    }
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }
    public String getNickname() {
        return nickname;
    }
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    public String getTel() {
        return tel;
    }
    public void setTel(String tel) {
        this.tel = tel;
    }
    public String getEmail() {
    return email;
    }
    public void setEmail(String email) {
    this.email = email;
    }
    public String getMdate() {
        return mdate;
    }
    public void setMdate(String mdate) {
        this.mdate = mdate;
    }
    public int getGradeno() {
        return gradeno;
    }
    public void setGradeno(int gradeno) {
        this.gradeno = gradeno;
    }

}
