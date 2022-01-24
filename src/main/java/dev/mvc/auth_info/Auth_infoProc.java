package dev.mvc.auth_info;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.auth_info.Auth_infoProc")
public class Auth_infoProc implements Auth_infoProcInter {
    @Autowired
    private Auth_infoDAOInter auth_infoDAO;
    
    public Auth_infoProc() {
        System.out.println("->Auth_infoProc created.");
    }
    
    @Override
    public int create(Auth_infoVO auth_infoVO) {
        int cnt = this.auth_infoDAO.create(auth_infoVO);
        return cnt;
    }

    @Override
    public List<Auth_infoVO> list_all() {
        List<Auth_infoVO> list = this.auth_infoDAO.list_all();
        return list;
    }

    @Override
    public List<Auth_infoVO> list_by_authno(int authno) {
        List<Auth_infoVO> list = this.auth_infoDAO.list_by_authno(authno);
        return list;
    }
    
    @Override
    public List<Authgrp_Auth_infoVO> list_by_r_authno(int r_authno) {
        List<Authgrp_Auth_infoVO> list = this.auth_infoDAO.list_by_r_authno(r_authno);
        return null;
    }

    @Override
    public List<Authgrp_Auth_infoVO> list_all_join() {
        List<Authgrp_Auth_infoVO> list = this.auth_infoDAO.list_all_join();
        return list;
    }

    @Override
    public Auth_infoVO read(int authno) {
        Auth_infoVO auth_infoVO = this.auth_infoDAO.read(authno);
        return auth_infoVO;
    }

    @Override
    public int update(Auth_infoVO auth_infoVO) {
        int cnt = this.auth_infoDAO.update(auth_infoVO);
        return cnt;
    }

    @Override
    public int delete(int authno) {
        int cnt = this.auth_infoDAO.delete(authno);
        return cnt;
    }

    @Override
    public int delete_by_authno(int authno) {
        int cnt = this.auth_infoDAO.delete_by_authno(authno);
        return cnt;
    }


    
}
