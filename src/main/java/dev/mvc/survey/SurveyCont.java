package dev.mvc.survey;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SurveyCont {
    @Autowired
    @Qualifier("dev.mvc.survey.SurveyProc")
    private SurveyProcInter surveyProc;

    public SurveyCont() {
        System.out.println("-> SurveyCont created.");
    }

    /**
     * 등록 폼 create
     * 
     * @return
     */
    @RequestMapping(value = "/survey/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/survey/create"); // webapp/WEB-INF/views/survey/create.jsp

        return mav; // forward
    }

    /**
     * 등록 처리
     * 
     * @param surveyVO
     * @return
     */
    @RequestMapping(value = "/survey/create.do", method = RequestMethod.POST)
    public ModelAndView create(SurveyVO surveyVO) { 
        
        ModelAndView mav = new ModelAndView();

        
        this.surveyProc.create(surveyVO); // 등록 처리
//        if (cnt == 1) {
//            mav.addObject("code", "create_success");
//        }else {
//            mav.addObject("code", "create_fail");
//        } 
        mav.setViewName("/survey/create2");

        return mav; // forward
        }


    /**
     * 등록 폼 create2
     * 
     * @return
     */
    @RequestMapping(value = "/survey/create2.do", method = RequestMethod.GET)
    public ModelAndView create2() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/survey/create2");

        return mav; // forward
    }

    /**
     * 등록 처리
     * 
     * @param surveyVO
     * @return
     */
    @RequestMapping(value = "/survey/create2.do", method = RequestMethod.POST)
    public ModelAndView create2(SurveyVO surveyVO) { 
        
        ModelAndView mav = new ModelAndView();

        
        this.surveyProc.create(surveyVO); // 등록 처리
        mav.setViewName("/survey/create3");

        return mav; // forward
        }

    /**
     * 등록 폼 create3
     * 
     * @return
     */
    @RequestMapping(value = "/survey/create3.do", method = RequestMethod.GET)
    public ModelAndView create3() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/survey/create3");

        return mav; // forward
    }

    /**
     * 등록 처리
     * 
     * @param surveyVO
     * @return
     */
    @RequestMapping(value = "/survey/create3.do", method = RequestMethod.POST)
    public ModelAndView create3(SurveyVO surveyVO) { 
        
        ModelAndView mav = new ModelAndView();

        
        this.surveyProc.create(surveyVO); // 등록 처리
        mav.setViewName("/survey/create4");

        return mav; // forward
        }

    /**
     * 등록 폼 create4
     * 
     * @return
     */
    @RequestMapping(value = "/survey/create4.do", method = RequestMethod.GET)
    public ModelAndView create4() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/survey/create4");

        return mav; // forward
    }

    /**
     * 등록 처리
     * 
     * @param surveyVO
     * @return
     */
    @RequestMapping(value = "/survey/create4.do", method = RequestMethod.POST)
    public ModelAndView create4(SurveyVO surveyVO) { 
        
        ModelAndView mav = new ModelAndView();

        
        this.surveyProc.create(surveyVO); // 등록 처리
        mav.setViewName("/survey/create5");

        return mav; // forward
        }
    
    /**
     * 등록 폼 create5
     * 
     * @return
     */
    @RequestMapping(value = "/survey/create5.do", method = RequestMethod.GET)
    public ModelAndView create5() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/survey/create5");

        return mav; // forward
    }

    /**
     * 등록 처리
     * 
     * @param surveyVO
     * @return
     */
    @RequestMapping(value = "/survey/create5.do", method = RequestMethod.POST)
    public ModelAndView create5(SurveyVO surveyVO) { 
        
        ModelAndView mav = new ModelAndView();

        
        this.surveyProc.create(surveyVO); // 등록 처리
        mav.setViewName("/survey/create6");

        return mav; // forward
        }
    
    /**
     * 등록 폼 create6
     * 
     * @return
     */
    @RequestMapping(value = "/survey/create6.do", method = RequestMethod.GET)
    public ModelAndView create6() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/survey/create6");

        return mav; // forward
    }

    /**
     * 등록 처리
     * 
     * @param surveyVO
     * @return
     */
    @RequestMapping(value = "/survey/create6.do", method = RequestMethod.POST)
    public ModelAndView create6(SurveyVO surveyVO) { 
        
        ModelAndView mav = new ModelAndView();

        
        this.surveyProc.create(surveyVO); // 등록 처리
        mav.setViewName("/survey/create7");

        return mav; // forward
        }
    
    /**
     * 등록 폼 create7
     * 
     * @return
     */
    @RequestMapping(value = "/survey/create7.do", method = RequestMethod.GET)
    public ModelAndView create7() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/survey/create7");

        return mav; // forward
    }

    /**
     * 등록 처리
     * 
     * @param surveyVO
     * @return
     */
    @RequestMapping(value = "/survey/create7.do", method = RequestMethod.POST)
    public ModelAndView create7(SurveyVO surveyVO) { 
        
        ModelAndView mav = new ModelAndView();

        
        this.surveyProc.create(surveyVO); // 등록 처리
        mav.setViewName("/survey/create8");

        return mav; // forward
        }
    
    /**
     * 등록 폼 create8
     * 
     * @return
     */
    @RequestMapping(value = "/survey/create8.do", method = RequestMethod.GET)
    public ModelAndView create8() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/survey/create8");

        return mav; // forward
    }

    /**
     * 등록 처리
     * 
     * @param surveyVO
     * @return
     */
    @RequestMapping(value = "/survey/create8.do", method = RequestMethod.POST)
    public ModelAndView create8(SurveyVO surveyVO) { 
        
        ModelAndView mav = new ModelAndView();

        
        this.surveyProc.create(surveyVO); // 등록 처리
        mav.setViewName("/survey/create9");

        return mav; // forward
        }
    
    /**
     * 등록 폼 create9
     * 
     * @return
     */
    @RequestMapping(value = "/survey/create9.do", method = RequestMethod.GET)
    public ModelAndView create9() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/survey/create3");

        return mav; // forward
    }

    /**
     * 등록 처리
     * 
     * @param surveyVO
     * @return
     */
    @RequestMapping(value = "/survey/create9.do", method = RequestMethod.POST)
    public ModelAndView create9(SurveyVO surveyVO) { 
        
        ModelAndView mav = new ModelAndView();

        
        this.surveyProc.create(surveyVO); // 등록 처리
        mav.setViewName("/recomm/recomm_bread");

        return mav; // forward
        }
}