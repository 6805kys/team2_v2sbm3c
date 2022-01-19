package dev.mvc.survey;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;


 
// Autowired 기능에의해 자동 할당될 때 사용되는 이름
@Component("dev.mvc.survey.SurveyProc")
public class SurveyProc implements SurveyProcInter {
  // DI: 객체가 필요한 곳에 객체를 자동으로 생성하여 할당
  // Autowired: DI 사용 선언
  // Spring이 자동으로 WatchbrandgrpDAOInter를 구현하여 DAO class 생성후 객체를 만들어 할당
  @Autowired 
  private SurveyDAOInter surveyDAO;
  // private WatchbrandgrpDAOInter watchbrandgrpDAO = new WatchbrandgrpDAO();
  
  public SurveyProc() {
      System.out.println("-> SurveyProc created.");
  }
  
  @Override
  public int create(SurveyVO surveyVO) {
    int cnt = surveyDAO.create(surveyVO);
    
    return cnt;
  }

}