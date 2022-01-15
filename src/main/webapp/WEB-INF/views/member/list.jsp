<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Project 빵파고</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<script type="text/javascript">
  $(function(){
 
  });
</script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
  <DIV class='title_line'>
    회원목록
  </DIV>

  <DIV class='content_body'>

    <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href='./list.do'>목록</A>
    </ASIDE> 
   
    <div class='menu_line'></div>
    
   
    <table class="table table-condensed" style='width: 100%;'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
      <col style='width: 20%;'/>
      <col style='width: 15%;'/>
      <col style='width: 15%;'/>
      <col style='width: 15%;'/>
      <col style='width: 10%;'/>
    </colgroup>
    <TR>
      <TH class='th_bs'>회원번호</TH>
      <TH class='th_bs'>ID</TH>
      <TH class='th_bs'>닉네임</TH>
      <TH class='th_bs'>전화번호</TH>
      <TH class='th_bs'>이메일</TH>
      <TH class='th_bs'>가입일</TH>
      <TH class='th_bs'>등급번호</TH>
    </TR>
   
    <c:forEach var="memberVO" items="${list }">
      <c:set var="memberno" value ="${memberVO.memberno}" />
      <c:set var="id" value ="${memberVO.id}" />
      <c:set var="nickname" value ="${memberVO.nickname}" />
      <c:set var="tel" value ="${memberVO.tel}" />
      <c:set var="email" value ="${memberVO.email}" />
      <c:set var="mdate" value ="${memberVO.mdate}" />
      <c:set var="gradeno" value ="${memberVO.gradeno}" />
       
    <TR>
      <TD class=td_basic>${memberno}</TD>
      <TD class='td_left'><A href="./read.do?memberno=${memberno}">${id}</A></TD>
      <TD class='td_left'><A href="./read.do?memberno=${memberno}">${nickname}</A></TD>
      <TD class='td_basic'>${tel}</TD>
      <TD class='td_left'>
        <c:choose>
          <c:when test="${email.length() > 15 }"> <!-- 긴 이메일 처리 -->
            ${email.substring(0, 15) }...
          </c:when>
          <c:otherwise>
            ${email}
          </c:otherwise>
        </c:choose>
      </TD>
      <TD class='td_basic'>${mdate.substring(0, 10)}</TD> <!-- 년월일 -->
      <TD class='td_basic'><A href="./read.do?memberno=${memberno}">${gradeno}</A></TD>
      <TD class='td_basic'>
        <!-- <A href="./passwd_update.do?memberno=${memberno}"><IMG src='/member/images/passwd.png' title='패스워드 변경'></A> -->
        <A href="./read.do?memberno=${memberno}"><IMG src='/member/images/update.png' title='수정'></A>
        <A href="./delete.do?memberno=${memberno}"><IMG src='/member/images/delete.png' title='삭제'></A>
      </TD>
      
    </TR>
    </c:forEach>
    
  </TABLE>
   
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='./list_info.do'" class="btn btn-primary">상세목록</button>
    <button type='button' onclick="location.reload();" class="btn btn-primary">새로 고침</button>
  </DIV>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


