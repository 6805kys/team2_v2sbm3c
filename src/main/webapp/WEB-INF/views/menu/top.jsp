<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main'>
  <%-- 화면 상단 메뉴 --%>
  <DIV class='top_img'>
    <DIV class='top_menu_label'>Project 빵파고</DIV>
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='/' >빵파고</A><span class='top_menu_sep'> </span>
      
      <c:choose>
        <c:when test="${sessionScope.id != null}"> <%-- 로그인 한 경우 --%>
           ${sessionScope.nickname } <A class='menu_link'  href='/member/logout.do' >Logout</A><span class='top_menu_sep'> </span>
           <A class='menu_link'  href='/member/list.do' >List(매니저)</A><span class='top_menu_sep'> </span>
        </c:when>
        <c:otherwise> <%-- 로그인 하지 않은 경우 --%>
           <A class='menu_link'  href='/member/login.do' >Login</A><span class='top_menu_sep'> </span>
           <A class='menu_link'  href='/member/create.do'>회원가입</A><span class='top_menu_sep'> </span>
        </c:otherwise>
      </c:choose>
            
    </NAV>
  </DIV>
  
  <%-- 내용 --%> 
  <DIV class='content'>
  
  