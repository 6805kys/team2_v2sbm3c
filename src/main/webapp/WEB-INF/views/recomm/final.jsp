<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>빵추천</title>
    <link href="/css/style.css" rel="Stylesheet" type="text/css">
    <script type="text/JavaScript"
                 src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">                 

    <script type="text/javascript">
        $(function() {
            send();  // Django ajax 호출
            $('#btn_previous').on('click', function() { history.back(); });   // 이전
            $('#btn_close').on('click', function() { window.close(); });      // 윈도우 닫기
        });

        function send() {
            var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
            // alert('params: ' + params);  // 수신 데이터 확인
            $.ajax({
              url: 'http://localhost:8000/recomm_view/final_ajax',  // Spring Boot -> Django 호출
              type: 'get',  // get or post
              cache: false, // 응답 결과 임시 저장 취소
              async: true,  // true: 비동기 통신
              dataType: 'json', // 응답 형식: json, html, xml...
              data: params,      // 데이터
              success: function(rdata) { // 응답이 온경우
                // alert(rdata.index);
                if (rdata.index == 0) {        // 개발 관련 도서 추천 필요
                    $('#dev').css('display','');
                } else if(rdata.index == 1) { // 해외 여행 관련 도서 추천 필요
                    $('#trip').css('display','');
                } else {                            // 소설 관련 도서 추천 필요
                    $('#novel').css('display','');
                } 

                $('#panel').html("");  // animation gif 삭제
                $('#panel').css('display', 'none'); // 숨겨진 태그의 출력

                // --------------------------------------------------
                // 분류 정보에 따른 상품 이미지 SELECT
                //  --------------------------------------------------
              },
              // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우
              error: function(request, status, error) { // callback 함수
                console.log(error);
              }
            });

            // $('#panel').html('처리중입니다....');  // 텍스트를 출력하는 경우
            $('#panel').html("<img src='/images/ani04.gif' style='width: 10%;'>");
            $('#panel').show(); // 숨겨진 태그의 출력
          }
    </script>

    <style>
        *{
            text-align: center;
        }

        .td_image{
            vertical-align: middle;
            padding: 5px;
            cursor: pointer;
        }

    </style>
    
</head>
<body>
        <input type='input' name='mem' value='${memberno }'>
        <input type='input' name='mem' value='${topbread }'>

당신이 좋아할 빵은 바로 <br><br> 👇 <br><br>
No.1 ${topbread} {{ topbread }} <br><br> No.2 {{ topbread2 }} <br><br> No.3 {{ topbread3 }}

<DIV style='display: none;'>
    <form name='frm' id='frm'>
        <input type='input' name='step1' value='${memberno }'>
    </form>
</DIV>

<DIV class="container">

    <DIV id='panel' style='margin: 30px auto; width: 90%;'></DIV>
    
    <DIV id='panel_img' style='margin: 0px auto; width: 90%;'>
        <DIV id='dev' style='display: none;'> <!-- 개발 관련 도서 추천 필요 -->
            <TABLE style='margin: 0px auto;'>
                <TR>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_book/images/v11.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img2' src="/recommend_book/images/v12.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_book/images/v13.jpg" style='float:left; height: 200px'>
                    </TD>
                </TR>          
            </TABLE>
        </DIV>
        <DIV id='trip' style='display: none;'>  <!-- 해외 여행 관련 도서 추천 필요 -->
            <TABLE style='margin: 0px auto;'>
                <TR>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_book/images/v21.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img2' src="/recommend_book/images/v22.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_book/images/v23.jpg" style='float:left; height: 200px'>
                    </TD>
                </TR>          
            </TABLE>
        </DIV>
        <DIV id='novel' style='display: none;'> <!-- 소설 관련 도서 추천 필요 -->
            <TABLE style='margin: 0px auto;'>
                <TR>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_book/images/v31.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img2' src="/recommend_book/images/v32.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_book/images/v33.jpg" style='float:left; height: 200px'>
                    </TD>
                </TR>          
            </TABLE>
        </DIV>
    </DIV>
    
    <form id='frm' name='frm' action='' method='GET'>
        <br>
        <DIV style="text-align:center;">
            <button type='button' id='btn_previous' class="btn btn-primary">이전</button>
            <button type='button' id='btn_close' class="btn btn-primary">종료</button>
        </DIV>
    </form>
</DIV>
</body>
</html>

