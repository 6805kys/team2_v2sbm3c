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

<DIV class='title_line'>빵 추천 게시판 > 알림</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${code == 'create_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">새로운 게시판 [${brpostVO.post_name }]를 등록했습니다.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${code == 'create_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">새로운 게시판 [${brpostVO.post_name }]을 등록하는데 실패했습니다.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${code == 'update_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">기존의 게시판 이름을 [${brpostVO.post_name }]로 수정했습니다.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${code == 'update_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">기존의 게시판을 수정하는데 실패했습니다.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${code == 'delete_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">기존의 게시판 [${brpostVO.post_name }]를 삭제하는데 성공했습니다.</span>
          </LI>                                                                      
        </c:when>        
        <c:when test="${code == 'delete_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">기존의 게시판 [${brpostVO.post_name }]를 삭제하는데 실패했습니다.</span>
          </LI>                                                                      
        </c:when> 
        <c:otherwise>
          <LI class='li_none_left'>
            <span class="span_fail">알 수 없는 에러로 작업에 실패했습니다.</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <c:choose>
          <c:when test="${msg == 'child_record_found' }">
            삭제하려는 게시판에 속한 게시글이 남아있습니다.<br>
            게시글을 모두 삭제해야 게시판을 삭제할 수 있습니다.<br>
            게시글을 모두 삭제해주세요.<br>
            『<A href="../brcontent/list_by_post_no.do?post_no=${param.post_no }">게시판별 게시글 삭제</A>』
          </c:when>
        </c:choose>
      </LI>
      <LI class='li_none'>
        <br>
        <c:choose>
            <c:when test="${cnt == 0 }">
                <button type='button' onclick="history.back()" class="btn">다시 시도</button>    
            </c:when>
        </c:choose>
        
        <button type='button' onclick="location.href='./list.do'" class="btn">목록</button>
      </LI>
    </UL>
  </fieldset>

</DIV>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>