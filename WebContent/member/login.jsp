<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css?ver=6" rel="stylesheet" type="text/css" media="all" />

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
<%
	String msg = (String)session.getAttribute("msg");	
	if(msg!=null)
	{
	%>
	<script>
		swal({
    		  title : "",
			  text: "<%= msg %>",
    		  confirmButtonText: "확인",
    		  type : "error"
    		  });
	</script>
	<%
	}
	session.removeAttribute("msg");
%>
<div class="login-page">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1">로 그 인</h3>  
			<div class="login-body">
				<form action="loginproc.eun" method="post">
					<input type="text" class="user" name="id" placeholder="아이디" required="">
					<input type="password" name="pw" class="lock" placeholder="비밀번호" required="">
					<input type="submit" value="로그인">
					<div class="forgot-grid">
						<a href="findid.eun">아이디 찾기</a>
						<div class="forgot2">
							<a href="findpw.eun">비밀번호 찾기</a>
						</div>
						<div class="clearfix"> </div>
					</div>
				</form>
			</div>  
			<h6> 아직 회원이 아니라면 <a href="signup.eun">회원가입하러 가기 »</a> </h6> 
		</div>
	</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>