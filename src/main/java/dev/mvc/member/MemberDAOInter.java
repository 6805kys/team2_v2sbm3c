package dev.mvc.member;

public interface MemberDAOInter {
    /**
     * 회원 가입
     * @param memberVO
     * @return
     */
    public int create(MemberVO memberVO);
    
    /**
     * 중복 아이디 검사
     * @param id
     * @return 중복 아이디 갯수
     */
    public int checkID(String id);
    
    /**
     * 중복 닉네임 검사
     * @param nickname
     * @return 중복 닉네임 갯수
     */
    public int checkNICKNAME(String nickname);
    

}
