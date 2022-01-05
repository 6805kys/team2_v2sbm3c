<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Project 빵파고 > Mypage</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
  $(function(){
      $('#btn_close').on('click', setFocus); // Dialog창을 닫은후의 focus 이동
      $('#btn_send').on('click', send); 
  });
</script>
</head>

<body>
<jsp:include page="../menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    빵파고 마이페이지
  </DIV>
  <DIV class='content_body'>   
      <div class="container">
        <ASIDE class="aside_right">
          <A href="javascript:location.reload();">새로고침</A>
        </ASIDE>
          
        <FORM name='frm' id='frm' method='POST' action='./update.do' onsubmit="return send();" class="form-horizontal">
          <input type='hidden' name='memberno' id='memberno' value='${memberVO.memberno }'>     
          <input type='hidden' name='id' id='id' value='${memberVO.id }'>
          <input type='hidden' name='gradeno' id='gradeno' value='${memberVO.gradeno }'>        
          
          <h2>마이페이지</h2>
          <p>종합적인 회원정보 조회 페이지</p>
          <div class="panel-group">
          
            <div class="panel panel-default">
              <div class="panel-heading">빵파고 프로필</div>
              <div class="panel-body">
                        <p>빵파고에서 '나'를 표현하는 프로필 정보입니다.<br>
                            수정화면에서 프로필 사진과 닉네임을 변경하세요.</p>
              </div>
            </div>
            
            <div class="panel panel-default">
              <div class="panel-heading">연락처</div>
              <div class="panel-body">
                        <p>빵파고에서 본인 인증을 할 때 사용하는 연락처 정보입니다.<br>
                            보다 안전한 정보 보호를 위해 등록된 연락처의 일부만 보여드립니다.<br>
                            정확한 연락처 정보는 수정화면에서 확인 가능합니다.</p>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading">최애빵</div>
              <div class="panel-body">
                        <p>빵파고에서 빵을 추천받기 위한 취향정보입니다.<br>
                            설문조사를 통해 나만의 빵을 추천 받아보세요.</p>
              </div>
            </div>
            
            <div class="panel panel-default">
              <div class="panel-heading">등급</div>
              <div class="panel-body">
                        <p>빵파고 커뮤니티에서 얼마나 활동하였는지 알려주는 등급입니다.<br>
                            다양한 빵파고의 활동을 통해 등급을 상승시켜 보세요.</p>
              </div>
            </div>
            
          </div>
        </FORM>
      </div>
     

 </DIV>
 
 <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>