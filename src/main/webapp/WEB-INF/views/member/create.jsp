<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Project 빵파고 회원가입</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
  $(function() {
    $('#btn_checkID').on('click', checkID);
    $('#btn_checkNICKNAME').on('click', checkNICKNAME);
    $('#btn_close').on('click', setFocus); // Dialog창을 닫은후의 focus 이동
    $('#btn_send').on('click', send); 
  });

  // jQuery ajax 요청
  function checkID() {
    // $('#btn_close').attr("data-focus", "이동할 태그 지정");
    
    var frm = $('#frm'); // id가 frm인 태그 검색
    var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
    var params = '';
    var msg = '';

    if ($.trim(id).length == 0) { // id를 입력받지 않은 경우
      msg = '· ID를 입력하세요.<br>· ID 입력은 필수 입니다.<br>· ID는 3자이상 권장합니다.';
      
      $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
      $('#modal_title').html('ID 중복 확인'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#btn_close').attr("data-focus", "id");  // 닫기 버튼 클릭시 id 입력으로 focus 이동
      $('#modal_panel').modal();               // 다이얼로그 출력
      return false;
    } else {  // when ID is entered
      params = 'id=' + id;
      // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
      // alert('params: ' + params);

      $.ajax({
        url: './checkID.do', // spring execute
        type: 'get',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          // alert(rdata);
          var msg = "";
          
          if (rdata.cnt > 0) {
            $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
            msg = "이미 사용중인 ID 입니다.";
            $('#btn_close').attr("data-focus", "id");  // id 입력으로 focus 이동
          } else {
            $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
            msg = "사용 가능한 ID 입니다.";
            $('#btn_close').attr("data-focus", "passwd");  // passwd 입력으로 focus 이동
            $.cookie('checkId', 'TRUE'); // Cookie 기록
          }
          
          $('#modal_title').html('ID 중복 확인');  // 제목 
          $('#modal_content').html(msg);         // 내용
          $('#modal_panel').modal();               // 다이얼로그 출력
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      });

    }

  }

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

  function setFocus() {  // focus 이동
    // console.log('btn_close click!');
    
    var tag = $('#btn_close').attr('data-focus'); // data-focus 속성에 선언된 값을 읽음 
    // console.log('tag: ' + tag);
    
    $('#' + tag).focus(); // data-focus 속성에 선언된 태그를 찾아서 포커스 이동
  }

  function send() { // 회원 가입 처리
    // 패스워드를 정상적으로 2번 입력했는지 확인
    if ($('#passwd').val() != $('#passwd2').val()) {
      msg = '입력된 패스워드가 일치하지 않습니다.<br>';
      msg += "패스워드를 다시 입력해주세요.<br>"; 
      
      $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
      $('#modal_title').html('패스워드 일치 여부  확인'); // 제목 
      $('#modal_content').html(msg);  // 내용
      $('#modal_panel').modal();         // 다이얼로그 출력
      
      $('#btn_send').attr('data-focus', 'passwd');
      
      return false; // submit 중지
    }
    $('#frm').submit();
  }
        
</script>

</head>

<body>
    <jsp:include page="../menu/top.jsp" flush='false' />

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


  <DIV class='title_line'>Create account</DIV>

  <DIV class='content_body'>
    
  <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href='./create.do'>회원 가입</A>  
  </ASIDE> 

   <div class='menu_line'></div><br>


    <FORM name='frm' id='frm' method='POST' action='./create.do' class="form-horizontal">
    
    <div class="form-group" style="margin-top: auto;">
      <label for="id" class="col-md-5 control-label" style='font-size: 0.9em;'>ID</label>
      <div class="col-md-5">
            <input type='text' class="form-control" name='id' id='id' value='' required="required" style='width: 40%;' placeholder="아이디" autofocus="autofocus">
            <button type='button' id="btn_checkID" class="btn btn-info btn-md">중복확인</button>
            <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 -->
      </div>
    </div>

    <div class="form-group">
        <label for="passwd" class="col-md-5 control-label" style='font-size: 0.9em;'>Password</label>
        <div class="col-md-5">
            <input type='password' class="form-control" name='passwd' id='passwd' value='' required="required" style='width: 40%;' placeholder="패스워드">
        </div>
    </div>

    <div class="form-group">
        <label for="passwd2" class="col-md-5 control-label" style='font-size: 0.9em;'>Re-enter password</label>
        <div class="col-md-5">
            <input type='password' class="form-control" name='passwd2' id='passwd2' value='' required="required" style='width: 40%;' placeholder="패스워드확인">
        </div>
    </div>

    <div class="form-group" style="margin-bottom: auto;">
        <label for="nickname" class="col-md-5 control-label" style='font-size: 0.9em;'>Nickname</label>
        <div class="col-md-5">
            <input type='text' class="form-control" name='nickname' id='nickname' value='' required="required" style='width: 40%;' placeholder="닉네임">
            <button type='button' id="btn_checkNICKNAME" class="btn btn-info btn-md">중복확인</button>
            <SPAN id='nickname_span'></SPAN> <!-- NICKNAME 중복 관련 메시지 -->
        </div>
    </div>
    <br>

    <div class='menu_line'></div>
    
    <div class="form-group">
        <div class="col-6-6 text-center">
            <text style="color: darkgrey; font-size: 8px;">약관 & 개인정보처리방침에 동의하며 빵파고에 가입합니다.</text><br>
            <button type="button" id='btn_send' class="btn btn-primary btn-md">Create your 빵파고 account</button>
            <button type="button" onclick="history.back()" class="btn btn btn-md">취소</button>
        </div>
    </div>
    </FORM>

    </DIV>

    <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>