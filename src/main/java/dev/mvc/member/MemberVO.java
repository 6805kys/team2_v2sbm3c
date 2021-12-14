package dev.mvc.member;

public class MemberVO {
    /*
    memberno NUMBER(10) NOT NULL, -- 회원 번호, 레코드를 구분하는 컬럼 
    id             VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 중복 안됨, 레코드를 구분 
    passwd      VARCHAR(60)   NOT NULL, -- 패스워드, 영숫자 조합
    nickname   VARCHAR(30)   NOT NULL, -- 성명, 한글 10자 저장 가능
    tel            VARCHAR(15)   NOT NULL, -- 전화번호
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
    /** 가입일 */
    private String mdate = "";
    /** 등급 번호 */
    private int gradeno = 0;
    
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
