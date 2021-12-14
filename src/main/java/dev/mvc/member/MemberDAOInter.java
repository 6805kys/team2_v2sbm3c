package dev.mvc.member;

public interface MemberDAOInter {
    /**
     * 회원 가입
     * @param memberVO
     * @return
     */
    public int create(MemberVO memberVO);
    

}
