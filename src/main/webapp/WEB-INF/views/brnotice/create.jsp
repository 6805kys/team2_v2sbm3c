<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" notice="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Bread recommended</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
 <A href="../brpost/list_by_notice_no_search_paging.do" class='title_link'> πκ³΅μ§μ¬ν­π  > κΈ λ±λ‘</DIV>
</DIV>

<DIV class='notice_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">λ±λ‘</A>
    <span class='menu_divide' >β</span>
    <A href="javascript:location.reload();">μλ‘κ³ μΉ¨</A>
    <span class='menu_divide' >β</span>
    <A href="./list_by_notice_no_search_paging.do">HOME</A>    
    <span class='menu_divide' >β</span>
    <A href="./update_text.do?notice_no=${notice_no}">μμ </A>
  </ASIDE> 
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_notice_no_search_paging.do'>
      <c:choose>
        <c:when test="${param.notice_word != '' }"> <%-- κ²μνλ κ²½μ° --%>
          <input type='text' name='notice_word' id='notice_word' value='${param.notice_word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- κ²μνμ§ μλ κ²½μ° --%>
          <input type='text' name='notice_word' id='notice_word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>κ²μ</button>
      <c:if test="${param.notice_word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_notice_no_search_paging.do&notice_word='">κ²μ μ·¨μ</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
             enctype="multipart/form-data">
    <div class="form-group">
       <label class="control-label col-md-2">μ λͺ©</label>
       <div class="col-md-10">
         <input type='text' name='notice_name' value='μ λͺ©' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">λ΄μ©</label>
       <div class="col-md-10">
         <textarea name='notice_post' required="required" class="form-control" rows="12" style='width: 100%;'>λ΄μ©</textarea>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">κ²μμ΄</label>
       <div class="col-md-10">
         <input type='text' name='notice_word' value='#κ²μμ΄' required="required" 
                    class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">ν¨μ€μλ</label>
       <div class="col-md-10">
         <input type='password' name='passwd' value='1234' required="required" 
                    class="form-control" style='width: 50%;'>
       </div>
    </div>   
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">λ±λ‘</button>
      <button type="button" onclick="location.href='./list.do'" class="btn btn-primary">λͺ©λ‘</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


