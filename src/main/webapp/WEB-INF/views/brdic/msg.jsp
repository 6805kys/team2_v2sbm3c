<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" dic="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Bread recommended</title>
<%-- /static/css/style.css --%> 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

<DIV class='title_line'> ๐๋นต ๋ฐฑ๊ณผ์ฌ์ ๐ > ์๋ฆผ</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.code == 'passwd_fail'}">
          <LI class='li_none'>
            <span class="span_fail">ํจ์ค์๋๊ฐ ์ผ์นํ์ง ์์ต๋๋ค.</span>
          </LI> 
        </c:when>

        <c:when test="${param.code == 'create_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">์๋ก์ด ๋นต ๋ฐฑ๊ณผ์ฌ์ ๊ธ์ ๋ฑ๋กํ์ต๋๋ค.</span>
          </LI>  
          <LI class='li_none'>
            <button type='button' 
                         onclick="location.href='./create.do'"
                         class="btn btn-default">์๋ก์ด ๋นต ๋ฐฑ๊ณผ์ฌ์ ๊ธ ๋ฑ๋ก</button>
          </LI> 
        </c:when>
        <c:when test="${param.code == 'create_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">์๋ก์ด ๋นต ๋ฐฑ๊ณผ์ฌ์ ๊ธ ๋ฑ๋ก์ ์คํจํ์ต๋๋ค.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'update_text_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">๋นต ๋ฐฑ๊ณผ์ฌ์ ๊ธ์ ์์ ํ์ต๋๋ค.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'update_text_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">๋นต ๋ฐฑ๊ณผ์ฌ์ ๊ธ ์์ ์ ์คํจํ์ต๋๋ค.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'update_file_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">๋นต ๋ฐฑ๊ณผ์ฌ์ ๊ธ ์ฌ์ง์ด ์๋ก ์๋ก๋ ๋์ต๋๋ค.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'update_file_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">๋นต ๋ฐฑ๊ณผ์ฌ์ ๊ธ ์ฌ์ง ์์ ์ ์คํจํ์ต๋๋ค.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'delete_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">๋นต ๋ฐฑ๊ณผ์ฌ์ ๊ธ ์ญ์ ์ ์ฑ๊ณตํ์ต๋๋ค.</span>
          </LI>                                                                      
        </c:when>        
        <c:when test="${code == 'delete_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">๋นต ๋ฐฑ๊ณผ์ฌ์ ๊ธ ์ญ์ ์ ์คํจํ์ต๋๋ค.</span>
          </LI>                                                                      
        </c:when> 
        <c:otherwise>
          <LI class='li_none_left'>
            <span class="span_fail">์ ์ ์๋ ์๋ฌ๋ก ์์์ ์คํจํ์ต๋๋ค.</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">๋ค์ ์๋ํด์ฃผ์ธ์.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <c:choose>
            <c:when test="${param.cnt == 0 }">
                <button type='button' onclick="history.back()" class="btn btn-primary">๋ค์ ์๋</button>    
            </c:when>
        </c:choose>
        
        <%-- <a href="./list_by_cateno.do?cateno=${param.cateno}" class="btn btn-primary">๋ชฉ๋ก</a> --%>
        <%-- <button type='button' onclick="location.href='./list_by_cateno_search.do?cateno=${param.cateno}'" class="btn btn-primary">๋ชฉ๋ก</button> --%>
        <button type='button' onclick="location.href='./list_by_dic_no_search_paging.do'" class="btn btn-primary">๋ชฉ๋ก</button>

      </LI>
    </UL>
  </fieldset>

</DIV>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>

