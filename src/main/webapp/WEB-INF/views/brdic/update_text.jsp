<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="dic_name" value="${brdicVO.dic_name }" />
<c:set var="dic_post" value="${brdicVO.dic_post }" />
<c:set var="dic_word" value="${brdicVO.dic_word }" />
<c:set var="dic_no" value="${brdicVO.dic_no }" />
         
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" dic="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
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
 
<DIV class='title_line'> πλΉ΅ λ°±κ³Όμ¬μ π > [${dic_name }] κ²μκΈ μμ </DIV>

<DIV class='dic_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">λ±λ‘</A>
    <span class='menu_divide' >β</span>
    <A href="javascript:location.reload();">μλ‘κ³ μΉ¨</A>
    <span class='menu_divide' >β</span>
    <A href="./list_by_dic_no_search_paging.do">HOME</A>    
    <span class='menu_divide' >β</span>
    <A href="./list_by_dic_no_grid.do">κ°€λ¬λ¦¬ν</A>
    <span class='menu_divide' >β</span>
    <A href="./update_text.do?dic_no=${dic_no}">μμ </A>
    <span class='menu_divide' >β</span>
    <A href="./update_file.do?dic_no=${dic_no}">νμΌ μμ </A>  
  </ASIDE> 
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_dic_no_search_paging.do'>
      <input type='text' name='dic_word' id='dic_word' value='${param.dic_word }' style='width: 20%;'>
      <button type='submit'>κ²μ</button>
      <c:if test="${param.dic_word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_dic_no_search_paging.do&dic_word='">κ²μ μ·¨μ</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./update_text.do' class="form-horizontal">
    <input type='hidden' name='dic_no' value='${dic_no }'>
    <input type='hidden' name='now_page' value='${param.now_page }'>
    
    <div class="form-group">
       <label class="control-label col-md-2">μ λͺ©</label>
       <div class="col-md-10">
         <input type='text' name='dic_name' value='${dic_name }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">λ΄μ©</label>
       <div class="col-md-10">
         <textarea name='dic_post' required="required" class="form-control" rows="20" style='width: 100%;'>${dic_post }</textarea>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">κ²μμ΄</label>
       <div class="col-md-10">
         <input type='text' name='dic_word' value='${dic_word }' required="required" 
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


