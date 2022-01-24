<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Bread recommended</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'> BEST포토존 </DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_content_no_grid1.do">갤러리형</A>
  </ASIDE> 

  <%-- ******************** 검색 시작 ******************** --%>
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_content_no_search.do'>
      <input type='text' name='content_word' id='content_word' value='${param.content_word }' style='width: 20%;'>
      <button type='submit'>검색</button>
      <c:if test="${param.content_word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_content_no_search.do&content_word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  <%-- ******************** 검색 종료 ******************** --%>
  
  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 20%;"></col>
      <col style="width: 20%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
    <%-- table 컬럼 --%>
     <thead>
      <tr>
       <th style='text-align: center;'> </th> 
       <th style='text-align: center;'> </th>
        <th style='text-align: center;'>등록일</th>
       <th style='text-align: center;'> </th> 
      </tr>
    
    </thead>  
    
    <%-- table 내용 --%>
    <tbody>
      <c:forEach var="brcontentVO" items="${list }">
        <c:set var="content_no" value="${brcontentVO.content_no }" />
        <c:set var="thumb1" value="${brcontentVO.thumb1 }" />
        <c:set var="content_name" value="${brcontentVO.content_name }" />
        <c:set var="content_post" value="${brcontentVO.content_post }" />
        <c:set var="content_crtime" value="${brcontentVO.content_crtime.substring(0, 10) }" />
        
        <tr> 
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
               <a href="./read.do?content_no=${content_no}&now_page=${param.now_page }"><IMG src="/brcontent/storage/${thumb1 }" style="width: 120px; height: 80px;"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/brcontent/images/none1.png" style="width: 120px; height: 80px;">
              </c:otherwise>
            </c:choose>
          <td style='vertical-align: middle;'>
            <a href="./read.do?content_no=${content_no}"><strong>${content_name}</strong> ${content_post}</a> 
          </td> 
          <td style='vertical-align: middle; text-align: center;'>${brcontentVO.content_crtime.substring(0, 10)}</td>
           <td style='vertical-align: middle; text-align: center;'>수정/삭제</td>
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>


