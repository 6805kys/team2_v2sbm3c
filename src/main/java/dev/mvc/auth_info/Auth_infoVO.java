package dev.mvc.auth_info;

public class Auth_infoVO {
    /*
     * authno NUMBER(10) NOT NULL,
     * create_auth CHAR(1) NULL,
     * update_auth CHAR(1) NULL,
     * delete_auth CHAR(1) NULL,
     * read_auth CHAR(1) NULL,
     * FOREIGN KEY (AUTHNO) REFERENCES authgrp(AUTHNO)
     */
    
    /** 권한 번호 */
    private int authno;
    /** 등록 권한 */
    private String create_auth = "";
    /** 수정 권한 */
    private String update_auth = "";
    /** 삭제 권한 */
    private String delete_auth = "";
    /** 조회 권한 */
    private String read_auth = "";
    public int getAuthno() {
        return authno;
    }
    public void setAuthno(int authno) {
        this.authno = authno;
    }
    public String getCreate_auth() {
        return create_auth;
    }
    public void setCreate_auth(String create_auth) {
        this.create_auth = create_auth;
    }
    public String getUpdate_auth() {
        return update_auth;
    }
    public void setUpdate_auth(String update_auth) {
        this.update_auth = update_auth;
    }
    public String getDelete_auth() {
        return delete_auth;
    }
    public void setDelete_auth(String delete_auth) {
        this.delete_auth = delete_auth;
    }
    public String getRead_auth() {
        return read_auth;
    }
    public void setRead_auth(String read_auth) {
        this.read_auth = read_auth;
    }
    
    
   
    

}
