package dev.mvc.bakery;

import java.util.HashMap;
import java.util.List;

public interface BakeryProcInter {
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
   * 페이지 목록 문자열 생성, Box 형태
   * @param search_count 검색 갯수
   * @param now_page 현재 페이지, now_page는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(int search_count, int now_page, String word);
  
  /**
   * 조회, 수정폼
   * @param cateno 카테고리 번호, PK
   * @return
   */
  public BakeryVO read(int bakeryno);
  
}
