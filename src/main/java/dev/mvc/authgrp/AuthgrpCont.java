package dev.mvc.authgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthgrpCont {
    @Autowired
    @Qualifier("dev.mvc.authgrp.AuthgrpProc")
    private AuthgrpProcInter authgrpProc;
    
    public AuthgrpCont() {
        System.out.println("-> AuthgrpCont created.");
    }
    
    // http://localhost:9091/authgrp/create.do
    /**
     * 등록 폼
     * 
     * @return
     */
    @RequestMapping(value = "/authgrp/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/authgrp/create"); // webapp/WEB-INF/views/authgrp/create.jsp

        return mav; // forward
    }
    
    // http://localhost:9091/authgrp/create.do
    /**
     * 등록 처리
     * 
     * @param authgrpVO
     * @return
     */
    @RequestMapping(value = "/authgrp/create.do", method = RequestMethod.POST)
    public ModelAndView create(AuthgrpVO authgrpVO) { // authgrpVO 자동 생성, Form -> VO
        // AuthgrpVO authgrpVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("authgrpVO", authgrpVO); 자동 실행

        ModelAndView mav = new ModelAndView();

        int cnt = this.authgrpProc.create(authgrpVO); // 등록 처리
        // cnt = 0; // error test
        
        mav.addObject("cnt", cnt);
       
        if (cnt == 1) {
            System.out.println("등록 성공");
            
            mav.addObject("code", "create_success"); // request에 저장, request.setAttribute("code", "create_success")
            mav.setViewName("/authgrp/msg"); // /WEB-INF/views/authgrp/msg.jsp
            
            // response.sendRedirect("/authgrp/list.do");
            mav.setViewName("redirect:/authgrp/list.do");
        } else {
            mav.addObject("code", "create_fail"); // request에 저장, request.setAttribute("code", "create_fail")
            mav.setViewName("/authgrp/msg"); // /WEB-INF/views/authgrp/msg.jsp
        }

        return mav; // forward
    }
    
        
    // http://localhost:9091/authgrp/list.do  
    @RequestMapping(value = "/authgrp/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
      
        List<AuthgrpVO> list = this.authgrpProc.list_authno_asc();
      
        mav.addObject("list", list); // request.setAttribute("list", list);
      
        mav.setViewName("/authgrp/list"); // /webapp/WEB-INF/views/authgrp/list.jsp
        return mav;
    } 

    /**
     * 조회 + 수정폼
     * 
     * @param authno 조회할 권한그룹번호
     * @return
     */
    @RequestMapping(value = "/authgrp/read_update.do", method = RequestMethod.GET)
    public ModelAndView read_update(int authno) {
        // request.setAttribute("authno", int authno) 작동 안됨.

        ModelAndView mav = new ModelAndView();

        AuthgrpVO authgrpVO = this.authgrpProc.read(authno);
        mav.addObject("authgrpVO", authgrpVO); // request 객체에 저장

        List<AuthgrpVO> list = this.authgrpProc.list_authno_asc();
        mav.addObject("list", list); // request 객체에 저장

        mav.setViewName("/authgrp/read_update"); // /WEB-INF/views/authgrp/read_update.jsp
        return mav; // forward
    }
    
    // http://localhost:9091/authgrp/update.do
    /**
     * 수정 처리
     * 
     * @param authgrpVO
     * @return
     */
    @RequestMapping(value = "/authgrp/update.do", method = RequestMethod.POST)
    public ModelAndView update(AuthgrpVO authgrpVO) {
        // AuthgrpVO authgrpVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("authgrpVO", authgrpVO); 자동 실행

        ModelAndView mav = new ModelAndView();

        int cnt = this.authgrpProc.update(authgrpVO);
        mav.addObject("cnt", cnt); // request에 저장

        // cnt = 0; // error test
        if (cnt == 1) {
            // System.out.println("수정 성공");
            // response.sendRedirect("/authgrp/list.do");
            mav.setViewName("redirect:/authgrp/list.do");
        } else {
            mav.addObject("code", "update"); // request에 저장, request.setAttribute("code", "update")
            mav.setViewName("/authgrp/msg"); // /WEB-INF/views/authgrp/msg.jsp
        }

        return mav;
    }
    
    // http://localhost:9091/authgrp/read_delete.do?authno=1
    /**
     * 조회 + 삭제폼
     * 
     * @param authno 조회할 권한그룹번호
     * @return
     */
    @RequestMapping(value = "/authgrp/read_delete.do", method = RequestMethod.GET)
    public ModelAndView read_delete(int authno) {
        ModelAndView mav = new ModelAndView();

        AuthgrpVO authgrpVO = this.authgrpProc.read(authno); // 삭제할 자료 읽기
        mav.addObject("authgrpVO", authgrpVO); // request 객체에 저장

        List<AuthgrpVO> list = this.authgrpProc.list_authno_asc();
        mav.addObject("list", list); // request 객체에 저장

        mav.setViewName("/authgrp/read_delete"); // read_delete.jsp
        return mav;
    }
    
    // http://localhost:9091/authgrp/delete.do
    /**
     * 삭제
     * @param authno 조회할 권한그룹번호
     * @return 삭제된 레코드 갯수
     */
    @RequestMapping(value="/authgrp/delete.do", method=RequestMethod.POST )
    public ModelAndView delete(int authno) {
      ModelAndView mav = new ModelAndView();
      
      AuthgrpVO authgrpVO = this.authgrpProc.read(authno); // 삭제 정보
      mav.addObject("authgrpVO", authgrpVO);  // request 객체에 저장
      int cnt = 0;
      
      try {
        cnt = this.authgrpProc.delete(authno); // 삭제 처리  
      } catch (Exception e) {
        mav.addObject("msg", "child_record_found");
      }
      
      // cnt = 0; // error test
      mav.addObject("cnt", cnt);  // request 객체에 저장
      
      if (cnt == 1) {
          mav.addObject("code", "delete_success"); // request에 저장, request.setAttribute("code", "delete_success")
      } else if (cnt == 0){
          mav.addObject("code", "delete_fail"); // request에 저장, request.setAttribute("code", "delete_fail")
      }
      mav.setViewName("/authgrp/msg"); // /WEB-INF/views/authgrp/msg.jsp
      
      return mav;
    }
    
}






