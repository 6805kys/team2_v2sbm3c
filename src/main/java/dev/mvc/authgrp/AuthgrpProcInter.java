package dev.mvc.authgrp;

public interface AuthgrpProcInter {
    /**
     * 권한그룹 생성
     * @param authgrpVO
     * @return
     */
    public int create(AuthgrpVO authgrpVO);
}