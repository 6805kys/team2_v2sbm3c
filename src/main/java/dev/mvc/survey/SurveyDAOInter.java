package dev.mvc.survey;

import java.util.List;

public interface SurveyDAOInter {
    /**
     * 등록
     * @param surveyVO
     * @return 등록된 레코드 갯수
     */
    public int create(SurveyVO surveyVO);
    

}
