package dev.mvc.brpost;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BrpostCont {
    @Autowired
    @Qualifier("dev.mvc.brpost.BrpostProc")
    private BrpostProcInter brpostProc;

    public BrpostCont() {
        System.out.println("-> BrpostCont created.");
    }

    // http://localhost:9091/brpost/create.do
    /**
     * 등록 폼
     * 
     * @return
     */
    @RequestMapping(value = "/brpost/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/Brpost/create"); // webapp/WEB-INF/views/brpost/create.jsp

        return mav; // forward
    }

    // http://localhost:9091/brpost/create.do
    /**
     * 등록 처리
     * 
     * @param brpostVO
     * @return
     */
    @RequestMapping(value = "/brpost/create.do", method = RequestMethod.POST)
    public ModelAndView create(BrpostVO brpostVO) { // watchbrandgrpVO 자동 생성, Form -> VO
        // BrpostVO brpostVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("brpostVO", brpostVO); 자동 실행

        ModelAndView mav = new ModelAndView();

        int cnt = this.brpostProc.create(brpostVO); // 등록 처리
        // cnt = 0; // error test
        
        mav.addObject("cnt", cnt);
       
        if (cnt == 1) {
            // System.out.println("등록 성공");
            
            // mav.addObject("code", "create_success"); // request에 저장, request.setAttribute("code", "create_success")
            // mav.setViewName("/brpost/msg"); // /WEB-INF/views/brpost/msg.jsp
            
            // response.sendRedirect("/brpost/list.do");
            mav.addObject("code", "create_success"); // request에 저장, request.setAttribute("code", "delete_success")
        }else {
            mav.addObject("code", "create_fail"); // request에 저장, request.setAttribute("code", "create_fail")
        } 
            mav.setViewName("/brpost/msg"); // /WEB-INF/views/brpost/msg.jsp

        return mav; // forward
    }
    
    // http://localhost:9091/watchbrandgrp/list.do
    /**
     * 목록
     * @return
     */
    @RequestMapping(value="/brpost/list.do", method=RequestMethod.GET )
    public ModelAndView list() {
      ModelAndView mav = new ModelAndView();
      
   // 등록 순서별 출력    
     List<BrpostVO> list = this.brpostProc.list_post_no_asc();


      mav.addObject("list", list); // request.setAttribute("list", list);

      mav.setViewName("/brpost/list"); // /webapp/WEB-INF/views/watchbrandgrp/list.jsp
      return mav;
    }
    
 // http://localhost:9091/watchbrandgrp/read_update.do?brand_no=1
    /**
     * 조회 + 수정폼
     * @param categrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/brpost/read_update.do", method=RequestMethod.GET )
    public ModelAndView read_update(int post_no) {
      // request.setAttribute("brand_no", int brand_no) 작동 안됨.
      
      ModelAndView mav = new ModelAndView();
      
      BrpostVO brpostVO = this.brpostProc.read(post_no);
      mav.addObject("brpostVO", brpostVO);  // request 객체에 저장
      
      List<BrpostVO> list = this.brpostProc.list_post_no_asc();
      mav.addObject("list", list);  // request 객체에 저장

      mav.setViewName("/brpost/read_update"); // /WEB-INF/views/watchbrandgrp/read_update.jsp 
      return mav; // forward
    }
    // http://localhost:9091/categrp/update.do
    /**
     * 수정 처리
     * 
     * @param categrpVO
     * @return
     */
    @RequestMapping(value = "/brpost/update.do", method = RequestMethod.POST)
    public ModelAndView update(BrpostVO brpostVO) {
        // WatchbrandgrpVO watchbrandgrpVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("watchbrandgrpVO", watchbrandgrpVO); 자동 실행

        ModelAndView mav = new ModelAndView();

        int cnt = this.brpostProc.update(brpostVO);
        mav.addObject("cnt", cnt); // request에 저장

        // cnt = 0; // error test
        if (cnt == 1) {
            mav.addObject("code", "update_success"); // request에 저장, request.setAttribute("code", "delete_success")
        } else {
            mav.addObject("code", "update_fail"); // request에 저장, request.setAttribute("code", "delete_fail")
        }
        mav.setViewName("/brpost/msg"); // /WEB-INF/views/categrp/msg.jsp
        
        return mav;
      }
    
    // http://localhost:9091/watchbrandgrp/read_delete.do
    /**
     * 조회 + 삭제폼
     * @param brand_no 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/brpost/read_delete.do", method=RequestMethod.GET )
    public ModelAndView read_delete(int post_no) {
      ModelAndView mav = new ModelAndView();
      
      BrpostVO brpostVO = this.brpostProc.read(post_no); // 삭제할 자료 읽기
      mav.addObject("brpostVO", brpostVO);  // request 객체에 저장
      
      List<BrpostVO> list = this.brpostProc.list_post_no_asc();
      mav.addObject("list", list);  // request 객체에 저장

      mav.setViewName("/brpost/read_delete"); // read_delete.jsp
      return mav;
    }
    
    // http://localhost:9091/watchbrandgrp/delete.do
    /**
     * 삭제
     * @param brand_no 조회할 카테고리 번호
     * @return 삭제된 레코드 갯수
     */
    @RequestMapping(value="/brpost/delete.do", method=RequestMethod.POST )
    public ModelAndView delete(int post_no) {
      ModelAndView mav = new ModelAndView();
      
      BrpostVO brpostVO = this.brpostProc.read(post_no); // 삭제 정보
      mav.addObject("brpostVO", brpostVO);  // request 객체에 저장
      
      int cnt = this.brpostProc.delete(post_no); // 삭제 처리

      // cnt = 0; // error test
      mav.addObject("cnt", cnt);  // request 객체에 저장
      
      if (cnt == 1) {
          mav.addObject("code", "delete_success"); // request에 저장, request.setAttribute("code", "delete_success")
      } else {
          mav.addObject("code", "delete_fail"); // request에 저장, request.setAttribute("code", "delete_fail")
      }
      mav.setViewName("/brpost/msg"); // /WEB-INF/views/watchbrandgrp/msg.jsp
      
      return mav;
    }
    
}