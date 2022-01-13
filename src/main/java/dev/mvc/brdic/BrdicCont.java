package dev.mvc.brdic;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

//import dev.mvc.member.MemberProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class BrdicCont {

    @Autowired
    @Qualifier("dev.mvc.brdic.BrdicProc")
    private BrdicProcInter brdicProc;
    
    /** 업로드 파일 절대 경로 */
    private String uploadDir = Brdic.getUploadDir();

    public BrdicCont() {
        System.out.println("-> BrdicCont created.");
    }

    /**
     * 새로고침 방지
     * 
     * @return
     */
    @RequestMapping(value = "/brdic/msg.do", method = RequestMethod.GET)
    public ModelAndView msg(String url) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName(url); // forward

        return mav; // forward
    }

    /**
     * 등록폼 사전 준비된 레코드: 관리자 1번, cateno 1번, categrpno 1번을 사용하는 경우 테스트 URL
     * http://localhost:9091/dics/create.do?cateno=1
     * 
     * @return
     */
    @RequestMapping(value = "/brdic/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("/brdic/create"); // /webapp/WEB-INF/views/dics/create.jsp
        // String dic = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
        // mav.addObject("dic", dic);

        return mav; // forward
    }

    /**
     * 등록 처리 http://localhost:9091/dics/create.do
     * 
     * @return
     */
    @RequestMapping(value = "/brdic/create.do", method = RequestMethod.POST)
    public ModelAndView create(HttpServletRequest request, BrdicVO brdicVO) {
        ModelAndView mav = new ModelAndView();

        // ------------------------------------------------------------------------------
        // 파일 전송 코드 시작
        // ------------------------------------------------------------------------------
        String file1 = ""; // 원본 파일명 image
        String file1saved = ""; // 저장된 파일명, image
        String thumb1 = ""; // preview image
        String uploadDir = this.uploadDir; // 파일 업로드 경로
        
        // 전송 파일이 없어도 file1MF 객체가 생성됨.
        // <input type='file' class="form-control" name='file1MF' id='file1MF'
        // value='' placeholder="파일 선택">
        MultipartFile mf = brdicVO.getFile1MF();

        file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
        // System.out.println("-> file1: " + file1);

        long size1 = mf.getSize(); // 파일 크기

        if (size1 > 0) { // 파일 크기 체크
            // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
            file1saved = Upload.saveFileSpring(mf, uploadDir);

            if (Tool.isImage(file1saved)) { // 이미지인지 검사
                // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
                thumb1 = Tool.preview(uploadDir, file1saved, 200, 150);
            }

        }

        brdicVO.setFile1(file1);
        brdicVO.setFile1saved(file1saved);
        brdicVO.setThumb1(thumb1);
        brdicVO.setSize1(size1);
        // ------------------------------------------------------------------------------
        // 파일 전송 코드 종료
        // ------------------------------------------------------------------------------

        // Call By Reference: 메모리 공유, Hashcode 전달
        int cnt = this.brdicProc.create(brdicVO);

        // ------------------------------------------------------------------------------
        // 연속 입력을위한 PK의 return
        // ------------------------------------------------------------------------------
        System.out.println("-> dic_no: " + brdicVO.getDic_no());
        mav.addObject("dic_no", brdicVO.getDic_no()); // redirect parameter 적용
        // ------------------------------------------------------------------------------

        if (cnt == 1) {
            mav.addObject("code", "create_success");
            // cateProc.increaseCnt(dicsVO.getCateno()); // 글수 증가
        } else {
            mav.addObject("code", "create_fail");
        }
        mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

        // System.out.println("--> cateno: " + dicsVO.getCateno());
        // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장

        // mav.addObject("url", "/dics/msg"); // msg.jsp, redirect parameter 적용

        // 추가적인 상품 정보 입력 유도
        mav.addObject("url", "/brdic/msg"); // msg.jsp, redirect parameter 적용

        mav.setViewName("redirect:/brdic/msg.do");

        return mav; // forward
    }
      
    /**
     * 카테고리별 목록 http://localhost:9091/dics/list_by_cateno.do?cateno=1
     * 
     * @return
     */
    @RequestMapping(value = "/brdic/list_by_dic_no.do", method = RequestMethod.GET)
    public ModelAndView list_by_dic_no() {
        ModelAndView mav = new ModelAndView();

  
        
        List<BrdicVO> list = this.brdicProc.list_dic_no_asc();
        // 테이블 이미지 기반, /webapp/dics/list_by_cateno.jsp
        
        mav.addObject("list", list);
        
        mav.setViewName("/brdic/list_by_dic_no");
        return mav; // forward
    }
        
 // http://localhost:9091/dics/read.do
    /**
     * 조회
     * @return
     */
    @RequestMapping(value="/brdic/read.do", method=RequestMethod.GET )
    public ModelAndView read(int dic_no) {
      ModelAndView mav = new ModelAndView();

      BrdicVO brdicVO = this.brdicProc.read(dic_no);
      mav.addObject("brdicVO", brdicVO); // request.setAttribute("dicsVO", dicsVO);
      
      mav.setViewName("/brdic/read"); // /WEB-INF/views/dics/read.jsp
          
      return mav;
    }
          
    /**
     * 목록 + 검색 지원
     * http://localhost:9090/dics/list_by_cateno_search.do?cateno=1&word=스위스
     * @param cateno
     * @param word
     * @return
     */
      @RequestMapping(value = "/brdic/list_by_dic_no_search.do", method = RequestMethod.GET)
      public ModelAndView list_by_dic_no_search(@RequestParam(value="dic_word", defaultValue="") String dic_word ) {
      
      ModelAndView mav = new ModelAndView(); 
           
      // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용 
      HashMap<String, Object> map = new HashMap<String, Object>(); 
      map.put("dic_word", dic_word); // #{word}
      
      // 검색 목록 
      List<BrdicVO> list = brdicProc.list_by_dic_no_search(map);
      mav.addObject("list", list);
      
      // 검색된 레코드 갯수 
      int search_count = brdicProc.search_count(map);
      mav.addObject("search_count", search_count);
      
      mav.setViewName("/brdic/list_by_dic_no_search");   // /dics/list_by_cateno_search.jsp
      
      return mav; 
    }
      /**
       * 목록 + 검색 + 페이징 지원
       * http://localhost:9090/dics/list_by_cateno_search_paging.do?cateno=1&word=스위스&now_page=1
       * 
       * @param cateno
       * @param word
       * @param now_page
       * @return
       */
      @RequestMapping(value = "/brdic/list_by_dic_no_search_paging.do", method = RequestMethod.GET)
      public ModelAndView list_by_dic_no_search_paging(@RequestParam(value = "dic_word", defaultValue = "") String dic_word,
                                                                             @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
        System.out.println("--> now_page: " + now_page);

        ModelAndView mav = new ModelAndView();

        // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("dic_word", dic_word); // #{word}
        map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

        // 검색 목록
        List<BrdicVO> list = brdicProc.list_by_dic_no_search_paging(map);
        mav.addObject("list", list);

        // 검색된 레코드 갯수
        int search_count = brdicProc.search_count(map);
        mav.addObject("search_count", search_count);

        /*
         * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
         * 18 19 20 [다음]
         * @param cateno 카테고리번호
         * @param search_count 검색(전체) 레코드수
         * @param now_page 현재 페이지
         * @param word 검색어
         * @return 페이징 생성 문자열
         */
        String paging = brdicProc.pagingBox(search_count, now_page, dic_word);
        mav.addObject("paging", paging);

        mav.addObject("now_page", now_page);

        // /dics/list_by_cateno_table_img1_search_paging.jsp
        mav.setViewName("/brdic/list_by_dic_no_search_paging");

        return mav;
      }
      
      /**
       * Grid 형태의 화면 구성 http://localhost:9091/dics/list_by_cateno_grid.do
       * 
       * @return
       */
      @RequestMapping(value = "/brdic/list_by_dic_no_grid.do", method = RequestMethod.GET)
      public ModelAndView list_by_dic_no_grid() {
        ModelAndView mav = new ModelAndView();
        
        List<BrdicVO> list = this.brdicProc.list_dic_no_asc();
        mav.addObject("list", list);

        // 테이블 이미지 기반, /webapp/dics/list_by_cateno_grid.jsp
        mav.setViewName("/brdic/list_by_dic_no_grid");

        return mav; // forward
      }

      /**
       * 수정 폼
       * http://localhost:9091/dics/update_text.do?dicsno=1
       * 
       * @return
       */
      @RequestMapping(value = "/brdic/update_text.do", method = RequestMethod.GET)
      public ModelAndView update_text(int dic_no) {
        ModelAndView mav = new ModelAndView();
        
        BrdicVO brdicVO = this.brdicProc.read_update_text(dic_no);
        
        mav.addObject("brdicVO", brdicVO);
        
        mav.setViewName("/brdic/update_text"); // /WEB-INF/views/dics/update_text.jsp
        // String dic = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
        // mav.addObject("dic", dic);

        return mav; // forward
      }

      /**
       * 수정 처리
       * http://localhost:9091/dics/update_text.do?dicsno=1
       * 
       * @return
       */
      @RequestMapping(value = "/brdic/update_text.do", method = RequestMethod.POST)
      public ModelAndView update_text(BrdicVO brdicVO) {
        ModelAndView mav = new ModelAndView();
        
        int cnt = this.brdicProc.update_text(brdicVO); // 수정 처리
        
        mav.addObject("dic_no", brdicVO.getDic_no());
        
        mav.addObject("cnt", cnt);  // request 객체에 저장
        
        if (cnt == 1) {
            mav.addObject("code", "update_text_success"); // request에 저장, request.setAttribute("code", "delete_success")
        } else {
            mav.addObject("code", "update_text_fail"); // request에 저장, request.setAttribute("code", "delete_fail")
        }
        mav.setViewName("redirect:/brdic/msg.do"); 
        // mav.setViewName("redirect:/brdic/read.do");  
        
        return mav; // forward
      }
      
      /**
       * 파일 수정 폼
       * http://localhost:9091/dics/update_file.do?dicsno=1
       * 
       * @return
       */
      @RequestMapping(value = "/brdic/update_file.do", method = RequestMethod.GET)
      public ModelAndView update_file(int dic_no) {
        ModelAndView mav = new ModelAndView();
        
        BrdicVO brdicVO = this.brdicProc.read(dic_no);
        
        mav.addObject("brdicVO", brdicVO);
        
        mav.setViewName("/brdic/update_file"); // /WEB-INF/views/dics/update_file.jsp

        return mav; // forward
      }

      /**
       * 파일 수정 처리 http://localhost:9091/dics/update_file.do
       * 
       * @return
       */
      @RequestMapping(value = "/brdic/update_file.do", method = RequestMethod.POST)
      public ModelAndView update_file(HttpServletRequest request, BrdicVO brdicVO) {
        ModelAndView mav = new ModelAndView();
        
        // 삭제할 파일 정보를 읽어옴, 기존에 등록된 레코드 저장용
        BrdicVO brdicVO_old = brdicProc.read(brdicVO.getDic_no());
        
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("dic_no", brdicVO.getDic_no());
        map.put("passwd", brdicVO.getPasswd());
        
        int cnt = 0;
        int passwd_cnt = this.brdicProc.passwd_check(map);
        if (passwd_cnt == 1) { // 패스워드 일치 -> 등록된 파일 삭제 -> 신규 파일 등록
            // -------------------------------------------------------------------
            // 파일 삭제 코드 시작
            // -------------------------------------------------------------------
//            System.out.println("dicsno: " + vo.getdicsno());
//            System.out.println("file1: " + vo.getFile1());
            
            String file1saved = brdicVO_old.getFile1saved();
            String thumb1 = brdicVO_old.getThumb1();
            long size1 = 0;
            boolean sw = false;
            
            // 완성된 경로 F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/dics/storage/
            String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/brdic/storage/"; // 절대 경로

            sw = Tool.deleteFile(upDir, file1saved);  // Folder에서 1건의 파일 삭제
            sw = Tool.deleteFile(upDir, thumb1);     // Folder에서 1건의 파일 삭제
            // System.out.println("sw: " + sw);
            // -------------------------------------------------------------------
            // 파일 삭제 종료 시작
            // -------------------------------------------------------------------
            
            // -------------------------------------------------------------------
            // 파일 전송 코드 시작
            // -------------------------------------------------------------------
            String file1 = "";          // 원본 파일명 image

            // 완성된 경로 F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/dics/storage/
            // String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/dics/storage/"; // 절대 경로
            
            // 전송 파일이 없어도 fnamesMF 객체가 생성됨.
            // <input type='file' class="form-control" name='file1MF' id='file1MF' 
            //           value='' placeholder="파일 선택">
            MultipartFile mf = brdicVO.getFile1MF();
            
            file1 = mf.getOriginalFilename(); // 원본 파일명
            size1 = mf.getSize();  // 파일 크기
            
            if (size1 > 0) { // 파일 크기 체크
              // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
              file1saved = Upload.saveFileSpring(mf, upDir); 
              
              if (Tool.isImage(file1saved)) { // 이미지인지 검사
                // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
                thumb1 = Tool.preview(upDir, file1saved, 250, 200); 
              }
              
            } else { // 파일이 삭제만 되고 새로 올리지 않는 경우
                file1="";
                file1saved="";
                thumb1="";
                size1=0;
            }
            
            brdicVO.setFile1(file1);
            brdicVO.setFile1saved(file1saved);
            brdicVO.setThumb1(thumb1);
            brdicVO.setSize1(size1);
            // -------------------------------------------------------------------
            // 파일 전송 코드 종료
            // -------------------------------------------------------------------
            
            // Call By Reference: 메모리 공유, Hashcode 전달
            cnt = this.brdicProc.update_file(brdicVO);
            System.out.println("-> cnt: " + cnt);
            
            mav.addObject("dic_no", brdicVO.getDic_no());
            
            mav.addObject("cnt", cnt);  // request 객체에 저장
            if (cnt == 1) {
                mav.addObject("code", "update_file_success"); // request에 저장, request.setAttribute("code", "delete_success")
            } else {
                mav.addObject("code", "update_file_fail"); // request에 저장, request.setAttribute("code", "delete_fail")
            }
            mav.setViewName("redirect:/brdic/msg.do"); 
            
            //mav.setViewName("redirect:/brdic/read.do"); 
            
        } else { // 패스워드 오류
            mav.addObject("cnt", cnt);
            mav.addObject("code", "passwd_fail");
            mav.setViewName("redirect:/brdic/msg.do");
        }
        
        return mav; // forward
      } 
      
      /**
       * 삭제 폼
       * @param dicsno
       * @return
       */
      @RequestMapping(value="/brdic/delete.do", method=RequestMethod.GET )
      public ModelAndView delete(int dic_no) { 
        ModelAndView mav = new  ModelAndView();
        
        // 삭제할 정보를 조회하여 확인
        BrdicVO brdicVO = this.brdicProc.read(dic_no);
        
        mav.addObject("brdicVO", brdicVO);
        
        mav.setViewName("/brdic/delete");  // dics/delete.jsp
        
        return mav; 
      }

      /**
       * 삭제 처리 http://localhost:9091/dics/delete.do
       * 
       * @return
       */
      @RequestMapping(value = "/brdic/delete.do", method = RequestMethod.POST)
      public ModelAndView delete(HttpServletRequest request, BrdicVO brdicVO, 
                                              int now_page,
                                              @RequestParam(value="dic_word", defaultValue="") String dic_word) {
        ModelAndView mav = new ModelAndView();
        int dic_no = brdicVO.getDic_no();
        
        HashMap<String, Object> passwd_map = new HashMap<String, Object>();
        passwd_map.put("dic_no", brdicVO.getDic_no());
        passwd_map.put("passwd", brdicVO.getPasswd());
        
        int cnt = 0;
        int passwd_cnt = this.brdicProc.passwd_check(passwd_map);
        if (passwd_cnt == 1) { // 패스워드 일치 -> 등록된 파일 삭제 -> 신규 파일 등록
            // -------------------------------------------------------------------
            // 파일 삭제 코드 시작
            // -------------------------------------------------------------------
            // 삭제할 파일 정보를 읽어옴.
            BrdicVO vo = brdicProc.read(dic_no);
//            System.out.println("dicsno: " + vo.getdicsno());
//            System.out.println("file1: " + vo.getFile1());
            
            String file1saved = vo.getFile1saved();
            String thumb1 = vo.getThumb1();
            long size1 = 0;
            boolean sw = false;
            
            // 완성된 경로 F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/dics/storage/
            String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/brdic/storage/"; // 절대 경로

            sw = Tool.deleteFile(upDir, file1saved);  // Folder에서 1건의 파일 삭제
            sw = Tool.deleteFile(upDir, thumb1);     // Folder에서 1건의 파일 삭제
            // System.out.println("sw: " + sw);
            // -------------------------------------------------------------------
            // 파일 삭제 종료 시작
            // -------------------------------------------------------------------
            
            cnt = this.brdicProc.delete(dic_no); // DBMS 삭제
            
            // -------------------------------------------------------------------------------------
            System.out.println("-> dic_word: " + dic_word);
            
            // 마지막 페이지의 레코드 삭제시의 페이지 번호 -1 처리
            HashMap<String, Object> page_map = new HashMap<String, Object>();
            page_map.put("dic_word", dic_word);
            // 10번째 레코드를 삭제후
            // 하나의 페이지가 3개의 레코드로 구성되는 경우 현재 9개의 레코드가 남아 있으면
            // 페이지수를 4 -> 3으로 감소 시켜야함.
            if (brdicProc.search_count(page_map) % Brdic.RECORD_PER_PAGE == 0) {
              now_page = now_page - 1;
              if (now_page < 1) {
                now_page = 1; // 시작 페이지
              }
            }
            // -------------------------------------------------------------------------------------
            
            mav.addObject("now_page", now_page);
            mav.addObject("cnt", cnt);  // request 객체에 저장
            
          if (cnt == 1) {
             mav.addObject("code", "delete_success"); // request에 저장, request.setAttribute("code", "delete_success")
            } else {
               mav.addObject("code", "delete_fail"); // request에 저장, request.setAttribute("code", "delete_fail")
          }
           mav.setViewName("redirect:/brdic/msg.do"); 
            
          // mav.setViewName("redirect:/brdic/list_by_dic_no_search_paging.do"); 

        } else { // 패스워드 오류
            mav.addObject("cnt", cnt);
            mav.addObject("code", "passwd_fail");
            mav.setViewName("redirect:/brdic/msg.do");
        }
        
        return mav; // forward
      }
      

      /**
       * 추천수 Ajax 수정 처리
       * http://localhost:9091/dics/update_recom_ajax.do?dicsno=30
       * 
       * @return
       */
      @RequestMapping(value = "/brdic/update_recom_ajax.do", method = RequestMethod.POST)
      @ResponseBody
      public String update_recom_ajax(int dic_no) {
        try {
          Thread.sleep(3000);
        } catch (InterruptedException e) {
          e.printStackTrace();
        }

        int cnt = this.brdicProc.update_recom(dic_no); // 추천수 증가
        int recom = this.brdicProc.read(dic_no).getRecom(); // 새로운 추천수 읽음
            
        JSONObject json = new JSONObject();
        json.put("cnt", cnt);
        json.put("recom", recom);
        
        return json.toString();
      }
}



