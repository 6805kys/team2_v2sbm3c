<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team2 빵파고</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'><A href="../authgrp/list.do" class='title_link'>권한그룹</A> > 권한그룹+권한상세</DIV>

<DIV class='content_body'>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 15%;'/>
      <col style='width: 15%;'/>
      <col style='width: 15%;'/>    
      <col style='width: 15%;'/>
      <col style='width: 10%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">권한그룹 번호</TH>
      <TH class="td_bs_left">권한그룹 이름</TH>
      <TH class="th_bs">등록 권한 </TH>
      <TH class="th_bs">수정 권한</TH>
      <TH class="th_bs">삭제 권한</TH>
      <TH class="th_bs">조회 권한</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="Authgrp_Auth_infoVO" items="${list}">
      <c:set var="r_authno" value="${Authgrp_Auth_infoVO.r_authno }" />
      <c:set var="r_authname" value="${Authgrp_Auth_infoVO.r_authname }" />
      <c:set var="create_auth" value="${Authgrp_Auth_infoVO.create_auth }" />
      <c:set var="update_auth" value="${Authgrp_Auth_infoVO.update_auth }" />
      <c:set var="delete_auth" value="${Authgrp_Auth_infoVO.delete_auth }" />
      <c:set var="read_auth" value="${Authgrp_Auth_infoVO.read_auth }" />
      
      <TR>
        <TD class="td_bs">${r_authno }</TD>
        <TD class="td_bs_left">${r_authname }</TD>
        <TD class="td_bs">${create_auth }</TD>
        <TD class="td_bs">${update_auth }</TD>
        <TD class="td_bs">${delete_auth }</TD>
        <TD class="td_bs">${read_auth }</TD>
        <TD class="td_bs">
          <A href="./read_update.do?authno=${r_authno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?authno=${r_authno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
 