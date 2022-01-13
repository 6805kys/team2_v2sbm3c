<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dic_no" value="${brdicVO.dic_no }" />
<c:set var="dic_name" value="${brdicVO.dic_name }" />
 
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
 
<DIV class='title_line'> 🍞빵 백과사전🍞 >[${dic_name }] 게시글 삭제</DIV>

<DIV class='dic_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_dic_no_search_paging.do">HOME</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_by_dic_no_grid.do">갤러리형</A>
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?dic_no=${dic_no}">수정</A>
    <span class='menu_divide' >│</span>
    <A href="./update_file.do?dic_no=${dic_no}">파일 수정</A>  
  </ASIDE> 
  
      <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_dic_no_search_paging.do'>
      <input type='text' name='dic_word' id='dic_word' value='${param.dic_word }' style='width: 20%;'>
      <button type='submit'>검색</button>
      <c:if test="${param.dic_word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_dic_no_search_paging.do&dic_word='">검색 취소</button>
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style='text-align: center; width: 50%; float: left;'>
          <c:set var="file1saved" value="${brdicVO.file1saved.toLowerCase() }" />
          <c:set var="thumb1" value="${brdicVO.thumb1 }" />
          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <IMG src="/brdic/storage/${file1saved }" style='width: 90%;'> 
            </c:when>
            <c:otherwise> <!-- 이미지가 없는 경우 -->
              글에 대한 이미지가 없습니다.
            </c:otherwise>
          </c:choose>
        </DIV>

        <DIV style='text-align: left; width: 47%; float: left;'>
          <span style='font-size: 1.5em;'>${dic_name}</span>
          <br>
          <FORM name='frm' method='POST' action='./delete.do'>
              <input type='hidden' name='dic_no' value='${param.dic_no}'>
              <input type='hidden' name='now_page' value='${param.now_page }'>
              
              <DIV id='panel1' style="width: 40%; text-align: center; margin: 10px auto;"></DIV>
                    
              <div class="form-group">   
                <div class="col-md-12" style='text-align: center; margin: 10px auto;'>
                  <span style="color: #FF0000; font-weight: bold;">삭제를 진행 하시겠습니까? 삭제하시면 복구 할 수 없습니다.</span><br><br>
                  패스워드 <input type='password' name='passwd' value='1234' required="required" style='width: 30%;' autofocus="autofocus">
                  <br><br>
                  <button type = "submit" class="btn btn-primary">삭제 진행</button>
                  <button type = "button" onclick = "history.back()" class="btn btn-primary">취소</button>
                </div>
              </div>   
          </FORM>
        </DIV>
      </li>
      <li class="li_none">

      </li>   
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>


