<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 

<title>Bread recommended http://localhost:9091</title>
<!-- /static 기준 -->
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    
</head>
<body>
<jsp:include page="./menu/top.jsp" flush='false' />
  
  <DIV style='width: 100%; margin: 30px auto; text-align: center;'>
    <%-- /static/images/resort02.jpg --%>
    <IMG src='/images/bakery01.jpg' style='width: 50%;'>
  </DIV>
  
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'>
     </DIV>
     <DIV style='float: left; width: 50%;'>
    </DIV>  
  </DIV>
 
  <DIV style='width: 94.8%; margin: 0px auto;'>
  </DIV>  
 
<jsp:include page="./menu/bottom.jsp" flush='false' />
 
</body>
</html>

<!-- 
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<title>Design House</title>
<!-- /static 기준
<link  rel="Stylesheet" href="/css/style2 .css">
    
</head>
<body>
<div class="container">
 <div class="header">
  <h1><a href="#">DESIGN</a></h1>
  <div class="nav">
   <ul>
    <li><a href="#">HOME</a></li>
    <li><a href="#">BEDROOM</a></li>
    <li><a href="#">DINING</a></li>
    <li><a href="#">KITCHEN</a></li>
    <li><a href="#">BACKYARD</a></li>
   </ul>
  </div>
</div>
<div class="hero">
<h2>DESIGN YOUR HOUSE</h2>
<p>Subscribe Easy Youtube Channel to watch more videos,<br>press the hell icon to<p>
<button>WATCH VIDEOS</button>
</div>
</div>
</body>
</html>   -->
