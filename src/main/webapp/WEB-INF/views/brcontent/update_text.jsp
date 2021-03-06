<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="content_name" value="${brcontentVO.content_name }" />
<c:set var="content_post" value="${brcontentVO.content_post }" />
<c:set var="content_word" value="${brcontentVO.content_word }" />
<c:set var="content_no" value="${brcontentVO.content_no }" />
         
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
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
 
<DIV class='title_line'> πBESTν¬ν μ‘΄π > [${content_name }] κ²μκΈ μμ </DIV>

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
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_content_no_search_paging.do'>
      <input type='text' name='content_word' id='content_word' value='${param.content_word }' style='width: 20%;'>
      <button type='submit'>κ²μ</button>
      <c:if test="${param.content_word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_content_no_search_paging.do&content_word='">κ²μ μ·¨μ</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./update_text.do' class="form-horizontal">
    <input type='hidden' name='content_no' value='${content_no }'>
    <input type='hidden' name='now_page' value='${param.now_page }'>
    
    <div class="form-group">
       <label class="control-label col-md-2">μ λͺ©</label>
       <div class="col-md-10">
         <input type='text' name='content_name' value='${content_name }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">λ΄μ©</label>
       <div class="col-md-10">
         <textarea name='content_post' required="required" class="form-control" rows="20" style='width: 100%;'>${content_post }</textarea>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">κ²μμ΄</label>
       <div class="col-md-10">
         <input type='text' name='content_word' value='${content_word }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">ν¨μ€μλ</label>
       <div class="col-md-10">
         <input type='password' name='passwd' value='' required="required" class="form-control" style='width: 100%;'>
       </div>
    </div>

    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">μ μ₯</button>
      <button type="button" onclick="history.back();" class="btn btn-primary">μ·¨μ</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


