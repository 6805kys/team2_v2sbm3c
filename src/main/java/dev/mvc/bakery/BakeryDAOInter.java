package dev.mvc.bakery;

import java.util.HashMap;
import java.util.List;

public interface BakeryDAOInter {
  /**
   *  검색 + 페이징 목록
   * @return
   */
  public List<BakeryVO> list_by_search_paging(HashMap<String, Object> map);    
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 조회, 수정폼
   * @param bakeryno 카테고리 번호, PK
   * @return
   */
  public BakeryVO read(int bakeryno);
  

}
