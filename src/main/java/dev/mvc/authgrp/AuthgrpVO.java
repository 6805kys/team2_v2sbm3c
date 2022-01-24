package dev.mvc.authgrp;

public class AuthgrpVO {
    /*
     * authno NUMBER(10) NOT NULL, -- 권한 번호
     * authname VARCHAR(20) NOT NULL, -- 권한 그룹명
     * PRIMARY KEY (authno)
     */
    /** 권한 번호 */
    private int authno;
    /** 권한그룹명 */
    private String authname = "";
    
    public AuthgrpVO() {
        
    }
    
    public AuthgrpVO(int authno, String authname) {
        this.authno = authno;
        this.authname = authname;      
    }
    
    @Override
    public String toString() {
        return "AuthgrpVO [authno=" + authno + ", authname" + authname + "]";
    }
    
    
    public int getAuthno() {
        return authno;
    }
    public void setAuthno(int authno) {
        this.authno = authno;
    }
    public String getAuthname() {
        return authname;
    }
    public void setAuthname(String authname) {
        this.authname = authname;
    }
    

    
    
}
