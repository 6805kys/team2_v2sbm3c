<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bakeryno" value="${bakeryVO.bakeryno }" />
<c:set var="bakery" value="${bakeryVO.bakery }" />        
<c:set var="telephone" value="${bakeryVO.telephone }" />
<c:set var="address" value="${bakeryVO.address }" />
<c:set var="station" value="${bakeryVO.station }" />
<c:set var="rating" value="${bakeryVO.rating }" />
<c:set var="signature" value="${bakeryVO.signature }" />
<c:set var="breadgrpno" value="${bakeryVO.breadgrpno }" />
<c:set var="tag" value="${tagVO.tag }" />

 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>빵추</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./list_by_search_paging.do">목록으로 돌아가기</A>    
  </ASIDE> 
  
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_search_paging.do'>
      <input type='hidden' name='bakeryno' value='${bakeryVO.bakeryno }'>
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_search_paging.do?word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 47%; height: 260px; float: left; margin-right: 10px; margin-bottom: 30px;">
          <span style="font-size: 1.8em; font-weight: bold;"> 
          <a href='https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${bakery }'>${bakery }</a></span><br><br>          
          <c:forEach var="tagVO" items="${taglist }" varStatus="status"> 
          <span style="font-size: 1.0em; font-weight: bold;">
          <i> # <a href='https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${tagVO.tag }'> ${tagVO.tag } </a>
          </i></span></c:forEach><br><br>
          <span style="font-size: 1.0em;"><IMG src="/bakery/images/telephone.png" style="width: 4%;">  ${telephone}</span><br>
          <span style="font-size: 1.0em;"><IMG src="/bakery/images/map.png" style="width: 4%;">  ${address } </span><br>         
          <span style="font-size: 1.0em;"><IMG src="/bakery/images/metro.png" style="width: 3%;">    ${station}</span><br>
          <span style="font-size: 1.0em;"><IMG src="/bakery/images/bread.png" style="width: 4%;">  ${signature}</span><br>        
        </DIV>        
      </li>
    </ul>
  </fieldset>
  
</DIV>
 <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>