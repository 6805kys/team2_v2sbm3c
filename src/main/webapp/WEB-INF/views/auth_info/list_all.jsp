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
 
<DIV class='title_line'>권한그룹 > 전체 상세권한</DIV>

<DIV class='content_body'>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>    
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">권한번호</TH>
      <TH class="th_bs">등록권한</TH>
      <TH class="th_bs">수정권한</TH>
      <TH class="th_bs">삭제권한</TH>
      <TH class="th_bs">읽기권한</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="auth_infoVO" items="${list}">
      <c:set var="authno" value="${auth_infoVO.authno }" />
      <c:set var="create_auth" value="${auth_infoVO.create_auth }" />
      <c:set var="update_auth" value="${auth_infoVO.update_auth }" />
      <c:set var="delete_auth" value="${auth_infoVO.delete_auth }" />
      <c:set var="read_auth" value="${auth_infoVO.read_auth }" />
      
      <TR>
        <TD class="td_bs">${authno }</TD>
        <TD class="td_bs">${create_auth }</TD>
        <TD class="td_bs">${update_auth }</TD>
        <TD class="td_bs">${delete_auth }</TD>
        <TD class="td_bs">${read_auth }</TD>
        <TD class="td_bs">
          <A href="./read_update.do?authno=${authno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?authno=${authno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

