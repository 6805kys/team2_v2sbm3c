<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV class='top_img'>
    <DIV class='top_menu_label'> 빵파고 </DIV>
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='/' >🍞빵파고🍞</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/brnotice/list_by_notice_no_search_paging.do'>🍞공지사항🍞</A><span class='top_menu_sep'> </span> 
      <A class='menu_link'  href='/brcontent/list_by_content_no_search_paging.do'>🍞BEST포토존🍞</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/brtalk/list_by_talk_no_search_paging.do'>🍞HOT빵톡🍞</A><span class='top_menu_sep'> </span>      
      <A class='menu_link'  href='/brdic/list_by_dic_no_search_paging.do'>🍞빵 백과사전🍞</A><span class='top_menu_sep'> </span>
      <c:choose>
        <c:when test="${sessionScope.id != null}"> <%-- 로그인 한 경우 --%>
            ${sessionScope.nickname } <A class='menu_link'  href='/member/mypage.do' >Mypage</A><span class='top_menu_sep'> </span>
            <A class='menu_link'  href='/member/logout.do' >Logout</A><span class='top_menu_sep'> </span>
            <A class='menu_link'  href='/member/list.do' >List(매니저)</A><span class='top_menu_sep'> </span>
        
        </c:when>
        <c:otherwise> <%-- 로그인 하지 않은 경우 --%>
            <A class='menu_link'  href='/member/login.do' >🍞Login🍞</A><span class='top_menu_sep'> </span>
            <A class='menu_link'  href='/member/create.do'>🍞회원가입🍞</A><span class='top_menu_sep'> </span>
        </c:otherwise>       
      </c:choose>
      <%-- 임시: admin.do 에서 관리자 로그인 or 관리자 페이지 개발 
      <A class='menu_link'  href='/member/login.do' >관리자</A><span class='top_menu_sep'> </span> --%>
    </NAV>
  </DIV>
  
  <%-- 내용 --%> 

  <DIV class='content'>
