package dev.mvc.authgrp;

import java.util.List;

public interface AuthgrpDAOInter {
    /**
     * 권한그룹 생성
     * @param authgrpVO
     * @return
     */
    public int create(AuthgrpVO authgrpVO);
    
    /**
     * 권한번호별 목록
     * select id="list_authno_asc" resultType="dev.mvc.authgrp.AuthgrpVO"
     * @return
     */
    public List<AuthgrpVO> list_authno_asc();
    
    /**
     * 조회
     * select id="read" resultType="dev.mvc.authgrp.AuthgrpVO" parameterType="int"
     * @param authno
     * @return AuthgrpVO
     */    
    public AuthgrpVO read(int authno);
    
    /**
     * 수정 처리
     * update id="update" parameterType="dev.mvc.authgrp.AuthgrpVO"
     * @param authgrpVO
     * @return 수정된 레코드 갯수
     */
    public int update(AuthgrpVO authgrpVO);
    
    /**
     * 삭제 처리
     * delete id="delete" parameterType="int"
     * @param authno
     * @return 수정된 레코드 갯수
     */
    public int delete(int authno);

}
