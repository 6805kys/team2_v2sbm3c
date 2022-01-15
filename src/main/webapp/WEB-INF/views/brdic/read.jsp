<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dic_no" value="${brdicVO.dic_no }" />
<c:set var="dic_name" value="${brdicVO.dic_name }" />        
<c:set var="file1" value="${brdicVO.file1 }" />
<c:set var="file1saved" value="${brdicVO.file1saved }" />
<c:set var="thumb1" value="${brdicVO.thumb1 }" />
<c:set var="dic_post" value="${brdicVO.dic_post}" />
<c:set var="recom" value="${brdicVO.recom }" />
<c:set var="dic_word" value="${brdicVO.dic_word }" />
<c:set var="size1_label" value="${brdicVO.size1_label }" />
 
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
	  $('#btn_recom').on("click", function() { update_recom_ajax(${dic_no}); });
  });

  function update_recom_ajax(dic_no) {
    // console.log('-> dicsno:' + dicsno);
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'dic_no=' + dic_no; // 공백이 값으로 있으면 안됨.
    $.ajax(
      {
        url: '/brdic/update_recom_ajax.do',
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
    $('#span_animation').html("<img src='/brdic/images/ani04.gif' style='width: 8%;'>");
    $('#span_animation').show(); // 숨겨진 태그의 출력
  }  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
 <DIV class='title_line'> 🍞빵 백과사전🍞 </DIV>
</DIV>

<DIV class='dic_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <%--<A href="./list_by_dic_no_search_paging.do&now_page=${param.now_page}&dic_word=${param.dic_word }">기본 목록형</A>--%>
    <A href="./list_by_dic_no_search_paging.do">HOME</A>     
    <span class='menu_divide' >│</span>
    <A href="./list_by_dic_no_grid.do">갤러리형</A>
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?dic_no=${dic_no}&now_page=${param.now_page}">수정</A>
    <span class='menu_divide' >│</span>
    <A href="./update_file.do?dic_no=${dic_no}&now_page=${param.now_page}">파일 수정</A>  
    <span class='menu_divide' >│</span>
    <A href="./delete.do?dic_no=${dic_no}&now_page=${param.now_page}">삭제</A>  
  </ASIDE> 
  
  <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_dic_no_search_paging.do'>
      <c:choose>
        <c:when test="${param.dic_word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='dic_word' id='dic_word' value='${param.dic_word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='dic_word' id='dic_word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.dic_word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_dic_no_search.do&dic_word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <c:set var="file1saved" value="${file1saved.toLowerCase() }" />
        <DIV style="width: 50%; float: left; margin-right: 10px;">
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/dics/storage/ --%>
                <IMG src="/brdic/storage/${file1saved }" style="width: 90%;"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/brdic/images/none1.png" style="width: 100%;"> 
              </c:otherwise>
            </c:choose>
        </DIV>
        <DIV style="width: 47%; height: 460px; float: left; margin-right: 10px; margin-bottom: 30px;">
          <span style="font-size: 1.5em; font-weight: bold;">${dic_name }</span><br>
          <br><DIV>${dic_post }</DIV>
        </DIV> 
        <form>
          <button type='button' id="btn_recom" class="btn btn-info">👍(${recom })</button>
          <span id="span_animation"></span>
          </form>
      </li>
      <li class="li_none">
        <DIV style='text-decoration: none;'>
          검색어(키워드): ${dic_word }
        </DIV>
      </li>
      <li class="li_none">
        <DIV>
          <c:if test="${file1.trim().length() > 0 }">
            첨부 파일: <A href='/download?dir=/brdic/storage&filename=${file1saved}&downname=${file1}'>${file1}</A> (${size1_label})  
          </c:if>
        </DIV>
      </li>   
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

