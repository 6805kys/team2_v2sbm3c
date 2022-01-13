package dev.mvc.brnotice;

import java.util.HashMap;
import java.util.List;

public interface BrnoticeProcInter {
    /**
     * 등록
     * 
     * @param noticesVO
     * @return
     */
    public int create(BrnoticeVO brnoticeVO);

    /**
     * 조회
     * @param noticesno
     * @return
     */
    public BrnoticeVO read(int notice_no);
    
    /**
     * 특정 카테고리의 등록된 글목록
     * @return
     */
    public List<BrnoticeVO> list_notice_no_asc();
    
    /**
     * 카테고리별 검색 목록
     * @param hashMap
     * @return
     */
    public List<BrnoticeVO> list_by_notice_no_search(HashMap<String, Object> hashMap);

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
    public List<BrnoticeVO> list_by_notice_no_search_paging(HashMap<String, Object> map);
    
    /**
     * 페이지 목록 문자열 생성, Box 형태
     * @param categrpno 카테고리번호
     * @param search_count 검색 갯수
     * @param now_page 현재 페이지, now_page는 1부터 시작
     * @param word 검색어
     * @return
     */
    public String pagingBox(int search_count, int now_page, String notice_word);
    
    /**
     * 패스워드 체크
     * @param map
     * @return
     */
    public int passwd_check(HashMap<String, Object> map);
    
    /**
     * 텍스트 수정용 조회
     * @param noticesno
     * @return
     */
    public BrnoticeVO read_update_text(int notice_no);

    /**
     * 텍스트 정보 수정
     * @param noticesVO
     * @return
     */
    public int update_text(BrnoticeVO brnoticeVO);

   
    /**
     * 삭제
     * @param noticesno
     * @return
     */
    public int delete(int notice_no);
    
    /**
     * 추천수 증가
     * @param noticesno
     * @return
     */
    public int update_recom(int notice_no);
    
    /**
     * 조회수 증가
     * @param noticesno
     * @return
     */
    public int update_notice_view(int notice_no);
}



