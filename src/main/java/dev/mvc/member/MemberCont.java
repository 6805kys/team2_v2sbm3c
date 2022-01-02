package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberCont {
    @Autowired
    @Qualifier("dev.mvc.member.MemberProc")
    private MemberProcInter memberProc = null;
    
    public MemberCont(){
        System.out.println("-> MemberCont created.");
      }
    
    // http://localhost:9091/member/create.do
    /**
    * 등록 폼
    * @return
    */
    @RequestMapping(value="/member/create.do", method=RequestMethod.GET )
    public ModelAndView create() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/member/create"); // webapp/member/create.jsp
     
      return mav; // forward
    }
    
    // http://localhost:9091/member/checkID.do?id=user1
    /**
    * ID 중복 체크, JSON 출력
    * @return
    */
    @ResponseBody
    @RequestMapping(value="/member/checkID.do", method=RequestMethod.GET ,
                           produces = "text/plain;charset=UTF-8" )
    public String checkID(String id) {
      int cnt = this.memberProc.checkID(id);
     
      JSONObject json = new JSONObject();
      json.put("cnt", cnt);
     
      return json.toString(); 
    }
    
    // http://localhost:9091/member/checkNICKNAME.do?nickname=회원1
    /**
    * NICKNAME 중복 체크, JSON 출력
    * @return
    */
    @ResponseBody
    @RequestMapping(value="/member/checkNICKNAME.do", method=RequestMethod.GET ,
                           produces = "text/plain;charset=UTF-8" )
    public String checkNICKNAME(String nickname) {
      int cnt = this.memberProc.checkNICKNAME(nickname);
     
      JSONObject json = new JSONObject();
      json.put("cnt", cnt);
     
      return json.toString(); 
    }
    
    /**
     * 등록 처리
     * @param memberVO
     * @return
     */
    @RequestMapping(value="/member/create.do", method=RequestMethod.POST)
    public ModelAndView create(MemberVO memberVO){
      ModelAndView mav = new ModelAndView();
      
      System.out.println("id: " + memberVO.getId());
      
      memberVO.setGradeno(10); // 기본 회원 가입 등록 10(씨앗) 지정
      memberVO.setTel("000-0000-0000"); // 기본 값 지정->정보 등록 시 등급 상승
      memberVO.setEmail("Insert@Email.address"); // 기본 값 지정->정보 등록 시 등급 상승     
      
      int cnt= memberProc.create(memberVO);
      
      if (cnt == 1) {
        mav.addObject("code", "create_success");
        mav.addObject("Nickname", memberVO.getNickname());  // 홍길동님(user4) 회원 가입을 축하합니다.
        mav.addObject("id", memberVO.getId());
      } else {
        mav.addObject("code", "create_fail");
      }
      
      mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
      mav.addObject("url", "/member/msg");  // /member/msg -> /member/msg.jsp
      
      mav.setViewName("redirect:/member/msg.do");


      
      return mav;
    }
    
    /**
     * 새로고침 방지, EL에서 param으로 접근
     * @return
     */
    @RequestMapping(value="/member/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url){
      ModelAndView mav = new ModelAndView();

      mav.setViewName(url); // forward
      
      return mav; // forward
    }
    
    /**
     * 목록 출력
     * @param session
     * @return
     */
     @RequestMapping(value="/member/list.do", method=RequestMethod.GET)
     public ModelAndView list() {
       ModelAndView mav = new ModelAndView();
       
       List<MemberVO> list = memberProc.list();
       mav.addObject("list", list);

       mav.setViewName("/member/list"); // /webapp/WEB-INF/views/member/list.jsp
       
       return mav;
     }
     
     /**
      * 회원 조회
      * @param memberno
      * @return
      */
     @RequestMapping(value="/member/read.do", method=RequestMethod.GET)
     public ModelAndView read(int memberno){
       ModelAndView mav = new ModelAndView();
       
       MemberVO memberVO = this.memberProc.read(memberno);
       mav.addObject("memberVO", memberVO);
       mav.setViewName("/member/read"); // /member/read.jsp
       
       return mav; // forward
     }
     
     /**
      * 회원 정보 수정 처리
      * @param memberVO
      * @return
      */
     @RequestMapping(value="/member/update.do", method=RequestMethod.POST)
     public ModelAndView update(MemberVO memberVO){
       ModelAndView mav = new ModelAndView();
       
       // System.out.println("id: " + memberVO.getId());
       
       int cnt= memberProc.update(memberVO);
       
       if (cnt == 1) {
         mav.addObject("code", "update_success");
         mav.addObject("nickname", memberVO.getNickname());  // 회원4님(user4) 회원 정보를 변경했습니다.
         mav.addObject("id", memberVO.getId());
       } else {
         mav.addObject("code", "update_fail");
       }

       mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
       mav.addObject("url", "/member/msg");  // /member/msg -> /member/msg.jsp
       
       mav.setViewName("redirect:/member/msg.do");
       
       return mav;
     }
     
     /**
      * 회원 삭제
      * @param memberno
      * @return
      */
     @RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
     public ModelAndView delete(int memberno){
       ModelAndView mav = new ModelAndView();
       
       MemberVO memberVO = this.memberProc.read(memberno);
       mav.addObject("memberVO", memberVO);
       mav.setViewName("/member/delete"); // /member/delete.jsp
       
       return mav; // forward
     }
    
     /**
      * 회원 삭제 처리
      * @param memberVO
      * @return
      */
     @RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
     public ModelAndView delete_proc(int memberno){
       ModelAndView mav = new ModelAndView();
       
       // System.out.println("id: " + memberVO.getId());
       MemberVO memberVO = this.memberProc.read(memberno);
       
       
       int cnt= memberProc.delete(memberno);

       if (cnt == 1) {
         mav.addObject("code", "delete_success");
         mav.addObject("nickname", memberVO.getNickname());  // 회원4()님 회원정보삭제에 성공했습니다
         mav.addObject("id", memberVO.getId());
       } else {
         mav.addObject("code", "delete_fail");
       }

       mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
       mav.addObject("url", "/member/msg");  // /member/msg -> /member/msg.jsp
       
       mav.setViewName("redirect:/member/msg.do");
       
       return mav;
     }
          
       /**
        * 패스워드를 변경합니다.
        * @param memberno
        * @return
        */
       @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.GET)
       public ModelAndView passwd_update(int memberno){
         ModelAndView mav = new ModelAndView();
         mav.setViewName("/member/passwd_update"); // passwd_update.jsp
         
         return mav;
       }
       
       /**
        * 패스워드 변경 처리
        * @param memberno 회원 번호
        * @param current_passwd 현재 패스워드
        * @param new_passwd 새로운 패스워드
        * http://localhost:9091/member/passwd_update.do?memberno=6
        * @return
        */
       @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.POST)
       public ModelAndView passwd_update(int memberno, String current_passwd, String new_passwd){
         ModelAndView mav = new ModelAndView();
         
         MemberVO memberVO = this.memberProc.read(memberno);
         mav.addObject("nickname", memberVO.getNickname());  // 회원4님(user4) 패스워드를 변경했습니다.
         mav.addObject("id", memberVO.getId());
         
         // 현재 패스워드 검사
         HashMap<Object, Object> map = new HashMap<Object, Object>();
         map.put("memberno", memberno);
         map.put("passwd", current_passwd);
         
         int cnt = memberProc.passwd_check(map);
         int update_cnt = 0; // 변경된 패스워드 수
         
         if (cnt == 1) { // 현재 패스워드가 일치하는 경우
           map.put("passwd", new_passwd); // 새로운 패스워드를 저장
           update_cnt = memberProc.passwd_update(map); // 패스워드 변경 처리
           
           if (update_cnt == 1) {
             mav.addObject("code", "passwd_update_success"); // 패스워드 변경 성공
           } else {
             cnt = 0;  // 패스워드는 일치했으나 변경하지는 못함.
             mav.addObject("code", "passwd_update_fail");       // 패스워드 변경 실패
           }
           
           mav.addObject("update_cnt", update_cnt);  // 변경된 패스워드의 갯수    
         } else {
           mav.addObject("code", "passwd_fail"); // 패스워드가 일치하지 않는 경우
         }

         mav.addObject("cnt", cnt); // 패스워드 일치 여부
         mav.addObject("url", "/member/msg");  // /member/msg -> /member/msg.jsp
         
         mav.setViewName("redirect:/member/msg.do");
         
         return mav;
       }
       
       /**
        * 로그인 폼
        * @return
        */
       // http://localhost:9091/member/login.do 
       @RequestMapping(value = "/member/login.do", 
                                  method = RequestMethod.GET)
       public ModelAndView login() {
         ModelAndView mav = new ModelAndView();
       
         mav.setViewName("/member/login_form");
         return mav;
       }

       /**
        * 로그인 처리
        * @return
        */
       // http://localhost:9091/member/login.do 
       @RequestMapping(value = "/member/login.do", 
                                  method = RequestMethod.POST)
       public ModelAndView login_proc(HttpSession session,
                                                        String id, 
                                                        String passwd) {
         ModelAndView mav = new ModelAndView();
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("id", id);
         map.put("passwd", passwd);
         
         int count = memberProc.login(map); // id, passwd 일치 여부 확인
         if (count == 1) { // 로그인 성공
           // System.out.println(id + " 로그인 성공");
           MemberVO memberVO = memberProc.readById(id); // 로그인한 회원의 정보 조회
           session.setAttribute("memberno", memberVO.getMemberno());
           session.setAttribute("id", id);
           session.setAttribute("nickname", memberVO.getNickname());
           
           mav.setViewName("redirect:/index.do"); // 시작 페이지로 이동  
         } else {
           mav.addObject("url", "/member/login_fail_msg"); // login_fail_msg.jsp, redirect parameter 적용
          
           mav.setViewName("redirect:/member/msg.do"); // 새로고침 방지
         }
             
         return mav;
       }
       
       /**
        * 로그아웃 처리
        * @param session
        * @return
        */
       @RequestMapping(value="/member/logout.do", 
                                  method=RequestMethod.GET)
       public ModelAndView logout(HttpSession session){
         ModelAndView mav = new ModelAndView();
         session.invalidate(); // 모든 session 변수 삭제
         
         mav.addObject("url", "/member/logout_msg"); // logout_msg.jsp, redirect parameter 적용
         
         mav.setViewName("redirect:/member/msg.do"); // 새로고침 방지
         
         return mav;
       }
    
    

}
