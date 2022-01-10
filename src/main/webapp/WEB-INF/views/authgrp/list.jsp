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
        <FORM>
            <label>권한그룹이름</label>
            <input type='text' name='name' value='' required="required" style='width: 25%;'
                autofocus="autofocus">
            
            <label>Create권한</label>
            <select name='create_auth'>
                <option value='Y' selected="selected">Y</option>
                <option value='N'>N</option>
            </select>
            
            <label>Read권한</label>
            <select name='read_auth'>
                <option value='Y' selected="selected">Y</option>
                <option value='N'>N</option>
            </select>
            
            <label>Update권한</label>
            <select name='update_auth'>
                <option value='Y' selected="selected">Y</option>
                <option value='N'>N</option>
            </select>
            
            <label>Delete권한</label>
            <select name='delete__auth'>
                <option value='Y' selected="selected">Y</option>
                <option value='N'>N</option>
            </select>        
            
           <button type="submit" id='submit' class='btn btn-primary btn-xs' style="height: 22px; margin-bottom: 3px;">등록</button>
           <button type="button" onclick="cancel();" class='btn btn-primary btn-xs' style="height: 22px; margin-bottom: 3px;">취소</button>
        </FORM>     
    </DIV>
    
    
    <TABLE class='table table-striped'>
        <colgroup>
        
        </colgroup>
        
        
        <thead>
        <TR>
            <TH class="th_bs">권한번호</TH>
            <TH class="th_bs">권한그룹명</TH>
            <TH class="th_bs">권한그룹명</TH>
        
        </TR>
        </thead>
        
        
        <tbody>
        
        </tbody>
    
    
    </TABLE>   
</DIV> 
</body>
</html>