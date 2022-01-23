<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.brpost.BrpostVO" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Bread recommended</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>빵 추천 게시판</DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <label>커뮤니티 게시판명</label>
      <input type='text' name='post_name' value='' required="required" style='width: 25%;'
                 autofocus="autofocus">
  
      <label>생성자ID</label>
      <input type='text' name='post_id' value='' required="required" style='width: 25%;'
                 autofocus="autofocus">

       
      <button type="submit" id='submit' class='btn btn-primary btn-xs' style="height: 22px; margin-bottom: 3px;">등록</button>
      <button type="button" onclick="cancel();" class='btn btn-primary btn-xs' style="height: 22px; margin-bottom: 3px;">취소</button>
    </FORM>
  </DIV>
    
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 15%;'/>
      <col style='width: 12%;'/>
      <col style='width: 28%;'/>
      <col style='width: 28%;'/>    
      <col style='width: 10%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">생성자ID</TH>
      <TH class="th_bs">게시판 이름</TH>
      <TH class="th_bs">게시판 등록날짜</TH>
      <TH class="th_bs">게시판 수정날짜</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <%
    // Scriptlet
    // List<CategrpVO> list = (List<CategrpVO>)(request.getAttribute("list"));
    // for (CategrpVO categrpVO: list) {
    //    out.println(categrpVO.getName() + "<br>");
    // }
    %>
    <c:forEach var="brpostVO" items="${list}">
        <c:set var="post_no" value="${brpostVO.post_no }" />
        <c:set var="post_id" value="${brpostVO.post_id }" />
        <c:set var="post_name" value="${brpostVO.post_name }" />
        <c:set var="post_crtime" value="${brpostVO.post_crtime.substring(0, 10) }" />
        <c:set var="post_mdtime" value="${brpostVO.post_mdtime.substring(0, 10) }" />
      <TR>
        <TD class="td_bs">${post_id }</TD>
        <TD class="td_bs_left">${post_name }</TD>
        <TD class="td_bs">${post_crtime }</TD>
        <TD class="td_bs">${post_mdtime }</TD>
        <TD class="td_bs">
         </TD>   
        
        <TD class="td_bs">
          <A href="./read_update.do?post_no=${post_no }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?post_no=${post_no }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>       
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>