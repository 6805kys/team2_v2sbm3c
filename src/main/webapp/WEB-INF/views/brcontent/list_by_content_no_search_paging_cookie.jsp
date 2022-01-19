<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Bread recommended</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
  function recom_ajax(content_no, status_count) {
    console.log("-> recom_" + status_count + ": " + $('#recom_' + status_count).html());  // A tag body      
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'content_no=' + content_no; // 공백이 값으로 있으면 안됨.
    $.ajax(
      {
        url: '/brcontent/update_recom_ajax.do',
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

    $('#recom_' + status_count).html("<img src='/brcontent/images/ani04.gif' style='width: 10%;'>");
    // $('#span_animation_' + status_count).css('text-align', 'center');
    // $('#span_animation_' + status_count).html("<img src='/contents/images/ani04.gif' style='width: 10%;'>");
    // $('#span_animation_' + status_count).show(); // 숨겨진 태그의 출력
      
  }  

  <%-- 로그인 --%>
  function login_ajax() {
    var params = "";
    params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    // params += '&${ _csrf.parameterName }=${ _csrf.token }';
    // console.log(params);
    // return;
    
    $.ajax(
      {
        url: '/member/login_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          console.log('-> login cnt: ' + rdata.cnt);  // 1: 로그인 성공
          
          if (rdata.cnt == 1) {
            // 쇼핑카트에 insert 처리 Ajax 호출
            $('#div_login').hide();
            // alert('로그인 성공');
            $('#login_yn').val('YES'); // 로그인 성공 기록
            cart_ajax_post(); // 쇼핑카트에 insert 처리 Ajax 호출     
            
          } else {
            alert('로그인에 실패했습니다.<br>잠시후 다시 시도해주세요.');
            
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

  }

  <%-- 쇼핑 카트에 상품 추가 --%>
  function cart_ajax(content_no) {
    var f = $('#frm_login');
    $('#content_no', f).val(content_no);  // 쇼핑카트 등록시 사용할 상품 번호를 저장.
    
    console.log('-> content_no: ' + $('#content_no', f).val()); 
    
    // console.log('-> id:' + '${sessionScope.id}');
    if ('${sessionScope.id}' != '' || $('#login_yn').val() == 'YES') {  // 로그인이 되어 있다면
        cart_ajax_post();
    } else { // 로그인 안된 경우
        $('#div_login').show();
    }

  }

  <%-- 쇼핑카트 상품 등록 --%>
  function cart_ajax_post() {
    var f = $('#frm_login');
    var contentsno = $('#content_no', f).val();  // 쇼핑카트 등록시 사용할 상품 번호.
    
    var params = "";
    // params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params += 'content_no=' + content_no;
    params += '&${ _csrf.parameterName }=${ _csrf.token }';
    console.log('-> cart_ajax_post: ' + params);
    // return;
    
    $.ajax(
      {
        url: '/cart/create.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          console.log('-> cart_ajax_post cnt: ' + rdata.cnt);  // 1: 쇼핑카트 등록 성공
          
          if (rdata.cnt == 1) {
            var sw = confirm('선택한 상품이 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?');
            if (sw == true) {
              // 쇼핑카트로 이동
              // location.href='/cart/list.do';
            }           
          } else {
            alert('선택한 상품을 장바구니에 담지못했습니다.<br>잠시후 다시 시도해주세요.');
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

  }
  
  
</script>
 
</head> 
  
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'> 🍞BEST포토존🍞 </DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_content_no_search_paging.do">HOME</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_content_no_grid.do">갤러리형</A>
  </ASIDE> 

<DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_content_no_search_paging.do'>
      <input type='text' name='content_word' id='content_word' value='${param.content_word }' style='width: 20%;'>
      <button type='submit'>검색</button>
      <c:if test="${param.content_word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_content_no_search_paging.do&content_word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 400%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 40%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
     <%-- table 컬럼 --%>
     <thead>
      <tr>
      <th style='text-align: center;'>작성자ID</th>
       <th style='text-align: center;'>🍞포토글🍞</th> 
       <th style='text-align: center;'> </th>
        <th style='text-align: center;'>등록일</th>
         <th style='text-align: center;'>수정일</th>
         <th style='text-align: center;'>조회수</th>
        <th style='text-align: center;'>추천수</th>
       <th style='text-align: center;'>🔧</th> 
      </tr>
    
    </thead>  
    
 <%-- table 내용 --%>
    <tbody>
      <c:forEach var="brcontentVO" items="${list }">
        <c:set var="content_no" value="${brcontentVO.content_no }" />
        <c:set var="content_id" value="${brcontentVO.content_id }" />
        <c:set var="thumb1" value="${brcontentVO.thumb1 }" />
        <c:set var="content_name" value="${brcontentVO.content_name }" />
        <c:set var="content_post" value="${brcontentVO.content_post }" />
        <c:set var="content_crtime" value="${brcontentVO.content_crtime.substring(0, 10) }" />
        <c:set var="content_mdtime" value="${brcontentVO.content_mdtime.substring(0, 10) }" />
        <c:set var="recom" value="${brcontentVO.recom }" />
        <c:set var="content_view" value="${brcontentVO.content_view }" />
        
<tr> 
          <td style='vertical-align: middle; text-align: center;'>${brcontentVO.content_id}</td>
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
               <a href="./read.do?content_no=${content_no}&now_page=${param.now_page }"><IMG src="/brcontent/storage/${thumb1 }" style="width: 120px; height: 80px;"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/brcontent/images/none1.png" style="width: 120px; height: 80px;">
              </c:otherwise>
            </c:choose>
          <td style='vertical-align: middle;'>
            <a href="./read.do?content_no=${content_no}"><strong>${content_name}</strong> ${content_post}</a> 
          </td> 
          <td style='vertical-align: middle; text-align: center;'>${brcontentVO.content_crtime.substring(0, 10)}</td>
          <td style='vertical-align: middle; text-align: center;'>${brcontentVO.content_mdtime.substring(0, 10)}</td>
          <td style='vertical-align: middle; text-align: center;'>${brcontentVO.content_view}</td>
          <td style='vertical-align: middle; text-align: center;'>
            <%-- <span><A id="recom_${status.count }" href="javascript:recom_ajax(${content_no }, ${status.count })" class="recom_link">👍(${recom })</A></span> --%>
            <form>
          <button type='button' id="btn_recom" class="btn btn-info">👍(${recom })</button>
          <span id="span_animation"></span>
          </form>
          </td> 
          <td style='vertical-align: middle; text-align: center;'>
            <A href="./update_text.do?content_no=${content_no}&now_page=${now_page }"><span class="glyphicon glyphicon-pencil"></span></A>
            <A href="./delete.do?content_no=${content_no}&now_page=${now_page }"><span class="glyphicon glyphicon-trash"></span></A>
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


