package dev.mvc.brpost;

/*
        post_no INT NOT NULL PRIMARY KEY,
        post_name VARCHAR(100) NOT NULL,
        post_id VARCHAR(100) NOT NULL,
        post_crtime DATE DEFAULT sysdate,
        post_mdtime DATE DEFAULT sysdate
*/
public class BrpostVO {
    /** 브랜드 그룹 번호 */
    private int post_no;
    /**  브랜드 이름 */
    private String post_name;
    /** 브랜드 인기 랭킹 */
    private String post_id;
    /** 신상 입고 */
    private String post_crtime;
    /** 브랜드 등록날짜 */
    private String post_mdtime;
    
    public BrpostVO() {
        
    }

    public BrpostVO(int post_no, String post_name, String post_id,  String post_crtime, String post_mdtime) {
        this.post_no = post_no;
        this.post_name = post_name;
        this.post_id = post_id;
        this.post_crtime = post_crtime;
        this.post_mdtime = post_mdtime;
    }

    @Override
    public String toString() {
        return "BrpostVO [post_no=" + post_no + ", post_name=" + post_name + ", post_id=" + post_id 
                + ", post_crtime=" + post_crtime + ", post_mdtime=" + post_mdtime+ "]";
    }

    public int getPost_no() {
        return post_no;
    }

    public void setPost_no(int post_no) {
        this.post_no = post_no;
    }

    public String getPost_name() {
        return post_name;
    }

    public void setPost_name(String post_name) {
        this.post_name = post_name;
    }

    public String getPost_id() {
        return post_id;
    }

    public void setPost_id(String post_id) {
        this.post_id = post_id;
    }

    public String getPost_crtime() {
        return post_crtime;
    }

    public void setPost_crtime(String post_crtime) {
        this.post_crtime = post_crtime;
    }
    
    public String getPost_mdtime() {
        return post_mdtime;
    }

    public void setPost_mdtime(String post_mdtime) {
        this.post_mdtime = post_mdtime;
    }
}


