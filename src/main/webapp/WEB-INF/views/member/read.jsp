<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Project 빵파고 > 마이페이지</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<script type="text/javascript">
  $(function(){
      $('#btn_checkNICKNAME').on('click', checkNICKNAME);
      $('#btn_close').on('click', setFocus); // Dialog창을 닫은후의 focus 이동
      $('#btn_send').on('click', send); 
  });

  // jQuery ajax 요청
  function checkNICKNAME() {
      // $('#btn_close').attr("data-focus", "이동할 태그 지정");
      
      var frm = $('#frm'); // id가 frm인 태그 검색
      var id = $('#nickname', frm).val(); // frm 폼에서 id가 'nickname'인 태그 검색
      var params = '';
      var msg = '';
    
      if ($.trim(id).length == 0) { // id를 입력받지 않은 경우
        msg = '· 닉네임을 입력하세요.<br>· 닉네임 입력은 필수 입니다.<br>· 닉네임는 3자이상 권장합니다.';
        
        $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
        $('#modal_title').html('NICKNAME 중복 확인'); // 제목 
        $('#modal_content').html(msg);        // 내용
        $('#btn_close').attr("data-focus", "nickname");  // 닫기 버튼 클릭시 id 입력으로 focus 이동
        $('#modal_panel').modal();               // 다이얼로그 출력
        return false;
      } else {  // when nickname is entered
        params = 'nickname=' + nickname;
        // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
        // alert('params: ' + params);
    
        $.ajax({
          url: './checkNICKNAME.do', // spring execute
          type: 'get',  // post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
          dataType: 'json', // 응답 형식: json, html, xml...
          data: params,      // 데이터
          success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
            alert(rdata);
            var msg = "";
            
            if (rdata.cnt > 0) {
              $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
              msg = "이미 사용중인 닉네임 입니다.";
              $('#btn_close').attr("data-focus", "nickname");  // nickname 입력으로 focus 이동
            } else {
              $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
              msg = "사용 가능한 닉네임 입니다.";
              // $.cookie('checkId', 'TRUE'); // Cookie 기록
            }
            
            $('#modal_title').html('닉네임 중복 확인');  // 제목 
            $('#modal_content').html(msg);          // 내용
            $('#modal_panel').modal();              // 다이얼로그 출력
          },
          // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
          error: function(request, status, error) { // callback 함수
            console.log(error);
          }
        });
      }
  }
  
</script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    마이페이지 회원 정보 수정
  </DIV>

  <DIV class='content_body'>    
    <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
    </ASIDE> 
   
    <div class='menu_line'></div>
    
    <DIV id='main_panel'></DIV>
   
    <!-- ******************** Modal 알림창 시작 ******************** -->
    <div id="modal_panel" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                        data-dismiss="modal">×</button>
                    <h4 class="modal-title" id='modal_title'></h4>
                    <!-- 제목 -->
                </div>
                <div class="modal-body">
                    <p id='modal_content'></p>
                    <!-- 내용 -->
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn_close" data-focus=""
                        class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- ******************** Modal 알림창 종료 ******************** -->
      
    <FORM name='frm' id='frm' method='POST' action='./update.do' onsubmit="return send();" class="form-horizontal">
      <input type='hidden' name='memberno' id='memberno' value='${memberVO.memberno }'>          
      <input type='hidden' name='id' id='id' value='${memberVO.id }'>
      <input type='hidden' name='gradeno' id='gradeno' value='${memberVO.gradeno }'>             
      
      <div class="form-group">
            <label class="col-md-5 control-label" style='font-size: 0.9em;'>ID</label>
                <div class="col-md-5">${memberVO.id }</div>
      </div>
                        
      <div class="form-group">
        <label class="col-md-5 control-label" style='font-size: 0.9em;'>Nickname</label>
        <SPAN id='nickname_span'></SPAN>
        <div class="col-md-5">
          <input type='text' class="form-control" name='nickname' id='nickname' 
                     value='${memberVO.nickname }' required="required" autofocus="autofocus" 
                     style='width: 40%;'>
          <button type='button' id="btn_checkNICKNAME" class="btn btn-info btn-md">중복확인</button>
          <SPAN id='nickname_span'></SPAN>
          <!-- NICKNAME 중복 관련 메시지 -->
        </div>
      </div>   
   
      <div class="form-group">
        <label class="col-md-5 control-label" style='font-size: 0.9em;'>Tel</label>    
        <div class="col-md-5">
          <input type='text' class="form-control" name='tel' id='tel' 
                     value='${memberVO.tel }' required="required" style='width: 40%;' placeholder="전화번호">
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-5 control-label" style='font-size: 0.9em;'>Email</label>    
        <div class="col-md-5">
          <input type='text' class="form-control" name='email' id='email' 
                     value='${memberVO.email }' required="required" style='width: 40%;' placeholder="이메일">
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-5 control-label" style='font-size: 0.9em;'>등급번호</label>
        <div class="col-md-5">${memberVO.gradeno }</div>
        <!-- 등급변경으로 회원삭제 기능을 구현할수도 있음 -->
      </div>
     

      <div class="form-group">
        <div class="col-6-6 text-center">
          <button type="submit" class="btn btn-primary btn-md">저장</button>
          <button type="button" onclick="history.go(-1);" class="btn btn btn-md">취소</button>
   
        </div>
      </div>   
    </FORM>
  </DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
 
 