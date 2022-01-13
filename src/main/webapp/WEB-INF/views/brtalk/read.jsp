<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="talk_no" value="${brtalkVO.talk_no }" />
<c:set var="talk_id" value="${brtalkVO.talk_id }" />
<c:set var="talk_name" value="${brtalkVO.talk_name }" />        
<c:set var="talk_post" value="${brtalkVO.talk_post}" />
<c:set var="recom" value="${brtalkVO.recom }" />
<c:set var="talk_word" value="${brtalkVO.talk_word }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" talk="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Bread recommended</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
  $(function(){
	  $('#btn_recom').on("click", function() { update_recom_ajax(${talk_no}); });
  });

  function update_recom_ajax(talk_no) {
    // console.log('-> talksno:' + talksno);
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'talk_no=' + talk_no; // 공백이 값으로 있으면 안됨.
    $.ajax(
      {
        url: '/brtalk/update_recom_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          // console.log('-> rdata: '+ rdata);
          var str = '';
          if (rdata.cnt == 1) {
            // console.log('-> btn_recom: ' + $('#btn_recom').val());  // X
            // console.log('-> btn_recom: ' + $('#btn_recom').html());
            $('#btn_recom').html('👍('+rdata.recom+')');
            $('#span_animation').hide();
          } else {
            $('#span_animation').html("지금은 추천을 할 수 없습니다.");
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

    // $('#span_animation').css('text-align', 'center');
    $('#span_animation').html("<img src='/brtalk/images/ani04.gif' style='width: 8%;'>");
    $('#span_animation').show(); // 숨겨진 태그의 출력
  }  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
 <DIV class='title_line'> 🍞HOT빵톡🍞 </DIV>
</DIV>

<DIV class='talk_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <%--<A href="./list_by_talk_no_search_paging.do&now_page=${param.now_page}&talk_word=${param.talk_word }">기본 목록형</A>--%>
    <A href="./list_by_talk_no_search_paging.do">HOME</A>     
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?talk_no=${talk_no}&now_page=${param.now_page}">수정</A>  
    <span class='menu_divide' >│</span>
    <A href="./delete.do?talk_no=${talk_no}&now_page=${param.now_page}">삭제</A>  
  </ASIDE> 
  
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_talk_no_search_paging.do'>
      <c:choose>
        <c:when test="${param.talk_word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='talk_word' id='talk_word' value='${param.talk_word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='talk_word' id='talk_word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.talk_word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_talk_no_search.do&talk_word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 100%; float: left; margin-bottom: 80px;">
          <span style="font-size: 2.0em; font-weight: bold;">${talk_name }</span><br>
          <br><DIV>${talk_post }</DIV>
        </DIV>
        <form>
          <button type='button' id="btn_recom" class="btn btn-info">👍(${recom })</button>
          <span id="span_animation"></span>
          </form>
      </li>
      <li class="li_none">
        <DIV style='text-decoration: none;'>
          검색어(키워드): ${talk_word }
        </DIV>
      </li>
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

