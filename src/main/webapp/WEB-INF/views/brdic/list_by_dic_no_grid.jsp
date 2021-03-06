<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" dic="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Bread recommended</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'> ๐๋นต ๋ฐฑ๊ณผ์ฌ์ ๐ </DIV>

<DIV class='dic_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">๋ฑ๋ก</A>
    <span class='menu_divide' >โ</span>
    <A href="javascript:location.reload();">์๋ก๊ณ ์นจ</A>
    <span class='menu_divide' >โ</span>
    <A href="./list_by_dic_no_search_paging.do">HOME</A>    
    <span class='menu_divide' >โ</span>
    <A href="./list_by_dic_no_grid.do">๊ฐค๋ฌ๋ฆฌํ</A>
    <span class='menu_divide' >โ</span>
    <A href="./update_text.do?dic_no=${dic_no}">์์ </A>
    <span class='menu_divide' >โ</span>
    <A href="./update_file.do?dic_no=${dic_no}">ํ์ผ ์์ </A>  
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'> <%-- ๊ฐค๋ฌ๋ฆฌ Layout ์์ --%>
    <c:forEach var="brdicVO" items="${list }" varStatus="status">
      <c:set var="dic_no" value="${brdicVO.dic_no }" />
      <c:set var="dic_name" value="${brdicVO.dic_name }" />
      <c:set var="dic_post" value="${brdicVO.dic_post }" />
      <c:set var="file1" value="${brdicVO.file1 }" />
      <c:set var="size1" value="${brdicVO.size1 }" />
      <c:set var="thumb1" value="${brdicVO.thumb1 }" />
      

      <%-- ํ๋์ ํ์ ์ด๋ฏธ์ง๋ฅผ 4๊ฐ์ฉ ์ถ๋ ฅํ ํ ๋ณ๊ฒฝ, index๋ 0๋ถํฐ ์์ --%>
      <c:if test="${status.index % 4 == 0 && status.index != 0 }"> 
        <HR class='menu_line'>
      </c:if>
      
      <!-- ํ๋์ ์ด๋ฏธ์ง, 24 * 4 = 96% -->
      <DIV style='width: 24%; 
              float: left; 
              margin: 0.5%; padding: 0.5%; background-color: #EEEFFF; text-align: center;'>
        <c:choose>
          <c:when test="${size1 > 0}"> <!-- ํ์ผ์ด ์กด์ฌํ๋ฉด -->
            <c:choose> 
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <!-- ์ด๋ฏธ์ง ์ธ๊ฒฝ์ฐ -->
                <a href="./read.do?dic_no=${dic_no}">               
                  <IMG src="./storage/${thumb1 }" style='width: 100%; height: 150px;'>
                </a><br>๐${dic_name}๐ <br>
              </c:when>
              <c:otherwise> <!-- ์ด๋ฏธ์ง๊ฐ ์๋ ์ผ๋ฐ ํ์ผ -->
                <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                  <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- ์์ง ๊ฐ์ด๋ฐ ์ ๋ ฌ -->
                    <a href="./read.do?dic_no=${dic_no}">${file1}</a><br>
                  </DIV>
                </DIV>
                ${dic_name} (${cnt})              
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise> <%-- ํ์ผ์ด ์๋ ๊ฒฝ์ฐ ๊ธฐ๋ณธ ์ด๋ฏธ์ง ์ถ๋ ฅ --%>
            <a href="./read.do?dic_no=${dic_no}">
              <img src='/brdic/images/none1.png' style='width: 100%; height: 150px;'>
            </a><br>
            ์ด๋ฏธ์ง๋ฅผ ๋ฑ๋กํด์ฃผ์ธ์.
          </c:otherwise>
        </c:choose>         
      </DIV>  
    </c:forEach>
    <!-- ๊ฐค๋ฌ๋ฆฌ Layout ์ข๋ฃ -->
    <br><br>
  </div>

</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

