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
 
<!-- <DIV class='title_line'>
  <A href="./list_by_dic_no.do?dic_no=${brdicVO.dic_no }" class='title_link'>${brdicVO.dic_name }</A>
</DIV> -->

 <DIV class='title_line'> ๐๋นต ๋ฐฑ๊ณผ์ฌ์ ๐ </DIV>

<DIV class='dic_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">๋ฑ๋ก</A>
    <span class='menu_divide' >โ</span>
    <A href="javascript:location.reload();">์๋ก๊ณ ์นจ</A>
    <span class='menu_divide' >โ</span>
    <A href="./list_by_dic_no_grid1.do">๊ฐค๋ฌ๋ฆฌํ</A>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 20%;"></col>
      <col style="width: 20%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
    <%-- table ์ปฌ๋ผ --%>
    <!--  <thead>
      <tr>
        <th style='text-align: center;'>ํ์ผ</th>
        <th style='text-align: center;'>๊ฒ์๊ธ ์ ๋ชฉ</th>
        <th style='text-align: center;'>๋ฑ๋ก์ผ</th>
        <th style='text-align: center;'>๊ธฐํ</th>
      </tr>
    
    </thead> -->    
    
    <%-- table ๋ด์ฉ --%>
    <tbody>
      <c:forEach var="brdicVO" items="${list }">
        <c:set var="dic_no" value="${brdicVO.dic_no }" />
        <c:set var="thumb1" value="${brdicVO.thumb1 }" />
        <c:set var="dic_name" value="${brdicVO.dic_name }" />
        <c:set var="dic_post" value="${brdicVO.dic_post }" />
        <c:set var="dic_crtime" value="${brdicVO.dic_crtime.substring(0, 10) }" />
        
        <tr> 
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/dics/storage/ --%>
               <a href="./read.do?dic_no=${dic_no}&now_page=${param.now_page }"><IMG src="/brdic/storage/${thumb1 }" style="width: 120px; height: 80px;"> 
              </c:when>
              <c:otherwise> <!-- ๊ธฐ๋ณธ ์ด๋ฏธ์ง ์ถ๋ ฅ -->
                <IMG src="/brdic/images/none1.png" style="width: 120px; height: 80px;">
              </c:otherwise>
            </c:choose>
          <td style='vertical-align: middle;'>
            <a href="./read.do?dic_no=${dic_no}"><strong>${dic_name}</strong> ${dic_post}</a> 
          </td> 
          <td style='vertical-align: middle; text-align: center;'>${brdicVO.dic_crtime.substring(0, 10)}</td>
           <td style='vertical-align: middle; text-align: center;'>์์ /์ญ์ </td>
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

