<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css?ver=5" rel="stylesheet" type="text/css" media="all" />

<script src="js/jquery.min.js"></script>
<script src="js/simpleCart.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/jquery.countdown.css" />
<link href="css/animate.min.css" rel="stylesheet"> 
<script src="js/wow.min.js"></script>
<script>
 new WOW().init();
</script>
<link href="css/loginstyle.css?ver=1" rel="stylesheet" type="text/css" media="all" /> 
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<script src="dist/sweetalert.min.js"></script>
</head>
<body>
<jsp:include page="../include/top.jsp"/>
	<div class="login-page">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1">아이디 찾기</h3>  
			<div class="login-body">
				<form action="findidproc.eun" method="post">
					<input type="text" class="user" name="name" placeholder="이름" required="">
					<input type="email" class="user" id="email" name="email" placeholder="이메일" required="">
					<input type="text" class="user" name="phone" placeholder="연락처 예)010-1234-5678" required="">
					<input type="submit" value="아이디 찾기">
				</form>
			</div>  
			<h6><a href="findpw.eun">비밀번호 찾으러 가기 »</a> </h6> 
		</div>
	</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>