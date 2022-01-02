<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>http://localhost:9091/member/session.do</title>
 
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
  <c:forEach var="name" items="${pageContext.session.attributeNames}">
      변수: ${name}
      값: ${sessionScope[name]}
      <br>
  </c:forEach> 
  <br>  
  로그인된 ID: ${sessionScope.id}
  <br>
  
  <%-- 등급번호   1~10: 관리자(커뮤니티)
                       10~19: 씨앗(일반 이용자)
                       20~29: 밀(일반 이용자)
                       30~99: 빵(일반 이용자)
                     100~199: 파트너(빵집 사장님)   
                     400~499: 정지(휴면) 회원
                     500~599: 탈퇴회원 영역
                            999: 비회원
                       --%>
  <c:set var="grade" value="${sessionScope.grade}" />
  로그인 등급: ${grade }<br>
  <c:if test="${sessionScope.id ne null }">
    로그인된 사용자 메뉴 출력 영역(특정 권한별 구분)<br>
    <c:choose>
      <c:when test="${grade >= 1 and grade <= 9}">관리자 영역</c:when>    
      <c:when test="${grade >= 10 and grade <= 19}">회원(씨앗) 영역</c:when>
      <c:when test="${grade >= 20 and grade <= 29}">회원(밀) 영역</c:when>
      <c:when test="${grade >= 30 and grade <= 99}">회원(빵) 영역</c:when>   
      <c:when test="${grade >= 100 and grade <= 199}">파트너 회원 영역</c:when>
      <c:when test="${grade >= 400 and grade <= 499}">정지(휴면) 회원 영역</c:when>
      <c:when test="${grade >= 500 and grade <= 599}">탈퇴 회원 영역</c:when>
      <c:when test="${grade == 999}">비회원 영역 처리</c:when>
    </c:choose>  
    
    <c:choose>
      <c:when test="${grade <= 199}"> + 관리자 + 회원 +파트너 영역</c:when>
      <c:when test="${grade >= 400 and grade <= 599}"> + 정지, 탈퇴 영역 처리</c:when>
    </c:choose>  
  </c:if><br> 
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>