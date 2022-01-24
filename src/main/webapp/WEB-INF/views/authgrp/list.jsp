<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.authgrp.AuthgrpVO" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Project 빵파고</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">

</script>

</head>

<body>
<jsp:include page="../menu/top.jsp" />
<DIV class='title_line'>권한그룹 관리(관리자)</DIV>
<DIV class='content_body'>
    <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #goldenrod; width: 100%; text-align: center;'>
        <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
        
            <label>권한그룹이름</label>
            <input type='text' name='authname' value='' required="required" style='width: 25%;'
                autofocus="autofocus">

           <button type="submit" id='submit' class='btn btn-primary btn-xs' style="height: 22px; margin-bottom: 3px;">등록</button>
           <button type="button" onclick="cancel();" class='btn btn-primary btn-xs' style="height: 22px; margin-bottom: 3px;">취소</button>
        </FORM>     
    </DIV>
    
    
    <TABLE class='table table-striped'>
        <colgroup>
            <col style='width: 20%;'/>
            <col style='width: 60%;'/>
            <col style='width: 20%;'/>
        </colgroup>
        
        <thead>
        <TR>
            <TH class="th_bs">권한번호</TH>
            <TH class="th_bs">권한그룹명</TH>
            <TH class="th_bs">기타</TH>
        
        </TR>
        </thead>
        
        
        <tbody>
            <c:forEach var="authgrpVO" items="${list}">
                <c:set var="authno" value="${authgrpVO.authno }" />
                <c:set var="authname" value="${authgrpVO.authname }" />

                <TR>
                    <TD class="td_bs">${authno }</TD>
                    <TD class="td_bs"><A href="../auth_info/list_by_authno.do?authno=${authno }">${authname }</TD>

                    <TD class="td_bs">
                        <A href="./read_update.do?authno=${authno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
                        <A href="./read_delete.do?authno=${authno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
                    </TD>   
                </TR>   
            </c:forEach>        
        </tbody>
        
    </TABLE>   
</DIV> 
</body>
</html>