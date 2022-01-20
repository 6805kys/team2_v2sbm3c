package dev.mvc.auth_info;

import java.util.List;

public interface Auth_infoProcInter {
    /**
    * 등록
    * insert id="create" parameterType="dev.mvc.auth_info.Auth_infoVO"
    * @param Auth_infoVO
    * @return 등록된 갯수
    */
   public int create(Auth_infoVO auth_infoVO);
   
   /**
    *  전체 목록
    * @return
    */
   public List<Auth_infoVO> list_all();
  
   /**
    *  authno별 목록
    * @return
    */
   public List<Auth_infoVO> list_by_authno(int authno);
   
   /**
    *  r_authno별 목록
    * @return
    */
   public List<Authgrp_Auth_infoVO> list_by_r_authno(int r_authno);
   
   /**
    * Authgrp + Auth_info join, 연결 목록
    * @return
    */
   public List<Authgrp_Auth_infoVO> list_all_join();
   
   /**
    * 조회, 수정폼
    * @param authno 권한번호, FK
    * @return
    */
   public Auth_infoVO read(int authno);
   
   /**
    * 수정 처리
    * @param auth_infoVO
    * @return
    */
   public int update(Auth_infoVO auth_infoVO);
   
   /**
    * 삭제 처리 
    * @param authno
    * @return
    */
   public int delete(int authno);
   
   /**
    * authno가 같은 모든 레코드 삭제
    * @param authno
    * @return
    */
   public int delete_by_authno(int authno);
}
