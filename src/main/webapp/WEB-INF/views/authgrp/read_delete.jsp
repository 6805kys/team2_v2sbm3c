<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<c:set var="authno" value="${authgrpVO.authno }" />
<c:set var="authname" value="${authgrpVO.authname }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team2 빵파고</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>카테고리 그룹 > ${name } 삭제</DIV>

<DIV class='content_body'>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">권한그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='authno' id='authno' value='${authno }'>
        
      <label>권한그룹명</label>: ${authname }  
       
      <button type="submit" id='submit' class='btn btn-primary btn-xs' style="height: 22px; margin-bottom: 3px;">삭제</button>
      <button type="button" onclick="location.href='./list.do'" class='btn btn-primary btn-xs' style="height: 22px; margin-bottom: 3px;">취소</button>
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
      <TH class="th_bs">권한그룹번호</TH>
      <TH class="td_bs_left">권한그룹명</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="authgrpVO" items="${list}">
      <c:set var="authno" value="${authgrpVO.authno }" />
      <c:set var="authname" value="${authgrpVO.authname }" />
      <TR>
        <TD class="td_bs">${authno }</TD>
        <TD class="td_bs_left">${authname }</TD>
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

