package dev.mvc.brdic;

import java.util.HashMap;
import java.util.List;

public interface BrdicDAOInter {
    /**
     * 등록
     * 
     * @param contentsVO
     * @return
     */
    public int create(BrdicVO brdicVO);
    
    /**
     * 조회
     * @param contentsno
     * @return
     */
    public BrdicVO read(int dic_no);
    
    /**
     * 특정 카테고리의 등록된 글목록
     * @return
     */
    public List<BrdicVO> list_dic_no_asc();
   
    /**
     * 카테고리별 검색 목록
     * @param hashMap
     * @return
     */
    public List<BrdicVO> list_by_dic_no_search(HashMap<String, Object> hashMap);

    /**
     * 카테고리별 검색 레코드 갯수
     * @param hashMap
     * @return
     */
    public int search_count(HashMap<String, Object> hashMap);
    
    /**
     * 검색 + 페이징 목록
     * @param map
     * @return
     */
    public List<BrdicVO> list_by_dic_no_search_paging(HashMap<String, Object> map);
   
    /**
     * 패스워드 체크
     * @param map
     * @return
     */
    public int passwd_check(HashMap<String, Object> map);
 
    /**
     * 텍스트 정보 수정
     * @param contentsVO
     * @return
     */
    public int update_text(BrdicVO brdicVO);
    
    /**
     * 파일 정보 수정
     * @param contentsVO
     * @return
     */
    public int update_file(BrdicVO brdicVO);
    
    /**
     * 삭제
     * @param contentsno
     * @return
     */
    public int delete(int dic_no);
   
    /**
     * 추천수 증가
     * @param contentsno
     * @return
     */
    public int update_recom(int dic_no);
    
    /**
     * 조회수 증가
     * @param contentsno
     * @return
     */
    public int update_dic_view(int dic_no);
}





