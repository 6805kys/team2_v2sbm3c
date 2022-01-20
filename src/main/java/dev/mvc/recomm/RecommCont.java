package dev.mvc.recomm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RecommCont {
    public RecommCont() {
        System.out.print("-> RecommCont created.");
    }
    
    @RequestMapping(value = {"/recomm/final.do"}, method = RequestMethod.GET)
    public ModelAndView start() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/recomm/final");  
      
      
      
      return mav;
    }

}
