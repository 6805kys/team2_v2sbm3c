package dev.mvc.brpost;

import java.util.List;

public interface BrpostProcInter {
    /**
     * 등록
     * @param watchbrandgrpVO
     * @return 등록된 레코드 갯수
     */
    public int create(BrpostVO brpostVO);
    
    /**
     * 등록 순서별 목록
     * @return
     */
    public List<BrpostVO> list_post_no_asc();
    
    /**
     * 조회, 수정폼, 삭제폼
     * <select id="read" resultType="dev.mvc.watchbrandgrp.WatchbrandgrpVO" parameterType="int">
     * @param brand_no 카테고리 그룹 번호, PK
     * @return
     */
    public BrpostVO read(int post_no);
    
    /**
     * 수정 처리
     * @param watchbrandgrpVO
     * @return 처리된 레코드 갯수
     */
    public int update(BrpostVO brpostVO);
    
    /**
     * 삭제 처리
     * @param watchbrandgrpno
     * @return 처리된 레코드 갯수
     */
    public int delete(int brand_no);

}
