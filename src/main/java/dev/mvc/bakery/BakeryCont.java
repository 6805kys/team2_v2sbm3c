package dev.mvc.bakery;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tag.TagProcInter;
import dev.mvc.tag.TagVO;


@Controller
public class BakeryCont {
  @Autowired
  @Qualifier("dev.mvc.bakery.BakeryProc")
  private BakeryProcInter bakeryProc;
  
  @Autowired
  @Qualifier("dev.mvc.tag.TagProc")
  private TagProcInter tagProc;
  
  public BakeryCont() {
    System.out.println("--> BakeryCont created.");
  }
  
  
  /**
   * 새로고침 방지, EL에서 param으로 접근
   * @return
   */
  @RequestMapping(value="/bakery/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  
  /**
   * 전체 목록
   * http://localhost:9091/bakery/list_all.do 
   * @return
   */
  @RequestMapping(value="/bakery/list_by_search_paging.do", method=RequestMethod.GET )
  public ModelAndView list_by_search_paging(
      @RequestParam(value = "word", defaultValue = "") String word,
      @RequestParam(value = "now_page", defaultValue = "1") int now_page,
      HttpServletRequest request) {
    System.out.println("--> list_by_search_paging now_page: "+ now_page);
    
    ModelAndView mav = new ModelAndView();
 
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word); // #{word}
    map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
    
    
    List<BakeryVO> list = this.bakeryProc.list_by_search_paging(map);
    mav.addObject("list", list); // request.setAttribute("list", list);
    
    // 검색된 레코드 갯수
    int search_count = bakeryProc.search_count(map);
    mav.addObject("search_count", search_count);    

    String paging = bakeryProc.pagingBox(search_count, now_page, word);
    mav.addObject("paging", paging);
    mav.addObject("now_page", now_page);
    mav.setViewName("/bakery/list_by_search_paging"); // /bakery/list_by_search_paging.jsp
    return mav;
  }
  
  
  /**
   * 조회 + 수정폼 http://localhost:9091/cate/read_update.do
   * 
   * @return
   */
  @RequestMapping(value = "/bakery/read.do", method = RequestMethod.GET)
  public ModelAndView read(int bakeryno) {
 
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/bakery/read"); // read_update.jsp
    
    // 빵집 정보
    BakeryVO bakeryVO = this.bakeryProc.read(bakeryno);
    mav.addObject("bakeryVO", bakeryVO);
    
    // 태그 정보
    List<TagVO> taglist = this.tagProc.list_by_bakeryno(bakeryno);
    mav.addObject("taglist", taglist);

    
    return mav; // forward
  }


  
}
