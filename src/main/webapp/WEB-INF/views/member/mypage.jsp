<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
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
      <div class='menu_line'></div>
        
        <h2>마이페이지</h2>
        <p>종합적인 회원정보 조회 페이지</p>
        <div class="panel-group">
        
          <div class="panel panel-warning">
            <div class="panel-heading">빵파고 프로필</div>
            <div class="panel-body">          
              <p>빵파고에서 '나'를 표현하는 프로필 정보입니다.<br>수정화면에서 프로필 사진과 닉네임을 변경하세요.</p>
              <TABLE class="table table-condensed" style='width: 100%;'>
                <colgroup>
                  <col style='width: 30%;'/>
                  <col style='width: 35%;'/>
                  <col style='width: 35%;'/>
                </colgroup>
                <TR>
                  <TH class='th_bs'>프로필사진</TH>
                  <TH class='th_bs'>아이디</TH>
                  <TH class='th_bs'>닉네임</TH>
                </TR>
                <TR>
                  <TH class='th_bs'>[사진]</TH>
                  <TH class='th_bs'>아이디</TH>
                  <td class='th_bs'>nickname 출력 셀</td>
                </TR>
                <!--수정 필요-->
                <!-- <c:forEach var="memberVO" items="${list }">
                  <c:set var="id" value ="${memberVO.id}" />
                  <c:set var="nickname" value ="${memberVO.nickname}" />
                    
                  <TR>
                    <TD class='td_basic'>${id}</TD>
                    <TD class='td_basic'>${nickname}</TD>
                  </TR>
                </c:forEach> -->
              </TABLE>
              <DIV class='bottom_menu'>
                <A href="./read.do?memberno=${memberno}"><IMG src='/member/images/update.png' title='수정'></A>
              </DIV>
            </div>
          </div>
          
          <div class="panel panel-warning">
            <div class="panel-heading">연락처</div>
            <div class="panel-body">
              <p>빵파고에서 본인 인증을 할 때 사용하는 연락처 정보입니다.<br>
              보다 안전한 정보 보호를 위해 등록된 연락처의 일부만 보여드립니다.<br>
              정확한 연락처 정보는 수정화면에서 확인 가능합니다.</p>
              <TABLE class="table table-condensed" style='width: 100%;'>
                <colgroup>
                  <col style='width: 50%;'/>
                  <col style='width: 50%;'/>
                </colgroup>
                <TR>
                  <TH class='th_bs'>이메일</TH>
                  <TH class='th_bs'>휴대전화</TH>
                </TR>

                <TR>
                  <td class='th_bs'>email 출력 셀</td>
                  <td class='th_bs'>tel 출력 셀</td>
                </TR>
                <!--수정 필요-->
                <!-- <c:forEach var="memberVO" items="${list }">
                  <c:set var="email" value ="${memberVO.email}" />
                  <c:set var="tel" value ="${memberVO.tel}" />
                    
                  <TR>
                    <TD class='td_basic'>${email}</TD>
                    <TD class='td_basic'>${tel}</TD>
                  </TR>
                </c:forEach> -->
              </TABLE>
              <DIV class='bottom_menu'>
                <A href="./read.do?memberno=${memberno}"><IMG src='/member/images/update.png' title='수정'></A>
              </DIV>

            </div>
          </div>
          <div class="panel panel-warning">
            <div class="panel-heading">최애빵</div>
            <div class="panel-body">
                      <p>빵파고에서 빵을 추천받기 위한 취향정보입니다.<br>
                          설문조사를 통해 나만의 빵을 추천 받아보세요.</p>
            </div>
          </div>
          
          <div class="panel panel-warning">
            <div class="panel-heading">등급</div>
            <div class="panel-body">
                      <p>빵파고 커뮤니티에서 얼마나 활동하였는지 알려주는 등급입니다.<br>
                          다양한 빵파고의 활동을 통해 등급을 상승시켜 보세요.</p>
            </div>
          </div>
          
        </div>

    </div>
     

 </DIV>
 
 <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>