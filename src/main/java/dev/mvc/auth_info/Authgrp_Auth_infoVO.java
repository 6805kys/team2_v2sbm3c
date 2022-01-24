package dev.mvc.auth_info;

public class Authgrp_Auth_infoVO {
    /** 권한그룹 번호 */
    private int r_authno;
    /** 권한그룹 이름 */
    private String r_authname = "";
    
    /** 권한그룹 번호 */
    private int authno;
    /** 등록 권한 */
    private String create_auth = "";
    /** 수정 권한 */
    private String update_auth = "";
    /** 삭제 권한 */
    private String delete_auth = "";
    /** 조회 권한 */
    private String read_auth = "";
    
    public int getR_authno() {
        return r_authno;
    }
    public void setR_authno(int r_authno) {
        this.r_authno = r_authno;
    }
    public String getR_authname() {
        return r_authname;
    }
    public void setR_authname(String r_authname) {
        this.r_authname = r_authname;
    }
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
    
    @Override
    public String toString() {
        return "Authgrp_Auth_infoVO [r_authno=" + r_authno + ", r_authname=" + r_authname + ", authno=" + authno
                + ", create_auth=" + create_auth + ", update_auth=" + update_auth + ", delete_auth=" + delete_auth
                + ", read_auth=" + read_auth + "]";
    }
    
}
