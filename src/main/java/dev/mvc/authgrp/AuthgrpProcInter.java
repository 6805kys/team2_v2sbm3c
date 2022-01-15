package dev.mvc.authgrp;

import java.util.List;

public interface AuthgrpProcInter {
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
}
