<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>recommend</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
  $(function(){
      $('#btn_next').on('click', function() {   // 다음
          // alert($('#step1').prop('checked'));
          if ($('#step1_1').prop('checked') == true | $('#step1_2').prop('checked') == true | $('#step1_3').prop('checked') == true | $('#step1_4').prop('checked') == true | $('#step1_5').prop('checked') == true) {
              // alert('submit 진행');
              frm.submit();
          } else {
              alert('평가를 해주셔야 해요');
          }
      });       
  });
</script>
    <style>
        .container{
            text-align: center;
        }

        .td_image{
            vertical-align: middle;
            padding: 5px;
            cursor: pointer;
        }

        
        .td_radio{
            vertical-align: middle;
            padding: 5px;
        }

        .td_radio_select {
            cursor: pointer;
        }

    </style>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
    <H2 style="text-align:center;">날 평가해봐(*￣3￣)╭</H2>
  
  <DIV class='menu_line'></DIV>
  <div style="text-align:center; margin: 30px auto">
  9개 빵에 평가를 해주시면 빵파고가 당신에게 가장 잘 맞는 빵을 추천해줄거예요🤩<br>(7/9)
  </div>
  <FORM name='frm' method='POST' action='./create7.do' class="form-horizontal"
             enctype="multipart/form-data">
    <input type="hidden" name="memberno" value="${memberno}">
    <input type="hidden" name="breadno" value="53">
    
    <div class="form-group">
        <TABLE style='margin: 0px auto;'>
            <tr>
            <td></td>
            <td style="width: 100px;">⭐⨉1개</td>
            <td style="width: 100px;">⭐⨉2개</td>
            <td style="width: 100px;">⭐⨉3개</td>
            <td style="width: 100px;">⭐⨉4개</td>
            <td style="width: 100px;">⭐⨉5개</td>
            </tr>
            <TR>
                <TD class='td_image'>
                    <img id='img1' src="/survey/images/7.5 머핀2.jpg" style='float:left; width: 150px'><br>
                    7번 "머핀"
                </TD>
                <TD class='td_radio'>
                    <input type='radio' name='rating' id='step1_1' value='1' class='td_radio_select'>
                </TD>
                <TD class='td_radio'>
                    <input type='radio' name='rating' id='step1_2' value='2' class='td_radio_select'>
                </TD>
                <TD class='td_radio'>
                    <input type='radio' name='rating' id='step1_3' value='3' class='td_radio_select'>
                </TD>
                <TD class='td_radio'>
                    <input type='radio' name='rating' id='step1_4' value='4' class='td_radio_select'>
                </TD>
                <TD class='td_radio'>
                    <input type='radio' name='rating' id='step1_5' value='5' class='td_radio_select'>
                </TD>
            </TR>
                        
        </TABLE>
</div>
      <div style="text-align:center;">
      <button type="button" id="btn_next" class="btn btn-primary">다음</button>
    </div>
  
  </FORM>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
