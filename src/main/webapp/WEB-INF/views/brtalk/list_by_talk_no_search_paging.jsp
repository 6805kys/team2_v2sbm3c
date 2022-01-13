<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" talk="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Bread recommended</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
  function recom_ajax(talk_no, status_count) {
    console.log("-> recom_" + status_count + ": " + $('#recom_' + status_count).html());  // A tag body      
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
          var str = '';
          if (rdata.cnt == 1) {
            // $('#span_animation_' + status_count).hide();   // SPAN 태그에 animation 출력
            $('#recom_' + status_count).html('👍('+rdata.recom+')');     // A 태그에 animation 출력
          } else {
            // $('#span_animation_' + status_count).html("X");
            $('#recom_' + status_count).html('👍(X)');
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

    $('#recom_' + status_count).html("<img src='/brtalk/images/ani04.gif' style='width: 10%;'>");
    // $('#span_animation_' + status_count).css('text-align', 'center');
    // $('#span_animation_' + status_count).html("<img src='/talks/images/ani04.gif' style='width: 10%;'>");
    // $('#span_animation_' + status_count).show(); // 숨겨진 태그의 출력
      
  }  

</script>
 
</head> 
  
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'> 🍞HOT빵톡🍞 </DIV>

<DIV class='talk_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_talk_no_search_paging.do">HOME</A>
  </ASIDE> 

<DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_talk_no_search_paging.do'>
      <input type='text' name='talk_word' id='talk_word' value='${param.talk_word }' style='width: 20%;'>
      <button type='submit'>검색</button>
      <c:if test="${param.talk_word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_talk_no_search_paging.do&talk_word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 400%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 40%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
     <%-- table 컬럼 --%>
     <thead>
      <tr>
       <th style='text-align: center;'>작성자</th> 
       <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>등록일</th>
         <th style='text-align: center;'>수정일</th>
         <th style='text-align: center;'>조회수</th>
        <th style='text-align: center;'>추천수</th>
       <th style='text-align: center;'>🔧</th> 
      </tr>
    
    </thead>  
    
 <%-- table 내용 --%>
    <tbody>
      <c:forEach var="brtalkVO" items="${list }">
        <c:set var="talk_no" value="${brtalkVO.talk_no }" />
        <c:set var="talk_id" value="${brtalkVO.talk_id }" />
        <c:set var="talk_name" value="${brtalkVO.talk_name }" />
        <c:set var="talk_crtime" value="${brtalkVO.talk_crtime.substring(0, 10) }" />
        <c:set var="talk_mdtime" value="${brtalkVO.talk_mdtime.substring(0, 10) }" />
        <c:set var="recom" value="${brtalkVO.recom }" />
        <c:set var="talk_view" value="${brtalkVO.talk_view }" />
        
<tr> 
          <td style='vertical-align: middle; text-align: center;'>${brtalkVO.talk_id}</td>
          <td style='vertical-align: middle; text-align: center;'>
            <a href="./read.do?talk_no=${talk_no}"><strong>${talk_name}</a> 
          </td> 
          <td style='vertical-align: middle; text-align: center;'>${brtalkVO.talk_crtime.substring(0, 10)}</td>
          <td style='vertical-align: middle; text-align: center;'>${brtalkVO.talk_mdtime.substring(0, 10)}</td>
          <td style='vertical-align: middle; text-align: center;'>${brtalkVO.talk_view}</td>
          <td style='vertical-align: middle; text-align: center;'>
            <%-- <span><A id="recom_${status.count }" href="javascript:recom_ajax(${talk_no }, ${status.count })" class="recom_link">👍(${recom })</A></span> --%>
            <form>
          <button type='button' id="btn_recom" class="btn btn-info">👍(${recom })</button>
          <span id="span_animation"></span>
          </form>
          </td> 
          <td style='vertical-align: middle; text-align: center;'>
            <A href="./update_text.do?talk_no=${talk_no}&now_page=${now_page }"><span class="glyphicon glyphicon-pencil"></span></A>
            <A href="./delete.do?talk_no=${talk_no}&now_page=${now_page }"><span class="glyphicon glyphicon-trash"></span></A>
          </td>
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
  
  <!-- 페이지 목록 출력 부분 시작 -->
  <DIV class='bottom_menu'>${paging }</DIV> <%-- 페이지 리스트 --%>
  <!-- 페이지 목록 출력 부분 종료 -->
  
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>


