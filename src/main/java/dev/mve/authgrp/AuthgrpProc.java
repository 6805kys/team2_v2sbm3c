package dev.mve.authgrp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.authgrp.AuthgrpProc")
public class AuthgrpProc implements AuthgrpProcInter {
    @Autowired
    private AuthgrpDAOInter authgrpDAO;
    
    public AuthgrpProc(){
        System.out.println("-> AuthgrpProc created.");
      }
    
    @Override
    public int create(AuthgrpVO authgrpVO) {
      int cnt = this.authgrpDAO.create(authgrpVO);
      return cnt;
    }

}
