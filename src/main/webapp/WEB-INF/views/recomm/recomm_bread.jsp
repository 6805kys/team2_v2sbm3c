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
    function recomm_bread(){
        var url = 'http://localhost:8000/recommend_view/final/?memberno=${memberno} ';
        var win = window.open(url, 'AI 서비스', 'width=700px, height=560px');

        var x = (screen.width - 700) / 2;
        var y = (screen.height - 560) / 2;

        win.moveTo(x, y); // 화면 중앙으로 이동
      }
   
  $(function(){
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

        a.recomm_click {
        font-size: 20px;
        text-decoration: none;
        }
        
        a.recoom_click:after {
        text-decoration: none;
        }
        
        a.recomm_click:hover {
        font-size: 40px;
        text-decoration: none;
        }
    </style>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
    <H2 style="text-align:center;">빵파고한테 추천받자/(@^0^@)/</H2> 
    
      <DIV class='menu_line'></DIV>
    
    
    <div style="text-align: center; margin:150px auto;">
    <a class="recomm_click" href="javascript: recomm_bread()">🍞추천받은 빵 확인🍞</a>
    </div>
</body>
 
</html>
