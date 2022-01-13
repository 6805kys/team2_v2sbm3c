<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="notice_no" value="${brnoticeVO.notice_no }" />
<c:set var="notice_id" value="${brnoticeVO.notice_id }" />
<c:set var="notice_name" value="${brnoticeVO.notice_name }" />        
<c:set var="notice_post" value="${brnoticeVO.notice_post}" />
<c:set var="recom" value="${brnoticeVO.recom }" />
<c:set var="notice_word" value="${brnoticeVO.notice_word }" />
 
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
	  $('#btn_recom').on("click", function() { update_recom_ajax(${notice_no}); });
  });

  function update_recom_ajax(notice_no) {
    // console.log('-> noticesno:' + noticesno);
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'notice_no=' + notice_no; // 공백이 값으로 있으면 안됨.
    $.ajax(
      {
        url: '/brnotice/update_recom_ajax.do',
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
    $('#span_animation').html("<img src='/brnotice/images/ani04.gif' style='width: 8%;'>");
    $('#span_animation').show(); // 숨겨진 태그의 출력
  }  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
 <DIV class='title_line'> 🍞공지사항🍞 </DIV>
</DIV>

<DIV class='notice_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <%--<A href="./list_by_notice_no_search_paging.do&now_page=${param.now_page}&notice_word=${param.notice_word }">기본 목록형</A>--%>
    <A href="./list_by_notice_no_search_paging.do">HOME</A>     
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?notice_no=${notice_no}&now_page=${param.now_page}">수정</A>  
    <span class='menu_divide' >│</span>
    <A href="./delete.do?notice_no=${notice_no}&now_page=${param.now_page}">삭제</A>  
  </ASIDE> 
  
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_notice_no_search_paging.do'>
      <c:choose>
        <c:when test="${param.notice_word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='notice_word' id='notice_word' value='${param.notice_word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='notice_word' id='notice_word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.notice_word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_notice_no_search.do&notice_word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 100%; float: left; margin-bottom: 80px;">
          <span style="font-size: 2.0em; font-weight: bold;">${notice_name }</span><br>
          <br><DIV>${notice_post }</DIV>
        </DIV>
        <form>
          <button type='button' id="btn_recom" class="btn btn-info">👍(${recom })</button>
          <span id="span_animation"></span>
          </form>
      </li>
      <li class="li_none">
        <DIV style='text-decoration: none;'>
          검색어(키워드): ${notice_word }
        </DIV>
      </li>
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

