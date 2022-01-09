package dev.mvc.authgrp;

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
            // System.out.println("등록 성공");
            
            // mav.addObject("code", "create_success"); // request에 저장, request.setAttribute("code", "create_success")
            // mav.setViewName("/authgrp/msg"); // /WEB-INF/views/authgrp/msg.jsp
            
            // response.sendRedirect("/authgrp/list.do");
            mav.setViewName("redirect:/authgrp/list.do");
        } else {
            mav.addObject("code", "create_fail"); // request에 저장, request.setAttribute("code", "create_fail")
            mav.setViewName("/authgrp/msg"); // /WEB-INF/views/authgrp/msg.jsp
        }

        return mav; // forward
    }
    
}
