<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>빵추</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>

<DIV class='content_body'>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 35%;'/>
      <col style='width: 15%;'/>    
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">빵집 이름</TH>
      <TH class="th_bs">평점</TH>
      <TH class="th_bs">주소</TH>
      <TH class="th_bs">역</TH>
      <TH class="th_bs">시그니쳐</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="bakeryVO" items="${list}">
      <input type='hidden' name='bakeryno' value='${bakeryVO.bakeryno }'>
      <c:set var="bakery" value="${bakeryVO.bakery }" />
      <c:set var="rating" value="${bakeryVO.rating }" />
      <c:set var="address" value="${bakeryVO.address }" />
      <c:set var="station" value="${bakeryVO.station}" />
      <c:set var="signature" value="${bakeryVO.signature }" />
      
      <TR>
        <TD class="td_bs"><A href="./read.do?bakeryno=${bakeyno }">${bakery }</A></TD>
        <TD class="td_bs">${rating }</TD>
        <TD class="td_bs">${address }</TD>
        <TD class="td_bs">${station }</TD>
        <TD class="td_bs">${signature }</TD>

      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

</body>
 
</html>