<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Bread recommended</title>
<%-- /static/css/style.css --%> 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

<DIV class='title_line'> πBESTν¬ν μ‘΄π > μλ¦Ό</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.code == 'passwd_fail'}">
          <LI class='li_none'>
            <span class="span_fail">ν¨μ€μλκ° μΌμΉνμ§ μμ΅λλ€.</span>
          </LI> 
        </c:when>
        <c:when test="${param.code == 'product_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">μν μ λ³΄λ₯Ό λ±λ‘νμ΅λλ€.</span>
          </LI>                   
          <LI class='li_none'>                                                   
            <button type='button' 
                         onclick="location.href='./product_update.do?cateno=${param.cateno}&categrpno=${param.categrpno }&contentsno=${param.contentsno }'"
                         class="btn btn-default">κ΄λ ¨ μν μ λ³΄ μ¬λ±λ‘</button>
          </LI>
        </c:when>

        <c:when test="${param.code == 'create_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">μλ‘μ΄ ν¬ν κΈμ λ±λ‘νμ΅λλ€.</span>
          </LI>  
          <LI class='li_none'>
            <button type='button' 
                         onclick="location.href='./create.do'"
                         class="btn btn-default">μλ‘μ΄ ν¬ν κΈ λ±λ‘</button>
          </LI> 
        </c:when>
        <c:when test="${param.code == 'create_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">μλ‘μ΄ ν¬ν κΈ λ±λ‘μ μ€ν¨νμ΅λλ€.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'update_text_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">ν¬ν κΈμ μμ νμ΅λλ€.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'update_text_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">ν¬ν κΈ μμ μ μ€ν¨νμ΅λλ€.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'update_file_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">ν¬ν κΈ μ¬μ§μ΄ μλ‘ μλ‘λ λμ΅λλ€.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'update_file_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">ν¬ν κΈ μ¬μ§ μμ μ μ€ν¨νμ΅λλ€.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'delete_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">ν¬ν κΈ μ­μ μ μ±κ³΅νμ΅λλ€.</span>
          </LI>                                                                      
        </c:when>        
        <c:when test="${code == 'delete_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">ν¬ν κΈ μ­μ μ μ€ν¨νμ΅λλ€.</span>
          </LI>                                                                      
        </c:when> 
        <c:otherwise>
          <LI class='li_none_left'>
            <span class="span_fail">μ μ μλ μλ¬λ‘ μμμ μ€ν¨νμ΅λλ€.</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">λ€μ μλν΄μ£ΌμΈμ.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <c:choose>
            <c:when test="${param.cnt == 0 }">
                <button type='button' onclick="history.back()" class="btn btn-primary">λ€μ μλ</button>    
            </c:when>
        </c:choose>
        
        <%-- <a href="./list_by_cateno.do?cateno=${param.cateno}" class="btn btn-primary">λͺ©λ‘</a> --%>
        <%-- <button type='button' onclick="location.href='./list_by_cateno_search.do?cateno=${param.cateno}'" class="btn btn-primary">λͺ©λ‘</button> --%>
        <button type='button' onclick="location.href='./list_by_content_no_search_paging.do'" class="btn btn-primary">λͺ©λ‘</button>

      </LI>
    </UL>
  </fieldset>

</DIV>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>

