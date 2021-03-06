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
 
<DIV class='title_line'> πBESTν¬ν μ‘΄π </DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">λ±λ‘</A>
    <span class='menu_divide' >β</span>
    <A href="javascript:location.reload();">μλ‘κ³ μΉ¨</A>
    <span class='menu_divide' >β</span>
    <A href="./list_by_content_no_search_paging.do">HOME</A>    
    <span class='menu_divide' >β</span>
    <A href="./list_by_content_no_grid.do">κ°€λ¬λ¦¬ν</A>
    <span class='menu_divide' >β</span>
    <A href="./update_text.do?content_no=${content_no}">μμ </A>
    <span class='menu_divide' >β</span>
    <A href="./update_file.do?content_no=${content_no}">νμΌ μμ </A>  
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'> <%-- κ°€λ¬λ¦¬ Layout μμ --%>
    <c:forEach var="brcontentVO" items="${list }" varStatus="status">
      <c:set var="content_no" value="${brcontentVO.content_no }" />
      <c:set var="content_name" value="${brcontentVO.content_name }" />
      <c:set var="content_post" value="${brcontentVO.content_post }" />
      <c:set var="file1" value="${brcontentVO.file1 }" />
      <c:set var="size1" value="${brcontentVO.size1 }" />
      <c:set var="thumb1" value="${brcontentVO.thumb1 }" />
      

      <%-- νλμ νμ μ΄λ―Έμ§λ₯Ό 4κ°μ© μΆλ ₯ν ν λ³κ²½, indexλ 0λΆν° μμ --%>
      <c:if test="${status.index % 4 == 0 && status.index != 0 }"> 
        <HR class='menu_line'>
      </c:if>
      
      <!-- νλμ μ΄λ―Έμ§, 24 * 4 = 96% -->
      <DIV style='width: 24%; 
              float: left; 
              margin: 0.5%; padding: 0.5%; background-color: #EEEFFF; text-align: center;'>
        <c:choose>
          <c:when test="${size1 > 0}"> <!-- νμΌμ΄ μ‘΄μ¬νλ©΄ -->
            <c:choose> 
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <!-- μ΄λ―Έμ§ μΈκ²½μ° -->
                <a href="./read.do?content_no=${content_no}">               
                  <IMG src="./storage/${thumb1 }" style='width: 100%; height: 150px;'>
                </a><br>π${content_name}π <br>
              </c:when>
              <c:otherwise> <!-- μ΄λ―Έμ§κ° μλ μΌλ° νμΌ -->
                <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                  <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- μμ§ κ°μ΄λ° μ λ ¬ -->
                    <a href="./read.do?content_no=${content_no}">${file1}</a><br>
                  </DIV>
                </DIV>
                ${content_name} (${cnt})              
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise> <%-- νμΌμ΄ μλ κ²½μ° κΈ°λ³Έ μ΄λ―Έμ§ μΆλ ₯ --%>
            <a href="./read.do?content_no=${content_no}">
              <img src='/brcontent/images/none1.png' style='width: 100%; height: 150px;'>
            </a><br>
            μ΄λ―Έμ§λ₯Ό λ±λ‘ν΄μ£ΌμΈμ.
          </c:otherwise>
        </c:choose>         
      </DIV>  
    </c:forEach>
    <!-- κ°€λ¬λ¦¬ Layout μ’λ£ -->
    <br><br>
  </div>

</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

