package dev.mvc.auth_info;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.authgrp.AuthgrpProcInter;
import dev.mvc.authgrp.AuthgrpVO;


@Controller
public class Auth_infoCont {
    @Autowired
    @Qualifier("dev.mvc.authgrp.AuthgrpProc")
    private AuthgrpProcInter authgrpProc;
    
    @Autowired
    @Qualifier("dev.mvc.auth_info.Auth_infoProc")
    private Auth_infoProcInter auth_infoProc;
    
    public Auth_infoCont() {
        System.out.println("-> Auth_infoCont created.");
    }
    
    /**
     * 새로고침 방지, EL에서 param으로 접근
     * @return
     */
    @RequestMapping(value="/auth_info/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url){
      ModelAndView mav = new ModelAndView();

      mav.setViewName(url); // forward
      
      return mav; // forward
    }
    
    /**
     * 등록폼 http://localhost:9091/auth_info/create.do?authno=2
     * 
     * @return
     */
    @RequestMapping(value = "/auth_info/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/auth_info/create"); // /webapp/WEB-INF/views/auth_info/create.jsp

      return mav;
    }
    
    /**
     * 등록처리
     * http://localhost:9091/auth_info/create.do?authno=2
     * Exception: FK 전달이 안됨.
     * @return
     */
    @RequestMapping(value = "/auth_info/create.do", method = RequestMethod.POST)
    public ModelAndView create(Auth_infoVO auth_infoVO) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.auth_infoProc.create(auth_infoVO);

      mav.addObject("code", "create_success");
      mav.addObject("authno", auth_infoVO.getAuthno());
      mav.addObject("create_auth", auth_infoVO.getCreate_auth());
      mav.addObject("update_auth", auth_infoVO.getUpdate_auth());
      mav.addObject("delete_auth", auth_infoVO.getDelete_auth());
      mav.addObject("read_auth", auth_infoVO.getRead_auth());
      mav.addObject("url", "/auth_info/msg");  // /auth_info/msg -> /auth_info/msg.jsp
      
      // mav.setViewName("redirect:/auth_info/msg.do");
      // response.sendRedirect("/auth_info/msg.do");
      
      mav.setViewName("redirect:/auth_info/list_by_authno.do");
      
      return mav;
    }
    
    /**
     * 전체 목록
     * http://localhost:9091/auth_info/list_all.do 
     * @return
     */
    @RequestMapping(value="/auth_info/list_all.do", method=RequestMethod.GET )
    public ModelAndView list_all() {
      ModelAndView mav = new ModelAndView();
      
      List<Auth_infoVO> list = this.auth_infoProc.list_all();
      mav.addObject("list", list); // request.setAttribute("list", list);

      mav.setViewName("/auth_info/list_all"); // /auth_info/list_all.jsp
      return mav;
    }
    
    /**
     * 권한그룹별 상세 권한 목록
     * http://localhost:9091/auth_info/list_by_authno.do?authno=1 
     * @return
     */
    @RequestMapping(value="/auth_info/list_by_authno.do", method=RequestMethod.GET )
    public ModelAndView list_by_authno(int authno) {
      ModelAndView mav = new ModelAndView();
      
      List<Auth_infoVO> list = this.auth_infoProc.list_by_authno(authno);
      mav.addObject("list", list); // request.setAttribute("list", list);

      AuthgrpVO  authgrpVO = authgrpProc.read(authno); // 카테고리 그룹 정보
      mav.addObject("authgrpVO", authgrpVO); 
      
      mav.setViewName("/auth_info/list_by_authno"); // /auth_info/list_by_authno.jsp
      
      return mav;
    }
    
    /**
     * Authgrp + auth_info join, 연결 목록
     * http://localhost:9091/auth_info/list_all_join.do
     * @return
     */
    @RequestMapping(value="/auth_info/list_all_join.do", method=RequestMethod.GET )
    public ModelAndView list_all_join() {
      ModelAndView mav = new ModelAndView();
      
      List<Authgrp_Auth_infoVO> list = this.auth_infoProc.list_all_join();
      mav.addObject("list", list); // request.setAttribute("list", list);

      mav.setViewName("/auth_info/list_all_join"); // /WEB-INF/views/auth_info/list_all_join.jsp
      return mav;
    }
    
    /**
     * 조회 + 수정폼 http://localhost:9091/auth_info/read_update.do
     * 
     * @return
     */
    @RequestMapping(value = "/auth_info/read_update.do", method = RequestMethod.GET)
    public ModelAndView read_update(int authno) {
      // int authno = Integer.parseInt(request.getParameter("authno"));

      ModelAndView mav = new ModelAndView();
      mav.setViewName("/auth_info/read_update"); // read_update.jsp

      // 권한 상세 정보
      Auth_infoVO auth_infoVO = this.auth_infoProc.read(authno);
      mav.addObject("auth_infoVO", auth_infoVO);
      // request.setAttribute("auth_infoVO", auth_infoVO);
      
      int r_authno = auth_infoVO.getAuthno();
      
      // 카테고리 그룹 정보
      AuthgrpVO authgrpVO = this.authgrpProc.read(authno);
      mav.addObject("authgrpVO", authgrpVO);

      // 카테고리 목록
      List<Authgrp_Auth_infoVO> list = this.auth_infoProc.list_by_r_authno(r_authno);
      mav.addObject("list", list);

      return mav; // forward
    }
    
    
    
    /**
     * 수정 처리
     * 
     * @param auth_infoVO
     * @return
     */
    @RequestMapping(value = "/auth_info/update.do", method = RequestMethod.POST)
    public ModelAndView update(Auth_infoVO auth_infoVO) {
      ModelAndView mav = new ModelAndView();

      int cnt = this.auth_infoProc.update(auth_infoVO);
      
      if (cnt == 1) {
          mav.addObject("authno", auth_infoVO.getAuthno());
//          mav.setViewName("redirect:/auth_info/list_by_authno.do");
          mav.setViewName("redirect:/auth_info/list_all_join.do");
      } else {
          mav.addObject("code", "update_fail"); // request에 저장
          mav.addObject("cnt", cnt); // request에 저장
          mav.addObject("authno", auth_infoVO.getAuthno());
          mav.addObject("create_auth", auth_infoVO.getCreate_auth());
          mav.addObject("update_auth", auth_infoVO.getUpdate_auth());
          mav.addObject("delete_auth", auth_infoVO.getDelete_auth());
          mav.addObject("read_auth", auth_infoVO.getRead_auth());
          mav.addObject("url", "/auth_info/msg");  // /auth_info/msg -> /auth_info/msg.jsp로 최종 실행됨.
          
          mav.setViewName("redirect:/auth_info/msg.do"); // 새로고침 문제 해결, request 초기화
          
      }
      
      return mav;
    }    
    
    /**
     * 조회 + 삭제폼 http://localhost:9091/auth_info/read_delete.do
     * 
     * @return
     */
    @RequestMapping(value = "/auth_info/read_delete.do", method = RequestMethod.GET)
    public ModelAndView read_delete(int authno) {
      // int authno = Integer.parseInt(request.getParameter("authno"));
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/auth_info/read_delete"); // read_delete.jsp

      Auth_infoVO auth_infoVO = this.auth_infoProc.read(authno);
      mav.addObject("auth_infoVO", auth_infoVO);
      // request.setAttribute("auth_infoVO", auth_infoVO);
      int r_authno = auth_infoVO.getAuthno();
      
      AuthgrpVO authgrpVO = this.authgrpProc.read(authno);
      mav.addObject("authgrpVO", authgrpVO);
      

      List<Authgrp_Auth_infoVO> list = this.auth_infoProc.list_by_r_authno(r_authno);
      mav.addObject("list", list);

      return mav; // forward
    }
    
    /**
     * 삭제 처리
     * 
     * @param auth_infoVO
     * @return
     */
    @RequestMapping(value = "/auth_info/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(int authno) {
      ModelAndView mav = new ModelAndView();
      
      // 삭제될 레코드 정보를 삭제하기전에 읽음
      Auth_infoVO auth_infoVO = this.auth_infoProc.read(authno); 
      
      int cnt = this.auth_infoProc.delete(authno);
      
      if (cnt == 1) {
          mav.addObject("authno", auth_infoVO.getAuthno());
          mav.setViewName("redirect:/auth_info/list_by_authno.do");
      } else {
          mav.addObject("code", "delete_fail"); // request에 저장
          mav.addObject("cnt", cnt); // request에 저장
          mav.addObject("authno", auth_infoVO.getAuthno());
          mav.addObject("create_auth", auth_infoVO.getCreate_auth());
          mav.addObject("update_auth", auth_infoVO.getUpdate_auth());
          mav.addObject("delete_auth", auth_infoVO.getDelete_auth());
          mav.addObject("read_auth", auth_infoVO.getRead_auth());
          mav.addObject("url", "/auth_info/msg");  // /auth_info/msg -> /auth_info/msg.jsp로 최종 실행됨.
          
          mav.setViewName("redirect:/auth_info/msg.do"); // 새로고침 문제 해결, request 초기화
          
      }
      
      return mav;
    }
    
    /**
     * authno가 같은 모든 레코드 삭제
     * http://localhost:9091/auth_info/delete_by_authno.do
     * @param auth_infoVO
     * @return
     */
    @RequestMapping(value = "/auth_info/delete_by_authno.do", method = RequestMethod.POST)
    @ResponseBody
    public String delete_by_authno(int authno) {
      
      int cnt = 0;
      try {
        cnt = this.auth_infoProc.delete_by_authno(authno);  
      } catch (Exception e) {
        // pass  
      }
      
      JSONObject json = new JSONObject();
      json.put("cnt", cnt);
      
      return json.toString();
      
    }
    
    

}
